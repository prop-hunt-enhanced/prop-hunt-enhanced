local lpsconvar = CreateConVar("ph_enable_last_prop_standing", "1", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Give the last prop alive a weapon?")
local wepconvar = CreateConVar("ph_last_prop_standing_weapon", "random", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Give the last prop which weapon (by class name or \"random\" from the config)?")

hook.Add("EntityFireBullets", "LastPropStandingAim", function(ply, blt)
    if ply:IsPlayer() && ply:Team() == TEAM_PROPS then
        local eyeTrace = {}
        local aimTrace = {}
        if ply.ph_prop && ply.ph_prop:IsValid() then
            eyeTrace.filter = ply.ph_prop
            aimTrace.filter = ply.ph_prop
            blt.IgnoreEntity = ply.ph_prop
        end

        local _,plyHull = ply:GetHull()
		if plyHull.z < 24 then
			eyeTrace.start = ply:EyePos() + Vector(0, 0, plyHull.z + (24-  plyHull.z))
			eyeTrace.endpos = ply:EyePos() + Vector(0, 0, plyHull.z + (24 - plyHull.z)) + ply:EyeAngles():Forward() * 56756
		elseif plyHull.z > 84 then
			eyeTrace.start = ply:EyePos() + Vector(0, 0, plyHull.z - 84)
			eyeTrace.endpos = ply:EyePos() + Vector(0, 0, plyHull.z - 84) + ply:EyeAngles():Forward() * 56956
		else
			eyeTrace.start = ply:EyePos() + Vector(0, 0, 8)
			eyeTrace.endpos = ply:EyePos() + Vector(0, 0, 8) + ply:EyeAngles():Forward() * 56756
		end
        local eyeTraceResult = util.TraceLine(eyeTrace)

        aimTrace.start = blt.Src
        aimTrace.endpos = eyeTraceResult.HitPos
        local aimTraceResult = util.TraceLine(aimTrace)

        blt.Dir = aimTraceResult.Normal
        return true
    end
end)
