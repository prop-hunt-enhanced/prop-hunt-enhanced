local Ph = {}
function ph_BaseMainWindow(ply, cmd, args)
	local mdlName = ply:GetInfo("cl_playermodel")
	local mdlPath = player_manager.TranslatePlayerModel(mdlName)
	
	local frm = vgui.Create("DFrame")
	frm:SetSize(ScrW()-96,ScrH()-64)
	frm:SetTitle("Prop Hunt: Enhanced | Help & Settings menu")
	frm.Paint = function(self,w,h)
		surface.SetDrawColor(30,30,30,180)
		surface.DrawRect(0,0,w,h)
	end
	frm:SetDraggable(false)
	frm:Center()
	frm:MakePopup()
	
	local tab = vgui.Create("DPropertySheet", frm)
	tab:Dock(FILL)
	tab:DockMargin(12,12,12,12)
	tab.Paint = function(self)
		surface.SetDrawColor(50,50,50,255)
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end
	
	function Ph:GetMutedStateIcon(bool)
		if bool then
			return "vgui/phehud/voice_off"
		end
		
		return "vgui/phehud/voice_on"
	end
	
	function Ph:CreateBasicLayout(color,pTab) -- Warning: This one only can be used within this scope! todo: See 'cl_credits.lua' to see some details.
		local panel = vgui.Create("DPanel", pTab)
		panel:SetBackgroundColor(color)
		
		local scroll = vgui.Create( "DScrollPanel", panel )
		scroll:Dock(FILL)
		
		local grid = vgui.Create("DGrid", scroll)
		grid:Dock(NODOCK)
		grid:SetPos(10,10)
		grid:SetCols(1)
		grid:SetColWide(800)
		grid:SetRowHeight(32)
		
		return panel,grid
	end
	
	-- Base Function for Automated-VGUI Creation. I've Spent 8 Hours to do this with laptop keep autoshutdowns... Damn it
	-- Usage of Ph:CreateVGUIType(cmd,typ,data,panel,text)
	-- typ: check, label, btn, slider
	function Ph:CreateVGUIType(cmd,typ,data,panel,text)
		-- CheckBox
		if typ == "check" then
			if type(data) == "string" then
				local chk = vgui.Create("DCheckBoxLabel")
				chk:SetSize(panel:GetColWide(),panel:GetRowHeight())
				chk:SetText(text)
				local num = GetConVar(cmd):GetBool()
				if num then 
					chk:SetChecked(true); chk:SetValue(1);
				else
					chk:SetChecked(false); chk:SetValue(0);
				end
				function chk:OnChange(bool)
					local v = 0
					if bool then
						v = 1
					else
						v = 0
					end
					if data == "SERVER" then
						net.Start("SvCommandReq")
						  net.WriteString(cmd)
						  net.WriteInt(v,2)
						net.SendToServer()
					elseif data == "CLIENT" then
						RunConsoleCommand(cmd, v)
						chat.AddText(Color(200,0,0),"[Settings]", color_white, " Cvar '"..cmd.."' has been changed to "..v)
						if v == 1 then
							surface.PlaySound("buttons/button9.wav")
						else
							surface.PlaySound("buttons/button19.wav")
						end
					end
				end
				panel:AddItem(chk)
			else
				print(cmd.." -> Ph:CreateVGUIType FAILED! - 'data' argument must containt string value, Got: "..type(data).." instead!!")
			end
		end
		
		-- Label
		if typ == "label" then
			local txt = vgui.Create("DLabel")
			txt:SetSize(panel:GetColWide(),panel:GetRowHeight())
			txt:SetText(text)
			if !data then
				txt:SetFont("HudHintTextLarge")
			else
				txt:SetFont(data)
			end
			txt:SetTextColor(color_white)
			panel:AddItem(txt)
		end
		
		-- Spacer/Divider
		if typ == "spacer" then
			local pnl = vgui.Create("DPanel")
			pnl:SetSize(panel:GetColWide(),panel:GetRowHeight())
			pnl:SetBackgroundColor(Color(0,0,0,0))
			
			panel:AddItem(pnl)
		end
		
		-- Button
		if typ == "btn" then
			if type(data) == "table" then
				-- How many buttons that will be created. Note: maximum are 6 buttons in 1 segment.
				local legal = data.max
				if data.max < 1 then legal = 1 end
				if data.max > 6 then legal = 6 end
				
				local pnl = vgui.Create("DPanel")
				pnl:SetSize(panel:GetColWide(),panel:GetRowHeight())
				pnl:SetBackgroundColor(Color(0,0,0,0))
				
				local function btncreation(pPanel,pText, f)
					local btn = vgui.Create("DButton", pPanel)
					btn:SetText(pText)
					btn:Dock(LEFT)
					btn:DockMargin(8,2,0,2)
					-- If this looks stupid, but it working, it ain't stupid!
					btn:SizeToContents()
					btn:SetSize(btn:GetWide()+8,btn:GetTall())
					btn.DoClick = f
				end
				
				for i=1,legal do
					btncreation(pnl,data.textdata[i][1], data.textdata[i][2])
				end
				panel:AddItem(pnl)
			else
				print(cmd.." -> Ph:CreateVGUIType FAILED! - 'data' argument must containt table value, Example:\n\n   { max = max_num_button, textdata = {[1] = {text, function}, [2] = {text, function}, etc...}} \n  --> Got "..type(data).." instead!!")
			end
		end
		
		-- Slider
		if typ == "slider" then
			if type(data) == "table" then
				local min = data.min
				local max = data.max
				local dval = data.init
				local dec = data.dec
				local kind = data.kind
				local float = data.float
				
				local pnl = vgui.Create("DPanel")
				pnl:SetSize(panel:GetColWide(),panel:GetRowHeight()-6)
				pnl:SetBackgroundColor(Color(120,120,120,200))
				
				local slider = vgui.Create("DNumSlider",pnl)
				slider:SetPos(10,0)
				slider:SetSize(panel:GetColWide()-30,panel:GetRowHeight()-6)
				slider:SetText(text)
				slider:SetMin(min)
				slider:SetMax(max)
				slider:SetValue(dval)
				slider:SetDecimals(dec)
				slider.OnValueChanged = function(pnl,val)
					slider:SetValue(val)
					if kind == "SERVER" then
						net.Start("SvCommandSliderReq")
						net.WriteString(cmd)
						net.WriteBool(float)
						if float then
							net.WriteFloat(val)
						else
							net.WriteInt(slider:GetValue(), 16)
						end
						net.SendToServer()
					elseif kind == "CLIENT" then
						if float then
							RunConsoleCommand(cmd, val)
						else
							RunConsoleCommand(cmd, math.Round(val))
						end
					end
				end
				panel:AddItem(pnl)
			else
				print(cmd.." -> Ph:CreateVGUIType FAILED! - 'data' argument must containt table value, Example:\n\n   { min = min value, max = max value, init = initial value, dec = decimal count, kind = SERVER/CLIENT} } \n  --> Got "..type(data).." instead!!")
			end
		end
		
		-- Mute Functions
		if typ == "mute" then
			if type(data) == "Player" && IsValid(data) then
				local ply = data
				
				local pnl = vgui.Create("DPanel")
				pnl:SetSize(panel:GetColWide(),panel:GetRowHeight()-6)
				pnl:SetBackgroundColor(Color(20,20,20,150))
				
				local ava = vgui.Create("AvatarImage", pnl)
				ava:Dock(LEFT)
				ava:SetSize(24,24)
				ava:SetPlayer(ply,32)
				
				local name = vgui.Create("DLabel", pnl)
				name:Dock(LEFT)
				name:DockMargin(8,4,8,4)
				name:SetSize(panel:GetColWide()/2,0)
				name:SetText(ply:Nick())
				name:SetFont("HudHintTextLarge")
				name:SetTextColor(color_white)
				
				local imagebtn
				local button = vgui.Create("DButton", pnl)
				button:Dock(RIGHT)
				button:DockMargin(4,0,4,0)
				button:SetSize(24,0)
				button:SetText("")
				button.Paint = function(btn)
					surface.SetDrawColor(90,90,90,0)
					surface.DrawRect(0,0,btn:GetWide(),btn:GetTall())
				end
				
				button.DoClick = function()
					if not IsValid(ply) then return end
					local mute = ply:IsMuted()
					ply:SetMuted(not mute)
					imagebtn:SetImage(Ph:GetMutedStateIcon(not mute))
				end
				
				if ply == LocalPlayer() then
					button:SetVisible(false)
				else
					button:SetVisible(true)
				end
				
				imagebtn = vgui.Create("DImage",button)
				imagebtn:Dock(FILL)
				imagebtn:SetImage(Ph:GetMutedStateIcon(ply:IsMuted()))
				
				panel:AddItem(pnl)
			else
				print(cmd.." -> Ph:CreateVGUIType FAILED! - 'data' argument must containt Entity userdata value \n  --> Got "..type(data).." instead!!")
			end
		end
	end
	
	function Ph:HelpSelections()
		local panel = vgui.Create("DPanel", tab)
		panel:SetBackgroundColor(Color(100,100,100,255))
	
		local helpImage = vgui.Create("DImage", panel)
		helpImage.Count = 1
		helpImage:Dock(FILL)
		helpImage:SetImage("vgui/phhelp1.vmt")
	
		local pBottom = vgui.Create("DPanel", panel)
		pBottom:Dock(BOTTOM)
		pBottom:SetSize(0,40)
		pBottom:SetBackgroundColor(Color(0,0,0,0))
		
		local motd = vgui.Create("DButton", pBottom)
		motd:Dock(FILL)
		motd:SetSize(0,40)
		motd:SetText("SERVER INFORMATION & RULES [MOTD]")
		motd:SetFont("PHE.ArmorFont")
		motd:SetTextColor(color_white)
		motd.hover = {r=55,g=55,b=55}
		motd.Paint = function(pnl)
		if pnl:IsHovered() then
			pnl.hover = {r=70,g=70,b=70}
		else
			pnl.hover = {r=55,g=55,b=55}
		end
			surface.SetDrawColor(pnl.hover.r,pnl.hover.g,pnl.hover.b,255)
			surface.DrawRect(0,0,motd:GetWide(),motd:GetTall())
		end
		motd.DoClick = function() ply:ConCommand("ulx motd"); frm:Close() end
		
		local bnext = vgui.Create("DButton", pBottom)
		bnext:Dock(RIGHT)
		bnext:SetSize(128,40)
		bnext:SetText("NEXT >")
		bnext:SetFont("HudHintTextLarge")
		bnext:SetTextColor(color_white)
		bnext.hover = {r=100,g=100,b=100}
		bnext.Paint = function(pnl)
		if pnl:IsHovered() then
			pnl.hover = {r=130,g=130,b=130}
			pnl:SetTextColor(color_white)
		elseif pnl:GetDisabled() then
			pnl.hover = {r=20,g=20,b=20}
			pnl:SetTextColor(Color(40,40,40))
		else
			pnl.hover = {r=100,g=100,b=100}
			pnl:SetTextColor(color_white)
		end
			surface.SetDrawColor(pnl.hover.r,pnl.hover.g,pnl.hover.b,255)
			surface.DrawRect(0,0,motd:GetWide(),motd:GetTall())
		end
		bnext.DoClick = function(pnl)
			helpImage.Count = helpImage.Count + 1
			if helpImage.Count >= 6 then
				helpImage.Count = 6
			end
			helpImage:SetImage("vgui/phhelp"..helpImage.Count..".vmt")
		end
		
		local bprev = vgui.Create("DButton", pBottom)
		bprev:Dock(LEFT)
		bprev:SetSize(128,40)
		bprev:SetText("< PREVIOUS")
		bprev:SetFont("HudHintTextLarge")
		bprev:SetTextColor(color_white)
		bprev.hover = {r=100,g=100,b=100}
		bprev.Paint = function(pnl)
		if pnl:IsHovered() then
			pnl.hover = {r=130,g=130,b=130}
			pnl:SetTextColor(color_white)
		elseif pnl:GetDisabled() then
			pnl.hover = {r=20,g=20,b=20}
			pnl:SetTextColor(Color(40,40,40))
		else
			pnl.hover = {r=100,g=100,b=100}
			pnl:SetTextColor(color_white)
		end
			surface.SetDrawColor(pnl.hover.r,pnl.hover.g,pnl.hover.b,255)
			surface.DrawRect(0,0,motd:GetWide(),motd:GetTall())
		end
		bprev.DoClick = function(pnl)
			helpImage.Count = helpImage.Count - 1
			if helpImage.Count <= 1 then
				helpImage.Count = 1
			end
			helpImage:SetImage("vgui/phhelp"..helpImage.Count..".vmt")
		end

		tab:AddSheet("Help", panel, "icon16/help.png")
	end
	
	function Ph:PlayerModelSelections()
		local panel = vgui.Create("DPanel", tab)
		panel:SetBackgroundColor(Color(40,40,40,120))
		
		-- Prefer had to do this instead doing all over and over.
		function Ph:PlayerModelAdditions()
		
			-- the Model's DPanel preview. The Pos & Size must be similar as the ModelPreview.
			local panelpreview = vgui.Create( "DPanel", panel )
			panelpreview:Dock(FILL)
			panelpreview:SetBackgroundColor(Color(120,120,120,100))
			
			-- Model Preview.
			local modelPreview = vgui.Create( "DModelPanel", panelpreview )
			modelPreview:Dock(FILL)
			modelPreview:SetFOV ( 50 )
			modelPreview:SetModel ( mdlPath )
			
			local slider = vgui.Create("DNumSlider", panelpreview)
			slider:Dock(BOTTOM)
			slider:SetSize(0,32)
			slider:SetText(" Set Model FOV")
			slider:SetMin(50)
			slider:SetMax(90)
			slider:SetValue(40)
			slider:SetDecimals(0)
			slider.OnValueChanged = function(pnl,val)
				slider:SetValue(val)
				modelPreview:SetFOV(val)
			end
			
			local scroll = vgui.Create( "DScrollPanel", panel )
			scroll:Dock(LEFT)
			scroll:SetSize( 720, 0 )
			
			-- ^dito, grid dimensions 66x66 w/ Coloumn 7.
			local pnl = vgui.Create( "DGrid", scroll )
			pnl:Dock(FILL)
			pnl:SetCols( 10 )
			pnl:SetColWide( 68 )
			pnl:SetRowHeight( 68 )
			
			local plMode = GetConVar("ph_use_playermodeltype"):GetInt()
			local plWhich = {
				[0]	= player_manager.AllValidModels(),
				[1]	= list.Get("PlayerOptionsModel")
			}
			if plMode == nil then plWhich = 0 end
			
			-- Get All Valid Paired Models and sort 'em out.
			for name, model in SortedPairs( plWhich[plMode] ) do
				
				-- dont forget to cache.
				util.PrecacheModel(model)
				
				local icon = vgui.Create( "SpawnIcon" )
				
				-- Click functions
				icon.DoClick = function()
					surface.PlaySound( "buttons/combine_button3.wav" )
					RunConsoleCommand( "cl_playermodel", name )
					modelPreview:SetModel(model)
					Derma_Query("Model " .. name.. " has been selected and it will be applied after respawn!", "Model Applied",
						"OK", function() end)
				end
				
				-- Right click functions
				icon.DoRightClick = function()
					-- Same as above, but they has custom menus once user tries to right click on the models.
					local menu = DermaMenu()
					-- if user caught it says 'ERROR' but the model present, refresh it (:RebuildSpawnIcon)
					menu:AddOption( "Apply Model", function() 
						surface.PlaySound( "buttons/combine_button3.wav" )
						RunConsoleCommand( "cl_playermodel", name )
						modelPreview:SetModel(model)
						Derma_Query("Model " .. name.. " has been selected and it will be applied after respawn!", "Model Applied", "OK", function() end)
					end):SetIcon("icon16/tick.png")
					menu:AddSpacer()
					menu:AddOption( "Refresh Icon", function() icon:RebuildSpawnIcon() end):SetIcon("icon16/arrow_refresh.png")
					menu:AddOption( "Preview", function() modelPreview:SetModel(model) end):SetIcon("icon16/magnifier.png")
					menu:AddOption( "Model Information", function()
						Derma_Message( "Model's name is: " .. name .. "\n \nUsable by: Everyone.", "Model Info", "Close" )
						end ):SetIcon("icon16/information.png")
					menu:AddSpacer()
					menu:AddOption( "Close" ):SetIcon("icon16/cross.png")
					menu:Open()
				end
				
				-- Make sure the user has noticed after choosing a model by indicating from "Borders".
				icon.PaintOver = function() 
					if ( GetConVarString( "cl_playermodel" ) == name ) then 
						surface.SetDrawColor( Color( 255, 210 + math.sin(RealTime()*10)*40, 0 ) )
						surface.DrawOutlinedRect( 4, 4, icon:GetWide()-8, icon:GetTall()-8 )
						surface.DrawOutlinedRect( 3, 3, icon:GetWide()-6, icon:GetTall()-6 ) 
					end
				end
				
				-- Set set etc...
				icon:SetModel(model)
				icon:SetSize(64,64)
				icon:SetTooltip(name)
				
				pnl:AddItem(icon)
			end
			return pnl
		end
		
		-- Self Explanationary.
		if GetConVar("ph_use_custom_plmodel"):GetBool() then
			-- Call the VGUI Properties of PlayerModelAdditions().
			Ph:PlayerModelAdditions()
			tab:AddSheet("Player Model", panel, "icon16/brick.png")
		else
			-- Show small message instead
			local scroll = vgui.Create( "DScrollPanel", panel )
			scroll:Dock(FILL)
			
			local gridmdl = vgui.Create("DGrid", scroll)
			gridmdl:Dock(NODOCK)
			gridmdl:SetPos(10,10)
			gridmdl:SetCols(1)
			gridmdl:SetColWide(800)
			gridmdl:SetRowHeight(32)
			
			Ph:CreateVGUIType("", "label", false, gridmdl, "Sorry, Custom Player Model is disabled on this server!")
			
			-- this hook is intended to use for custom player model outside from PH:E Menu. (like Custom Donator Model window or something).
			hook.Call("PH_CustomPlayermdlButton", nil, panel, gridmdl, function(cmd,typ,data,panel,text) Ph:CreateVGUIType(cmd,typ,data,panel,text) end)
			
			tab:AddSheet("Player Model", panel, "icon16/brick.png")
		end
	end
	
	function Ph:PlayerOption()
		local panel,gridpl = Ph:CreateBasicLayout(Color(40,40,40,180),tab)

		Ph:CreateVGUIType("", "label", false, gridpl, "Player Options:")
		Ph:CreateVGUIType("ph_cl_halos", "check", "CLIENT", gridpl, "Toggle Halo effect when choosing a prop" )
		Ph:CreateVGUIType("ph_cl_pltext", "check", "CLIENT", gridpl, "Show Team player names above their heads instead (and appear through wall too)")
		Ph:CreateVGUIType("ph_cl_endround_sound", "check", "CLIENT", gridpl, "Play End round sound cue")
		Ph:CreateVGUIType("ph_cl_autoclose_taunt", "check", "CLIENT", gridpl, "Option for Auto closing for Taunt window when double-clicking them")
		Ph:CreateVGUIType("ph_cl_spec_hunter_line", "check", "CLIENT", gridpl, "Draw a line on hunters so we can see their aim in spectator mode.")
		Ph:CreateVGUIType("cl_enable_luckyballs_icon", "check", "CLIENT", gridpl, "Enable 'Lucky ball' icon to be displayed once they are spawned")
		Ph:CreateVGUIType("cl_enable_devilballs_icon", "check", "CLIENT", gridpl, "Enable 'Devil ball' icon to be displayed once they are spawned")
		Ph:CreateVGUIType("hudspacer","spacer",nil,gridpl,"" )
		Ph:CreateVGUIType("", "label", false, gridpl, "HUD Settings")
		Ph:CreateVGUIType("ph_hud_use_new", "check", "CLIENT", gridpl, "Use New PH: Enhanced HUD")
		Ph:CreateVGUIType("ph_show_tutor_control", "check", "CLIENT", gridpl, "Show Tutorial Pop-up (Shown only 2x on each prop spawns)")
		Ph:CreateVGUIType("ph_show_custom_crosshair", "check", "CLIENT", gridpl, "Enable Custom Crosshair")
		Ph:CreateVGUIType("ph_show_team_topbar", "check", "CLIENT", gridpl, "Show total alive team players bar on the top left (At least 4 Players will be shown)")
		
	tab:AddSheet("Player", panel, "icon16/user_orange.png")
	end
	
	function Ph:PlayerMute()
		local panel,gridmute = Ph:CreateBasicLayout(Color(40,40,40,180),tab)
	
		Ph:CreateVGUIType("","label",false,gridmute,"Select one player that you wish to mute.")
		for _,Plys in pairs(player.GetAll()) do
			Ph:CreateVGUIType("","mute",Plys,gridmute,"")
		end
	
		tab:AddSheet("Mute", panel, "icon16/sound_delete.png")
	end
	-- Call All Functions, but Admin (must check by serverside user rights from sv_admin.lua)
	Ph:HelpSelections()
	Ph:PlayerMute()
	Ph:PlayerOption()
	Ph:PlayerModelSelections()
	
	-- Custom Hook Menu here. Give 1 second for better safe-calling...
	timer.Simple(1, function()
		hook.Call("PH_CustomTabMenu", nil, tab, function(cmd,typ,data,panel,text) Ph:CreateVGUIType(cmd,typ,data,panel,text) end)
	end)
	
	function Ph:ShowAdminMenu()
		local panel,grid = Ph:CreateBasicLayout(Color(40,40,40,180),tab)

		Ph:CreateVGUIType("", "label", false, grid, "Serverside gamemode Options (Only visible for Admins/Owner)")
		Ph:CreateVGUIType("ph_use_custom_plmodel", "check", "SERVER", grid, "Enable custom models for Hunters")
		Ph:CreateVGUIType("ph_use_custom_plmodel_for_prop", "check", "SERVER", grid, "Enable custom models for Props - Make sure to enable for Hunter too.")
		Ph:CreateVGUIType("ph_customtaunts_delay", "slider", {min = 2, max = 120, init = GetConVar("ph_customtaunts_delay"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Custom Taunts Delay (Seconds)")
		Ph:CreateVGUIType("ph_normal_taunt_delay", "slider", {min = 2, max = 120, init = GetConVar("ph_normal_taunt_delay"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Normal Taunts Delay (Seconds)")
		Ph:CreateVGUIType("ph_autotaunt_enabled", "check", "SERVER", grid, "Enable Auto Taunt Features")
		Ph:CreateVGUIType("ph_autotaunt_delay", "slider", {min = 30, max = 180, init = GetConVar("ph_autotaunt_delay"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Auto Taunts Delay (Seconds)")
		Ph:CreateVGUIType("devspacer","spacer",nil,grid,"" )
		Ph:CreateVGUIType("ph_notice_prop_rotation", "check", "SERVER", grid, "Display 'Prop Rotation' notification on every Prop Spawns")
		Ph:CreateVGUIType("ph_prop_camera_collisions", "check", "SERVER", grid, "Enable Prop Camera collision to the wall")
		Ph:CreateVGUIType("ph_freezecam", "check", "SERVER", grid, "Enable Freecam features for team props")
		Ph:CreateVGUIType("ph_prop_collision", "check", "SERVER", grid, "Enable Prop collide on each other prop players")
		Ph:CreateVGUIType("ph_swap_teams_every_round", "check", "SERVER", grid, "Swap team every round - Disabling means team will stay forever")
		Ph:CreateVGUIType("ph_hunter_fire_penalty", "slider", 	{min = 2, max = 80, init = GetConVar("ph_hunter_fire_penalty"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Hunter points penalty")
		Ph:CreateVGUIType("ph_hunter_kill_bonus", "slider", 	{min = 5, max = 100, init = GetConVar("ph_hunter_kill_bonus"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Hunter kill bonus") 
		Ph:CreateVGUIType("ph_game_time", "slider", 			{min = 20, max = 300, init = GetConVar("ph_game_time"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Total Game time (Minutes)") 
		Ph:CreateVGUIType("ph_hunter_blindlock_time", "slider", {min = 15, max = 60, init = GetConVar("ph_hunter_blindlock_time"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Hunter blindlock time (Seconds)") 
		Ph:CreateVGUIType("ph_round_time", "slider", 			{min = 120, max = 600, init = GetConVar("ph_round_time"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Game round time (Seconds)") 
		Ph:CreateVGUIType("ph_rounds_per_map", "slider", 		{min = 5, max = 30, init = GetConVar("ph_rounds_per_map"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Total game Rounds per Map") 
		Ph:CreateVGUIType("ph_enable_lucky_balls", "check", "SERVER", grid, "Allow Lucky Balls Features to be spawned on breakable props (Chance is 8%)")
		Ph:CreateVGUIType("ph_enable_devil_balls", "check", "SERVER", grid, "Allow Devil Balls Features to be spawned when hunter dies (Chance is 70%)")
		Ph:CreateVGUIType("ph_waitforplayers", "check", "SERVER", grid, "Wait for Players to begin the gameplay")
		Ph:CreateVGUIType("ph_min_waitforplayers", "slider", { min = 1, max = game.MaxPlayers(), init = GetConVar("ph_min_waitforplayers"):GetInt(), dec = 0, kind = "SERVER" }, grid, "Mininum Players to Wait before the game starts (default: 1)")
		Ph:CreateVGUIType("", "label", false, grid, "Enable Custom Taunt. Mode: 0 = Random, 1 = Custom, 2 Both mode)")
		Ph:CreateVGUIType("", "btn", {max = 2, textdata = {
			[1] = {"--[ Current Mode is Mode: "..GetConVar('ph_enable_custom_taunts'):GetInt().." ] --", 
			function(self)
				local CusTauntConvar = {
					[0] = "Mode [0/F3]: Random Taunt",
					[1] = "Mode [1/C]: Custom Taunt",
					[2] = "Mode [2]: Both Modes"
				}
				local function SendTauntCommandState(state)
					net.Start("SendTauntStateCmd")
					net.WriteString(tostring(state))
					net.SendToServer()
				end
				
				self:SetText(CusTauntConvar[GetConVar("ph_enable_custom_taunts"):GetInt()])
				local state = 0
				if GetConVar("ph_enable_custom_taunts"):GetInt() == 0 then
					state = 1
					SendTauntCommandState(1)
					self:SetText(CusTauntConvar[state])
				elseif GetConVar("ph_enable_custom_taunts"):GetInt() == 1 then
					state = 2
					SendTauntCommandState(2)
					self:SetText(CusTauntConvar[state])
				elseif GetConVar("ph_enable_custom_taunts"):GetInt() == 2 then
					state = 0
					SendTauntCommandState(0)
					self:SetText(CusTauntConvar[state])
				end
			end},
			[2] = {"Open Taunt Window", function(self)
				if !LocalPlayer():Alive() then
					print("You must do this action when you are alive!")
					frm:Close()
				else
					LocalPlayer():ConCommand("ph_showtaunts")
				end
			end}
			}
		}, grid ,"")
		Ph:CreateVGUIType("devspacer","spacer",nil,grid,"" )
		Ph:CreateVGUIType("", "label", false, grid, "Developer Options/Experimentals Features")
		Ph:CreateVGUIType("phe_check_props_boundaries", "check", "SERVER", grid, "[WORK IN PROGRESS] Enable Boundaries Check? This prevents you to get stuck with objects/walls.")
		Ph:CreateVGUIType("ph_mkbren_use_new_mdl","check","SERVER",grid, "Developer: Use new model for Bren MK II Bonus Weapon (Require Map Restart!)")
		Ph:CreateVGUIType("ph_print_verbose", "check", "SERVER", grid, "Developer: Enable verbose information of PH:E events in the console")
		Ph:CreateVGUIType("ph_enable_plnames", "check", "SERVER", grid, "Enable Player team names to be appear on their screen.")
		Ph:CreateVGUIType("ph_fc_use_single_sound", "check", "SERVER", grid, "Use single Freezecam sound instead of sound list (Use 'ph_fc_cue_path' to determine Freezecam sound path)")
		Ph:CreateVGUIType("ph_use_playermodeltype", "check", "SERVER", grid, "Use Legacy Model List : 0 = All Playermodels (AddValidModel), 1 = Use Legacy: list.Get('PlayerOptionsModel')")
		Ph:CreateVGUIType("ph_prop_jumppower", "slider", {min = 1, max = 3, init = GetConVar("ph_prop_jumppower"):GetFloat(), dec = 2, float = true, kind = "SERVER"}, grid, "Additional Jump Power multiplier for Props")
		Ph:CreateVGUIType("ph_sv_enable_obb_modifier","check","SERVER",grid, "Developer: Enable Customized Prop Entity OBB Model Data Modifier")
		Ph:CreateVGUIType("ph_reload_obb_setting_everyround","check","SERVER",grid, "Developer: Reload Customized Prop Entity OBB Model Data Modifier every round restarts")
		
	tab:AddSheet("Admins", panel, "icon16/user_gray.png")
	end
	
	function Ph:MapVoteMenu()
		local panel,grid = Ph:CreateBasicLayout(Color(40,40,40,180),tab)
		
		Ph:CreateVGUIType("", "label", false, grid, "MapVote Settings")
		Ph:CreateVGUIType("mv_allowcurmap","check","SERVER",grid,"Allow Current map to be Voted")
		Ph:CreateVGUIType("mv_cooldown","check","SERVER",grid,"Enable map Cooldown for voting")
		Ph:CreateVGUIType("mv_use_ulx_votemaps","check","SERVER",grid,"Use map listing from ULX Mapvote? 1 = use from ULX mapvote list (which you can whitelist them), 0 = use default maps/*.bsp directory listing.")
		Ph:CreateVGUIType("mv_maplimit", "slider", 	{min = 2, max = 80, init = GetConVar("mv_maplimit"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Number of Maps to be shown in MapVote.")
		Ph:CreateVGUIType("mv_timelimit", "slider", {min = 15, max = 90, init = GetConVar("mv_timelimit"):GetInt(), dec = 0, kind = "SERVER"}, grid, "Time in Seconds for default mapvote when voting.")
		Ph:CreateVGUIType("mv_mapbeforerevote", "slider", 	{min = 1, max = 10, init = GetConVar("mv_mapbeforerevote"):GetInt(), dec = 0, kind = "SERVER"}, grid, "How many times cooldown map to be appear again?")
		Ph:CreateVGUIType("mv_rtvcount", "slider", 	{min = 2, max = game.MaxPlayers(), init = GetConVar("mv_rtvcount"):GetInt(), dec = 0, kind = "SERVER"}, grid, "How many players required to use RTV (Rock the Vote)")
		Ph:CreateVGUIType("s1","spacer",nil,grid,"" )
		Ph:CreateVGUIType("", "label", false, grid, "To Setup which map should be listed, use (for example) [ mv_mapprefix 'ph_,cs_,de_' ] in the console.")
		Ph:CreateVGUIType("", "label", false, grid, "If you are unable to do a MapVote, you NEED to install ULX Admin Mod!")
		Ph:CreateVGUIType("s2","spacer",nil,grid,"" )
		Ph:CreateVGUIType("", "label", false, grid, "MapVote Action (To cancel, simply type !unmap_vote in the chat or type 'unmap_vote' in console)")
		Ph:CreateVGUIType("", "btn", {max = 2, textdata = {
			[1] = {"Start MapVote", function(self) 
				LocalPlayer():ConCommand("map_vote")
			end
			},
			[2] = {"Stop MapVote", function(self)
				LocalPlayer():ConCommand("unmap_vote")
			end}
			}
		},grid,"")
	
	tab:AddSheet("MapVote", panel, "icon16/map.png")
	end
	
	-- if Current User is Admin then check their user as security measure in the server.
	if ply:IsAdmin() then
		net.Start("CheckAdminFirst")
		net.SendToServer()
	end
	
	-- if Current User Passes the admin check, shows the admin tab.
	net.Receive("CheckAdminResult", function(len, pln)
		Ph:ShowAdminMenu()
		Ph:MapVoteMenu()
	end)
end
concommand.Add("ph_enhanced_show_help", ph_BaseMainWindow, nil, "Show Prop Hunt: Enhanced Main and Help menus." )