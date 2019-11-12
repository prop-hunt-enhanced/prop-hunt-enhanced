AddCSLuaFile("sh_lps.lua")
include("sh_lps.lua")

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

function lpsTrailSetup()
    nonHex, hexLength = string.gsub(GetConVar("lps_trail_color"):GetString(), "[%dABCDEFabcdef]", "")
    if hexLength == 6 then
        if nonHex == "#" then
            PHE.LPS.TRAIL = {
                R = tonumber(string.sub(GetConVar("lps_trail_color"):GetString(), 2, 3), 16),
                G = tonumber(string.sub(GetConVar("lps_trail_color"):GetString(), 4, 5), 16),
                B = tonumber(string.sub(GetConVar("lps_trail_color"):GetString(), 6, 7), 16)
            }
        elseif nonHex == "" then
            PHE.LPS.TRAIL = {
                R = tonumber(string.sub(GetConVar("lps_trail_color"):GetString(), 1, 2), 16),
                G = tonumber(string.sub(GetConVar("lps_trail_color"):GetString(), 3, 4), 16),
                B = tonumber(string.sub(GetConVar("lps_trail_color"):GetString(), 5, 6), 16)
            }
        else
            PHE.LPS.TRAIL = {R = 255, G = 255, B = 255}
            print("[WARN] PHE LPS: Convar lps_trail_color is not a valid hex code, using default #FFFFFF")
        end
    else
        PHE.LPS.TRAIL = {R = 255, G = 255, B = 255}
        print("[WARN] PHE LPS: Convar lps_trail_color is not a valid hex code, using default #FFFFFF")
    end
end
lpsTrailSetup()
cvars.AddChangeCallback("lps_trail_color", lpsTrailSetup())

function lpsSetup()
    if GetConVar("lps_enable"):GetBool() then
        GM.NoPlayerPlayerDamage = false
    else
        GM.NoPlayerPlayerDamage = true
    end
end
lpsSetup()
cvars.AddChangeCallback("lps_enable", lpsSetup())

hook.Add("PlayerCanPickupWeapon", "LastPropStandingWeaponPickup", function(ply, ent)
    if GetConVar("lps_enable"):GetBool() && ply:Team() == TEAM_PROPS && GAMEMODE:GetTeamAliveCounts()[TEAM_PROPS] == 1 && ent:GetClass() == PHE.LPS.WEAPON then
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

function lpsTest(ply)
    if ply.lps_trail && ply.lps_trail:IsValid() then
        ply.lps_trail:Remove()
    end

    if GetConVar("lps_enable"):GetBool() && !(ply:Team() == TEAM_HUNTERS || ply:Team() == TEAM_UNASSIGNED || ply:Team() == TEAM_SPECTATOR) then
        timer.Simple(0.1, function()
	        if GAMEMODE:GetTeamAliveCounts()[TEAM_PROPS] == 1 then
		        if GetConVar("lps_weapon"):GetString() == "random" then
                    PHE.LPS.WEAPON = PHE.LPS.WEAPONS[math.random(#PHE.LPS.WEAPONS)]
                end
                for _, pl in pairs(team.GetPlayers(TEAM_PROPS)) do
			        if pl:Alive() then
				        pl:Give(PHE.LPS.WEAPON)
				        pl:GiveAmmo(120, pl:GetActiveWeapon():GetPrimaryAmmoType(), true)
                        if GetConVar("lps_trail_enable"):GetBool() then
                            pl.lps_trail = util.SpriteTrail(pl, 0, Color(PHE.LPS.TRAIL.R, PHE.LPS.TRAIL.G, PHE.LPS.TRAIL.B), false, 15, 1, 4, 0.125, GetConVar("lps_trail_texture"):GetString())
                        end
				    
				        PrintMessage(HUD_PRINTCENTER, PHE.LANG.HUD.LASTPROP)
                        BroadcastLua("surface.PlaySound(\"lps/" .. PHE.LPS.SOUNDS[math.random(#PHE.LPS.SOUNDS)] .. "\")")
                    
                        return
			        end
		        end
	        end
        end)
    end
end
hook.Add("PostPlayerDeath", "DeathLastPropStandingTest", lpsTest)
hook.Add("PlayerDisconnected", "DisconnectLastPropStandingTest", lpsTest)
