-- For the love of furry heck, THIS PLACE NEEDS A CLEAN!
-- Props will autotaunt at specified intervals
local isEnabled = false
local isProp = false
local delay = 45
local started = false
local timerID = "ph_autotaunt_timer"
local teamCheckTimer = "ph_autotaunt_teamchecktimer"

local xStart
local xEnd
local y
local w = 140
local h = 30
local previousTime
local tweenTime = 0

local function TimeLeft()
	local ply = LocalPlayer()
	local lastTauntTime = ply:GetNWFloat("LastTauntTime")
	local nextTauntTime = lastTauntTime + delay
	local currentTime = CurTime()
	return nextTauntTime - currentTime
end

-- a: amplitude
-- p: period
local function outElastic(t, b, c, d, a, p)
	local pi = math.pi
	if t == 0 then return b end

	t = t / d

	if t == 1 then return b + c end

	if not p then p = d * 0.3 end

	local s

	if not a or a < math.abs(c) then
		a = c
		s = p / 4
	else
		s = p / (2 * pi) * math.asin(c / a)
	end

	return a * math.pow(2, - 10 * t) * math.sin((t * d - s) * (2 * pi) / p) + c + b
end

local function AutoTauntPaint()
	if !isEnabled || !isProp || !started then return; end

	if tweenTime < 1 then
		x = outElastic(tweenTime, xStart, xEnd - xStart, 1, 1, 0.5)
		local cTime = CurTime()
		tweenTime = tweenTime + (cTime - previousTime)
		previousTime = cTime
	end

	local timeLeft = math.ceil(TimeLeft())
	local percentage = timeLeft / delay

	local txt = "Auto taunting in " .. timeLeft

	draw.RoundedBox(5, x, y, w, h, Color(0, 0, 0, 200))
	draw.RoundedBox(5, x + 5, y + 5, (w - 10) * percentage, h - 10, Color(200, 0, 0, 200))
	draw.DrawText(txt, "HunterBlindLockFont", x + 70, ScrH() - 57, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
end
hook.Add("HUDPaint", "PH_AutoTauntPaint", AutoTauntPaint)

local function RemoveTimer()
	if timer.Exists(timerID) then
		timer.Destroy(timerID)
	end
end

local function CheckAutoTaunt()
	local timeLeft = TimeLeft()
	local ply = LocalPlayer()

	-- Stop everything under these conditions
	if !ply:Alive() || ply:Team() != TEAM_PROPS then
		started = false
		RemoveTimer()
		printVerbose("[PH:E AutoTaunt] Blocked!")
		return
	end
end

local function Setup()
	local ply = LocalPlayer()

	isEnabled = GetConVar("ph_autotaunt_enabled"):GetBool()
	isProp = ply:Team() == TEAM_PROPS
	started = true
	previousTime = CurTime()
	tweenTime = 0

	if isEnabled && isProp then
		delay = GetConVar("ph_autotaunt_delay"):GetInt()
		timer.Create(timerID, 1, 0, CheckAutoTaunt)
	end
end

local function CheckPlayer()
	local ply = LocalPlayer()

	if ply:Alive() && ply:Team() == TEAM_PROPS then
		if timer.Exists(teamCheckTimer) then
			timer.Destroy(teamCheckTimer)
		end

		Setup()
		return true
	end

	return false
end

local function AutoTauntSpawn()
	xStart = ScrW() + 200
	xEnd = ScrW() - 195
	y = ScrH() - 65

	if !CheckPlayer() then
		timer.Create(teamCheckTimer, 0.1, 10, CheckPlayer)
	end
end
net.Receive("AutoTauntSpawn", function() AutoTauntSpawn() end)

local function AutoTauntRoundEnd()
	started = false
	RemoveTimer()
end
net.Receive("AutoTauntRoundEnd", function() AutoTauntRoundEnd() end)
