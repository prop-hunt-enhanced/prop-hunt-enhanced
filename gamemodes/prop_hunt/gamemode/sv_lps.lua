PHE.LPS = {}
PHE.LPS.WEAPON = "weapon_357"
function lastPropStandingSetup()
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

    if GetConVar("ph_enable_last_prop_standing"):GetBool() then
        GM.NoPlayerPlayerDamage = false
    else
        GM.NoPlayerPlayerDamage = true
    end
end
lastPropStandingSetup()
cvars.AddChangeCallback("ph_enable_last_prop_standing", lastPropStandingSetup())

function lastPropStandingTest(pl)
    timer.Simple(0.1, function()
        if GetConVar("ph_enable_last_prop_standing"):GetBool() then
	        if !(pl:Team() == TEAM_HUNTERS || pl:Team() == TEAM_UNASSIGNED || pl:Team() == TEAM_SPECTATOR) && GAMEMODE:GetTeamAliveCounts()[TEAM_PROPS] == 1 then
		        for k, v in pairs(team.GetPlayers(TEAM_PROPS)) do
			        if v:Alive() then
				        v:Give(PHE.LPS.WEAPON)
				        v:GiveAmmo(120, weapons.Get(PHE.LPS.WEAPON):GetPrimaryAmmoType(), true)
				    
				        PrintMessage(HUD_PRINTCENTER, PHE.LANG.HUD.LASTPROP)
                        BroadcastLua("surface.PlaySound(\"lps/" .. PHE.LPS.SOUNDS[math.random(#PHE.LPS.SOUNDS)] .. "\")")
                    
                        return
			        end
		        end
	        end
        end
    end)
end
hook.Add("PostPlayerDeath", "DeathLastPropStandingTest", lastPropStandingTest)
hook.Add("PlayerDisconnected", "DisconnectLastPropStandingTest", lastPropStandingTest)
