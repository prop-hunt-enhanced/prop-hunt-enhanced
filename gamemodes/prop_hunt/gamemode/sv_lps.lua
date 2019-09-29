GM.NoPlayerPlayerDamage = false
function lastPropStandingTest(pl)
	local propCount = 0
	for k, v in pairs(team.GetPlayers(TEAM_PROPS)) do
		if v:Alive() then
			propCount = propCount + 1
		end
	end
	
	if !((pl:Team() == TEAM_HUNTERS) or (pl:Team() == TEAM_UNASSIGNED) or (pl:Team() == TEAM_SPECTATOR)) and (propCount == 1) then
		for k, v in pairs(team.GetPlayers(TEAM_PROPS)) do
			if v:Alive() then
				v:Give("weapon_357")
				v:GiveAmmo(30, "357", true)
				
				PrintMessage(HUD_PRINTCENTER, "The last prop has been given a magnum!")
                BroadcastLua("surface.PlaySound(\"lps/high_noon.wav\")")

                return
			end
		end
	end
end
hook.Add("PostPlayerDeath", "DeathLastPropStandingTest", lastPropStandingTest)
hook.Add("PlayerDisconnected", "DisconnectLastPropStandingTest", lastPropStandingTest)
