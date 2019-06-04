-- Props will autotaunt at specified intervals (put this crap on the server because the old way was all on the client and that's silly)
local function TauntTimeLeft(ply)
	-- Always return 1 when the conditions are not met
	if !IsValid(ply) || !ply:Alive() || ply:Team() != TEAM_PROPS then return 1; end
	
	local lastTauntTime = ply:GetNWFloat("LastTauntTime")
	local nextTauntTime = lastTauntTime + GetConVar("ph_autotaunt_delay"):GetInt()
	local currentTime = CurTime()
	return nextTauntTime - currentTime
end

local function AutoTauntThink()

	if GetConVar("ph_autotaunt_enabled"):GetBool() then

		local WHOLE_TAUNTS = PHE:GetAllTeamTaunt(TEAM_PROPS)
		for _, ply in ipairs(team.GetPlayers(TEAM_PROPS)) do
			local timeLeft = TauntTimeLeft(ply)
			
			if IsValid(ply) && ply:Alive() && ply:Team() == TEAM_PROPS && timeLeft <= 0 then
				local rand_taunt = table.Random(WHOLE_TAUNTS)
				if !isstring(rand_taunt) then rand_taunt = tostring(rand_taunt); end
				ply:EmitSound(rand_taunt, 100)
				ply:SetNWFloat("LastTauntTime", CurTime())
			end
		end
		
	end
end
timer.Create("AutoTauntThinkTimer", 1, 0, AutoTauntThink)
