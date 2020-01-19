include("sh_lps.lua")

function lpsHaloSetup()
    if GetConVar("lps_halo_color"):GetString() == "rainbow" then
        PHE.LPS.HALO = {}
    else
        nonHex, hexLength = string.gsub(GetConVar("lps_halo_color"):GetString(), "[%dABCDEFabcdef]", "")
        if hexLength == 6 then
            if nonHex == "#" then
                PHE.LPS.HALO = {
                    R = tonumber(string.sub(GetConVar("lps_halo_color"):GetString(), 2, 3), 16),
                    G = tonumber(string.sub(GetConVar("lps_halo_color"):GetString(), 4, 5), 16),
                    B = tonumber(string.sub(GetConVar("lps_halo_color"):GetString(), 6, 7), 16)
                }
            elseif nonHex == "" then
                PHE.LPS.HALO = {
                    R = tonumber(string.sub(GetConVar("lps_halo_color"):GetString(), 1, 2), 16),
                    G = tonumber(string.sub(GetConVar("lps_halo_color"):GetString(), 3, 4), 16),
                    B = tonumber(string.sub(GetConVar("lps_halo_color"):GetString(), 5, 6), 16)
                }
            else
                PHE.LPS.HALO = {R = 20, G = 250, B = 0}
                print("[WARN] PHE LPS: Convar lps_halo_color is not \"rainbow\" or a valid hex code, using default #14FA00")
            end
        else
            PHE.LPS.HALO = {R = 20, G = 250, B = 0}
            print("[WARN] PHE LPS: Convar lps_halo_color is not \"rainbow\" or a valid hex code, using default #14FA00")
        end
    end
end
lpsHaloSetup()
cvars.AddChangeCallback("lps_halo_color", lpsHaloSetup())

hook.Add("PreDrawHalos", "LastPropStandingHalo", function()
    if GetConVar("lps_enable"):GetBool() && GetConVar("lps_halo_enable"):GetBool() then
        lpsActive = false
        for _, ply in pairs(team.GetPlayers(TEAM_PROPS)) do
            if GetConVar("lps_weapon"):GetString() == "random" then
                for _, wep in pairs(PHE.LPS.WEAPONS) do
                    lpsActive = lpsActive || ply:HasWeapon(wep)
                end
            else
                lpsActive = ply:HasWeapon(GetConVar("lps_weapon"):GetString())
            end
        end

	    if lpsActive then
            if GetConVar("lps_halo_color"):GetString() == "rainbow" then
                halo.Add(ents.FindByClass("ph_prop"), Color(math.random(0, 255), math.random(0, 255), math.random(0, 255)), 1.2, 1.2, 1, true, GetConVar("lps_halo_walls"):GetBool())
            else
                halo.Add(ents.FindByClass("ph_prop"), Color(PHE.LPS.HALO.R, PHE.LPS.HALO.G, PHE.LPS.HALO.B), 1.2, 1.2, 1, true, GetConVar("lps_halo_walls"):GetBool())
            end
        end
    end
end)
