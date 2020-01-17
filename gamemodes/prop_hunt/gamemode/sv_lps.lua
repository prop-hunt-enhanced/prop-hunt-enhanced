AddCSLuaFile("sh_lps.lua")
include("sh_lps.lua")

PHE.LPS.SOUND = {}

globalSoundFilter = RecipientFilter()
globalSoundFilter:AddAllPlayers()

PHE.LPS.SOUND.ALERT = {}
for _, filename in pairs(file.Find("sound/lps/alert/*.mp3", "GAME")) do
	local soundTable = {}
	soundTable.sound = CreateSound(game.GetWorld(), "lps/alert/" .. filename, globalSoundFilter)
	soundTable.sound:SetSoundLevel(0)
	soundTable.filename = filename
    table.insert(PHE.LPS.SOUND.ALERT, soundTable)

	resource.AddFile("sound/lps/alert/" .. filename)
end
for _, filename in pairs(file.Find("sound/lps/alert/*.wav", "GAME")) do
	local soundTable = {}
	soundTable.sound = CreateSound(game.GetWorld(), "lps/alert/" .. filename, globalSoundFilter)
	soundTable.sound:SetSoundLevel(0)
	soundTable.filename = filename
    table.insert(PHE.LPS.SOUND.ALERT, soundTable)

	resource.AddFile("sound/lps/alert/" .. filename)
end
for _, filename in pairs(file.Find("sound/lps/alert/*.ogg", "GAME")) do
	local soundTable = {}
	soundTable.sound = CreateSound(game.GetWorld(), "lps/alert/" .. filename, globalSoundFilter)
	soundTable.sound:SetSoundLevel(0)
	soundTable.filename = filename
    table.insert(PHE.LPS.SOUND.ALERT, soundTable)

	resource.AddFile("sound/lps/alert/" .. filename)
end

PHE.LPS.SOUND.MUSIC = {}
for _, filename in pairs(file.Find("sound/lps/music/*.mp3", "GAME")) do
	local soundTable = {}
	soundTable.sound = CreateSound(game.GetWorld(), "lps/music/" .. filename, globalSoundFilter)
	soundTable.sound:SetSoundLevel(0)
	soundTable.filename = filename
    table.insert(PHE.LPS.SOUND.MUSIC, soundTable)

	resource.AddFile("sound/lps/music/" .. filename)
end
for _, filename in pairs(file.Find("sound/lps/music/*.wav", "GAME")) do
	local soundTable = {}
	soundTable.sound = CreateSound(game.GetWorld(), "lps/music/" .. filename, globalSoundFilter)
	soundTable.sound:SetSoundLevel(0)
	soundTable.filename = filename
    table.insert(PHE.LPS.SOUND.MUSIC, soundTable)

	resource.AddFile("sound/lps/music/" .. filename)
end
for _, filename in pairs(file.Find("sound/lps/music/*.ogg", "GAME")) do
	local soundTable = {}
	soundTable.sound = CreateSound(game.GetWorld(), "lps/music/" .. filename, globalSoundFilter)
	soundTable.sound:SetSoundLevel(0)
	soundTable.filename = filename
    table.insert(PHE.LPS.SOUND.MUSIC, soundTable)

	resource.AddFile("sound/lps/music/" .. filename)
end

function lpsMusicRecursion()
	if PHE.LPS.SOUND.NEXT ~= {} then
		PHE.LPS.SOUND.CURRENT = PHE.LPS.SOUND.NEXT
		PHE.LPS.SOUND.CURRENT.sound:Play()

		repeat
			PHE.LPS.SOUND.NEXT = PHE.LPS.SOUND.MUSIC[math.random(#PHE.LPS.SOUND.MUSIC)]
		until PHE.LPS.SOUND.NEXT ~= PHE.LPS.SOUND.CURRENT || #PHE.LPS.SOUND.MUSIC <= 1

		timer.Simple(SoundDuration("lps/music/" .. PHE.LPS.SOUND.CURRENT.filename), lpsMusicRecursion)
	end
end

hook.Add("PH_RoundEnd", "LastPropStandingStopSounds", function()
	PHE.LPS.SOUND.CURRENT.sound:Stop()
	PHE.LPS.SOUND.NEXT = {}
	PHE.LPS.SOUND.CURRENT = {}
end)

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
						PHE.LPS.SOUND.CURRENT = PHE.LPS.ALERT[math.random(#PHE.LPS.ALERT)]
						PHE.LPS.SOUND.CURRENT.sound:Play()

						repeat
							PHE.LPS.SOUND.NEXT = PHE.LPS.MUSIC[math.random(#PHE.LPS.MUSIC)]
						until PHE.LPS.SOUND.NEXT ~= PHE.LPS.SOUND.CURRENT || #PHE.LPS.MUSIC <= 1
						timer.Simple(SoundDuration("lps/alert/" .. PHE.LPS.SOUND.CURRENT.filename), lpsMusicRecursion)
						
                        return
			        end
		        end
	        end
        end)
    end
end
hook.Add("PostPlayerDeath", "DeathLastPropStandingTest", lpsTest)
hook.Add("PlayerDisconnected", "DisconnectLastPropStandingTest", lpsTest)
