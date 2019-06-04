function PHE:InitializePlugin()

	for name,plugin in pairs(list.Get("PHE.Plugins")) do
		printVerbose("------------------------------------------\n[PHE Plugin] :: Adding Plugin: "..name)
		PHE.PLUGINS[name] = plugin
	end
	
	if table.Count(PHE.PLUGINS) > 0 then
		for pName,pData in pairs(PHE.PLUGINS) do
			printVerbose("[PHE Plugin] Loading Plugin "..pName)
			printVerbose("--> Loaded Plugins: "..pData.name.."\n--> Version: "..pData.version.."\n--> Info: "..pData.info.."\n------------------------------------------")
		end
	end
end
hook.Add("Initialize", "PHE.InitPlugins", function()
	PHE:InitializePlugin()
end)

if CLIENT then

	hook.Add("PH_CustomTabMenu", "PHE.NewPlugins", function(tab, pVgui)
	
		local main = {}
	
		main.panel = vgui.Create("DPanel", tab)
		main.panel:SetSize(tab:GetWide(),tab:GetTall())
		main.panel:SetBackgroundColor(Color(40,40,40,120))
			
		main.scroll = vgui.Create( "DScrollPanel", main.panel )
		main.scroll:Dock(FILL)
		
		main.grid = vgui.Create("DGrid", main.scroll)
		main.grid:SetPos(10,10)
		main.grid:SetSize(tab:GetWide()-20,280)
		main.grid:SetCols(1)
		main.grid:SetColWide(tab:GetWide()-100)
		main.grid:SetRowHeight(300)
		
		if table.Count(PHE.PLUGINS) < 1 then
			if LocalPlayer():IsSuperAdmin() then
				local lbl = vgui.Create("DLabel",main.panel)
				lbl:SetPos(40,60)
				lbl:SetText("No Plugins are available. Find more Prop Hunt: Enhanced Exclusive Plugins here!")
				lbl:SetFont("Trebuchet24")
				lbl:SetTextColor(color_white)
				lbl:SizeToContents()
				
				local but = vgui.Create("DButton",main.panel)
				but:SetPos(40,96)
				but:SetSize(256,40)
				but:SetText("Find PH:E Plugins")
				but.DoClick = function() gui.OpenURL("https://project.wolvindra.net/phe/?go=plugins") end
				but:SetIcon("icon16/bricks.png")
			else
				local lbl = vgui.Create("DLabel",main.panel)
				lbl:SetPos(40,60)
				lbl:SetText("This server has no custom addons/plugins installed.")
				lbl:SetFont("Trebuchet24")
				lbl:SetTextColor(color_white)
				lbl:SizeToContents()
			end
		else
			for plName,Data in pairs(PHE.PLUGINS) do
				local section = {}
				section.main = vgui.Create("DPanel",main.grid)
				section.main:SetSize(main.grid:GetWide()-100,main.grid:GetTall())
				section.main:SetBackgroundColor(Color(20,20,20,150))
				
				section.roll = vgui.Create("DScrollPanel",section.main)
				section.roll:SetSize(section.main:GetWide(),section.main:GetTall())
				
				section.grid = vgui.Create("DGrid",section.roll)
				section.grid:SetPos(20,20)
				section.grid:SetSize(section.roll:GetWide()-20,section.roll:GetTall())
				section.grid:SetCols(1)
				section.grid:SetColWide(800)
				section.grid:SetRowHeight(40)
				
				pVgui("","label","Trebuchet24",section.grid, Data.name.."| v."..Data.version )
				pVgui("","label",false,section.grid, "Description: "..Data.info )
				if (LocalPlayer():IsSuperAdmin() || table.HasValue(PHE.SVAdmins, LocalPlayer():GetUserGroup())) then
					if table.Count(Data.settings) > 0 then
						pVgui("","label",false,section.grid, "-- Server Settings --" )
						for _,val in pairs(Data.settings) do
							pVgui(val[1],val[2],val[3],section.grid,val[4])
						end
					end
				end
				if table.Count(Data.client) > 0 then
					pVgui("","label",false,section.grid, "-- Client Settings --" )
					for _,val in pairs(Data.client) do
						pVgui(val[1],val[2],val[3],section.grid,val[4])
					end
				end				
				main.grid:AddItem(section.main)
			end
		end
	
	tab:AddSheet("Plugins [BETA]", main.panel, "icon16/bricks.png")
	
	end)
end