-- Validity check to prevent some sort of spam
local function IsDelayed(ply)
	local lastTauntTime = ply:GetNWFloat("LastTauntTime")
	local delayedTauntTime = lastTauntTime + GetConVar("ph_customtaunts_delay"):GetInt()
	local currentTime = CurTime()
	return delayedTauntTime > currentTime
end

net.Receive("CL2SV_PlayThisTaunt", function(len, ply)
	local snd = net.ReadString()
	
	if IsValid(ply) && !IsDelayed(ply) then
		if file.Exists("sound/"..snd, "GAME") then
			ply:EmitSound(snd, 100)
			ply:SetNWFloat("LastTauntTime", CurTime())
		else
			ply:ChatPrint("[PH: Enhanced] - Warning: That taunt you selected does not exists on server!")
		end
	else
		ply:ChatPrint("[PH: Enhanced] - Please wait in few seconds...!")
	end
end)
