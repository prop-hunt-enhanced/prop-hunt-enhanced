PHE.LPS = {}

PHE.LPS.SOUNDS = {}
for _, sound in pairs(file.Find("sound/lps/*.wav", "GAME")) do
    table.insert(PHE.LPS.SOUNDS, sound)
end
for _, sound in pairs(file.Find("sound/lps/*.mp3", "GAME")) do
    table.insert(PHE.LPS.SOUNDS, sound)
end

for _, sound in pairs(PHE.LPS.SOUNDS) do
    resource.AddFile("sound/lps/" .. sound)
end

function lastPropStandingWeapon()
	if !(GetConVar("ph_last_prop_standing_weapon"):GetString() == "random") then
        PHE.LPS.WEAPON = GetConVar("ph_last_prop_standing_weapon"):GetString()
    end
end
lastPropStandingWeapon()
cvars.AddChangeCallback("ph_last_prop_standing_weapon", lastPropStandingWeapon())

include("sv_lps_config.lua")

function lastPropStandingSetup()
    if GetConVar("ph_enable_last_prop_standing"):GetBool() then
        GM.NoPlayerPlayerDamage = false
    else
        GM.NoPlayerPlayerDamage = true
    end
end
lastPropStandingSetup()
cvars.AddChangeCallback("ph_enable_last_prop_standing", lastPropStandingSetup

hook.Add("PlayerCanPickupWeapon", "LastPropStandingWeaponPickup", function(ply, ent)
    if PHE.LPS && GetConVar("ph_enable_last_prop_standing"):GetBool() && ply:Team() == TEAM_PROPS && GAMEMODE:GetTeamAliveCounts()[TEAM_PROPS] == 1 && ent:GetClass() == PHE.LPS.WEAPON then
		return true
	end
end)

hook.Add("EntityTakeDamage", "LastPropStandingNoHunterSelfExplode", function(ent, dmginfo)
    if GAMEMODE:InRound() && ent && ent:IsPlayer() && ent:Alive() && ent:Team() == TEAM_HUNTERS && dmginfo:GetAttacker() && dmginfo:GetAttacker():IsPlayer() && dmginfo:GetAttacker():Team() == TEAM_HUNTERS && dmginfo:IsExplosionDamage() then
        return true
    end
end)

hook.Add("WeaponEquip", "LastPropStandingNoHands", function(wep, ply)
	if ply:Team() == TEAM_PROPS then
        ply:GetHands():Remove()
    end
end)

function lastPropStandingTest(ply)
    if GetConVar("ph_enable_last_prop_standing"):GetBool() && !(ply:Team() == TEAM_HUNTERS || ply:Team() == TEAM_UNASSIGNED || ply:Team() == TEAM_SPECTATOR) then
        timer.Simple(0.1, function()
	        if GAMEMODE:GetTeamAliveCounts()[TEAM_PROPS] == 1 then
		        if GetConVar("ph_last_prop_standing_weapon"):GetString() == "random" then
                    PHE.LPS.WEAPON = PHE.LPS.WEAPONS[math.random(#PHE.LPS.WEAPONS)]
                end
                for _, pl in pairs(team.GetPlayers(TEAM_PROPS)) do
			        if pl:Alive() then
				        pl:Give(PHE.LPS.WEAPON)
				        pl:GiveAmmo(120, pl:GetActiveWeapon():GetPrimaryAmmoType(), true)
				    
				        PrintMessage(HUD_PRINTCENTER, PHE.LANG.HUD.LASTPROP)
                        BroadcastLua("surface.PlaySound(\"lps/" .. PHE.LPS.SOUNDS[math.random(#PHE.LPS.SOUNDS)] .. "\")")
                    
                        return
			        end
		        end
	        end
        end)
    end
end
hook.Add("PostPlayerDeath", "DeathLastPropStandingTest", lastPropStandingTest)
hook.Add("PlayerDisconnected", "DisconnectLastPropStandingTest", lastPropStandingTest)
