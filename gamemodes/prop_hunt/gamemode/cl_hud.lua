surface.CreateFont("PHE.HealthFont", 
{
	font = "Roboto",
	size = 56,
	weight = 650,
	antialias = true,
	shadow = true
})

surface.CreateFont("PHE.AmmoFont", 
{
	font = "Roboto",
	size = 86,
	weight = 500,
	antialias = true,
	shadow = true
})

surface.CreateFont("PHE.ArmorFont", 
{
	font = "Roboto",
	size = 32,
	weight = 500,
	antialias = true,
	shadow = true
})

surface.CreateFont("PHE.TopBarFont", 
{
	font = "Roboto",
	size = 20,
	weight = 500,
	antialias = true,
	shadow = true
})
surface.CreateFont("PHE.TopBarFontTeam", 
{
	font = "Roboto",
	size = 60,
	weight = 650,
	antialias = true,
	shadow = true
})

-- Hides HUD
local hide = {
	["CHudHealth"] 	= true,
	["CHudBattery"] = true,
	["CHudAmmo"]	= true,
	["CHudSecondaryAmmo"] = true
}
hook.Add("HUDShouldDraw", "PHE.ShouldHideHUD", function(hudname)
	if GetConVar("ph_hud_use_new"):GetBool() then
		if (hide[hudname]) then return false end
	end
end)

local curteam
local mat = {
	[1] = 	Material("vgui/phehud/res_hp_1"),
	[2] = 	Material("vgui/phehud/res_hp_2"),
}
local indic = {
	rotate 	= { mat = Material("vgui/phehud/i_rotate"), [0]	= Color(190,190,190,255), [1] = Color(255,255,0,255) },
	halo 	= { mat = Material("vgui/phehud/i_halo"), 	[0]	= Color(190,190,190,255), [1] = Color(0,255,0,255) },
	light 	= { mat = Material("vgui/phehud/i_light"), 	[0]	= Color(190,190,190,255), [1] = Color(255,255,0,255) },
	armor	= { mat = Material("vgui/phehud/i_shield"),	[0] = Color(190,190,190,255), [1] = Color(80,190,255,255) }
}
local hudtopbar = {
	mat = Material("vgui/phehud/hud_topbar"),
	x	= 0,
	y	= 60
}
local matw = Material("vgui/phehud/res_wep")

local ava
	if (IsValid(ava)) then ava:Remove() ava = nil end
local pos = { x = 0, y = ScrH()-130 }
local posw = { x = ScrW() - 480, y = ScrH()-130 }
local hp
local armor
local hpcolor

local bar = {
	hp = { h = 5, col = Color(250,40,10,240) },
	am = { h = 5, col = Color(80,190,255,220) }
}

local Rstate = 0
net.Receive("PHE.rotateState", function() Rstate = net.ReadInt(2) end)

local function PopulateAliveTeam(tm)
	local tim = team.GetPlayers(tm)
	local liveply = liveply or 0
	
	for _,pl in pairs(tim) do
		if IsValid(pl) && pl:Alive() then liveply = liveply + 1 end
	end
	
	return liveply
end

local state = false
local disabledcolor = Color(100,100,100,255)

