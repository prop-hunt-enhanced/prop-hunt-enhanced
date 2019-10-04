function lastPropStandingSetup()
    if GetConVar("ph_enable_last_prop_standing"):GetBool() then
        GM.NoPlayerPlayerDamage = false

        PHE.LASTPROPSOUNDS = {}
        for _, sound in pairs(file.Find("sound/lps/*.wav", "GAME")) do
            table.insert(PHE.LASTPROPSOUNDS, sound)
        end
        for _, sound in pairs(file.Find("sound/lps/*.mp3", "GAME")) do
            table.insert(PHE.LASTPROPSOUNDS, sound)
        end
    else
        GM.NoPlayerPlayerDamage = true
    end
end
lastPropStandingSetup()
cvars.AddChangeCallback("ph_enable_last_prop_standing", lastPropStandingSetup())

function lastPropStandingTest(pl)
    if GetConVar("ph_enable_last_prop_standing"):GetBool() then
	    local propCount = 0
	    for k, v in pairs(team.GetPlayers(TEAM_PROPS)) do
		    if v:Alive() then
			    propCount = propCount + 1
		    end
	    end
	    
	    if !(pl:Team() == TEAM_HUNTERS || pl:Team() == TEAM_UNASSIGNED || pl:Team() == TEAM_SPECTATOR) && propCount == 1 then
		    for k, v in pairs(team.GetPlayers(TEAM_PROPS)) do
			    if v:Alive() then
				    v:Give("weapon_357")
				    v:GiveAmmo(30, "357", true)
				    
				    PrintMessage(HUD_PRINTCENTER, PHE.LANG.HUD.LASTPROP)
                    BroadcastLua("surface.PlaySound(lps/\"" .. PHE.LASTPROPSOUNDS[math.random(#PHE.LASTPROPSOUNDS)] .. "\")")
                    
                    return
			    end
		    end
	    end
    end
end
hook.Add("PostPlayerDeath", "DeathLastPropStandingTest", lastPropStandingTest)
hook.Add("PlayerDisconnected", "DisconnectLastPropStandingTest", lastPropStandingTest)
