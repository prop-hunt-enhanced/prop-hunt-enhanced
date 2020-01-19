CreateConVar("lps_enable", "1", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Give the last prop alive a weapon?")
CreateConVar("lps_weapon", "random", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Give which weapon (\"random\" from the config or by class name)?")
CreateConVar("lps_halo_enable", "1", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Draw a halo effect around the last prop?")
CreateConVar("lps_halo_color", "#14FA00", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Draw a halo effect of what color (\"rainbow\" or by hex code)?")
CreateConVar("lps_halo_walls", "0", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Draw the halo effect through walls?")
CreateConVar("lps_trail_enable", "1", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Draw a trail behind the last prop?")
CreateConVar("lps_trail_color", "#FFFFFF", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Draw a trail of what color (by hex code)?")
CreateConVar("lps_trail_texture", "trails/laser", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Draw a trail with what texture?")

math.randomseed(os.time())

PHE.LPS = {}

function lpsWeaponSetup()
	if !(GetConVar("lps_weapon"):GetString() == "random") then
        PHE.LPS.WEAPON = GetConVar("lps_weapon"):GetString()
    end
end
lpsWeaponSetup()
cvars.AddChangeCallback("lps_weapon", lpsWeaponSetup())

AddCSLuaFile("sh_lps_config.lua")
include("sh_lps_config.lua")

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