hook.Add("HUDPaint", "PHE.MainHUD", function()
	
	if GetConVar("ph_hud_use_new"):GetBool() then state = true else state = false end;
	
	if IsValid(LocalPlayer()) && LocalPlayer():Alive() && state && (LocalPlayer():Team() == TEAM_HUNTERS or LocalPlayer():Team() == TEAM_PROPS) then
		-- Begin Player Info
		if not IsValid(ava) then
			ava = vgui.Create("AvatarMask")
			ava:SetPos(16, pos.y+18)
			ava:SetSize(86,86)
			ava:SetPlayer(LocalPlayer(),128)
			ava:SetVisible(true)
		end
		
		-- Player Info
		curteam = LocalPlayer():Team()
		hp = LocalPlayer():Health()
		armor = LocalPlayer():Armor()
		
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( mat[curteam] )
		surface.DrawTexturedRect( pos.x, pos.y, 480, 120 )
		
		draw.DrawText( "HEALTH", "Trebuchet24", pos.x + 175, pos.y + 14, color_white, TEXT_ALIGN_LEFT )
		
		if hp < 0 then hp = 0 end
		if armor < 0 then armor = 0 end
		
		if hp < 30 then
			hpcolor = Color( 255, 1 * (hp*8), 1 * (hp*8), 255 )
		else
			hpcolor = Color( 255, 255, 255, 255 )
		end
		
		-- hp bar
		if hp > 100 then hpx = 100 else hpx = hp end
		if armor > 100 then armx = 100 else armx = armor end
		
		surface.SetDrawColor(bar.hp.col)
		surface.DrawRect(pos.x + 175, pos.y + 57, 1*(hpx*2.9), bar.hp.h)
		
		surface.SetDrawColor(bar.am.col)
		surface.DrawRect(pos.x + 175, pos.y + 62, 1*(armx*2.9), bar.am.h)
		
		draw.DrawText( hp, "PHE.HealthFont", pos.x + 350, pos.y - 4, hpcolor, TEXT_ALIGN_RIGHT )
		draw.DrawText( " / "..armor, "PHE.ArmorFont", pos.x + 350, pos.y + 14, Color( 255,255,255,255 ), TEXT_ALIGN_LEFT )
		
		if LocalPlayer():Team() == TEAM_HUNTERS then
			surface.SetDrawColor(disabledcolor)
		else
			surface.SetDrawColor( indic.rotate[Rstate] )
		end
		surface.SetMaterial( indic.rotate.mat )
		surface.DrawTexturedRect( pos.x + (168), pos.y + 74, 32, 32 )
		
		if LocalPlayer():Team() == TEAM_HUNTERS then
			surface.SetDrawColor(disabledcolor)
		else
			surface.SetDrawColor( indic.light[CL_GLOBAL_LIGHT_STATE] )
		end
		surface.SetMaterial( indic.light.mat )
		surface.DrawTexturedRect( pos.x + (216), pos.y + 74, 32, 32 )
		
		if LocalPlayer():Team() == TEAM_HUNTERS then
			surface.SetDrawColor(disabledcolor)
		else
			surface.SetDrawColor( indic.halo[tonumber(GetConVar("ph_cl_halos"):GetInt())])
		end
		surface.SetMaterial( indic.halo.mat )
		surface.DrawTexturedRect( pos.x + (264), pos.y + 74, 32, 32 )
		
		if LocalPlayer():Armor() < 10 then
			surface.SetDrawColor( indic.armor[0] )
		else
			surface.SetDrawColor( indic.armor[1] )
		end
		surface.SetMaterial( indic.armor.mat )
		surface.DrawTexturedRect (pos.x + (312), pos.y + (2*37), 32, 32 )
	end
	
	-- Weapon HUD
	if IsValid(LocalPlayer()) && LocalPlayer():Alive() && state && LocalPlayer():Team() == TEAM_HUNTERS then
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( matw )
		surface.DrawTexturedRect( posw.x, posw.y, 480, 120 )
		
		local curWep = LocalPlayer():GetActiveWeapon()
		
		local clip
		local maxclip
		local mag
		local mag2
		local name
		local percent
		
		draw.DrawText( "AMMO", "Trebuchet24", posw.x + (256), posw.y + 14, color_white, TEXT_ALIGN_LEFT )
		
		if IsValid(curWep) then
			clip 	= curWep:Clip1()
			maxclip = curWep:GetMaxClip1()
			mag 	= LocalPlayer():GetAmmoCount(curWep:GetPrimaryAmmoType())
			mag2	= LocalPlayer():GetAmmoCount(curWep:GetSecondaryAmmoType())
			name	= language.GetPhrase(curWep:GetPrintName())
		
			if clip < 0 then clip = 0 end
			if maxclip < 0 then maxclip = 0 end
			
			if (clip < 0 || maxclip < 0) then
				percent = 0
			else
				percent = math.Round(clip / maxclip * 300)
			end
			
			surface.SetDrawColor(255,200,15,255)
			surface.DrawRect(posw.x + 8, posw.y + 58, percent, 8)
		
			draw.DrawText( clip, "PHE.HealthFont", posw.x + 136, posw.y -4, color_white, TEXT_ALIGN_RIGHT )
			draw.DrawText( " / "..mag, "PHE.ArmorFont", posw.x + 136, posw.y + 14, color_white, TEXT_ALIGN_LEFT )
			draw.DrawText( mag2, "PHE.AmmoFont", ScrW()-58, posw.y + 14, 		color_white, TEXT_ALIGN_CENTER )
			draw.DrawText( name, "PHE.TopBarFont", posw.x + 136, posw.y + 80, 	color_white, TEXT_ALIGN_LEFT )
			
		end
	end
	
	if IsValid(LocalPlayer()) && !LocalPlayer():Alive() then
		if IsValid(ava) then
			ava:SetVisible(false)
			ava:Remove()
		end
	end
	if IsValid(LocalPlayer()) && !state then
		if IsValid(ava) then
			ava:SetVisible(false)
			ava:Remove()
		end
	end
	if IsValid(LocalPlayer()) && (LocalPlayer():Team() == TEAM_SPECTATOR or LocalPlayer():Team() == TEAM_UNASSIGNED) then
		if IsValid(ava) then
			ava:SetVisible(false)
			ava:Remove()
		end
	end
	
	-- the Team Bar. This requires at least 4 players to get this displayed.
	if GetConVar("ph_show_team_topbar"):GetBool() then
		if ((player.GetCount() >= 4 && LocalPlayer():Alive()) && (LocalPlayer():Team() != TEAM_UNASSIGNED && LocalPlayer():Team() != TEAM_SPECTATOR)) then
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial( hudtopbar.mat )
			surface.DrawTexturedRect( hudtopbar.x, hudtopbar.y, 400, 50 )
			
			-- Draw Props
			draw.DrawText( "Props", "PHE.TopBarFont", 4, hudtopbar.y + 2, Color(255,255,255,255), TEXT_ALIGN_LEFT )
			draw.DrawText( tostring(PopulateAliveTeam(TEAM_PROPS)), "PHE.TopBarFontTeam", 96, hudtopbar.y - 8, Color(255,255,255,255), TEXT_ALIGN_LEFT )
			
			-- Draw Hunters
			draw.DrawText( "Hunter", "PHE.TopBarFont", 300, hudtopbar.y + 22, Color(255,255,255,255), TEXT_ALIGN_LEFT )
			draw.DrawText( tostring(PopulateAliveTeam(TEAM_HUNTERS)), "PHE.TopBarFontTeam", 220, hudtopbar.y - 8, Color(255,255,255,255), TEXT_ALIGN_LEFT )
		end
	end
end)