hook.Add("PH_CustomTabMenu", "PHE.About", function(tab, pVgui)

	surface.CreateFont("PHE.TitleFont",
	{
		font = "Roboto",
		size = 40,
		weight = 700,
		antialias = true,
		shadow = true
	})

	local panel = vgui.Create("DPanel", tab)
	panel:SetBackgroundColor(Color(40,40,40,120))

	local scroll = vgui.Create( "DScrollPanel", panel )
	scroll:Dock(FILL)

	local grid = vgui.Create("DGrid", scroll)
	grid:Dock(NODOCK)
	grid:SetPos(10,10)
	grid:SetCols(1)
	grid:SetColWide(800)
	grid:SetRowHeight(50)

	local label = {
		title 	= "Prop Hunt: Enhanced",
		author	= "Enhanced by: Wolvindra-Vinzuerio, D4UNKN0WNM4N & Fafy.",
		version = GAMEMODE._VERSION,
		rev 	= GAMEMODE.REVISION,
		credits	= "Yam, Godfather, adk, Lucas2107, Jonpopnycorn, Thundernerd,  stephanlachnit",
		lgit	= "https://github.com/prop-hunt-enhanced/prop-hunt-enhanced/",
		lhome	= "http://www.dralga.com/phe/",
		ldonate = GAMEMODE.DONATEURL,
		lwiki	= "https://prophunt.wolvindra.net/?go=phe_faq",
		lklog	= "https://prophunt.wolvindra.net/?go=changelog",
		lplugins = "https://prophunt.wolvindra.net/?go=plugins"
	}

	pVgui("","label","PHE.TitleFont",grid, label.title )
	pVgui("","label","Trebuchet24",grid, PHE.LANG.PHEMENU.ABOUT.CURRENTVER .. label.version .. " | " .. LANG.PHEMENU.ABOUT.CURRENTREV .. label.rev)
	pVgui("","label","Trebuchet24",grid, PHE.LANG.PHEMENU.ABOUT.ENJOYING )
	pVgui("","label",false,grid, PHE.LANG.PHEMENU.ABOUT.LINKS )
	pVgui("","btn",{max = 3,textdata = {
		[1] = { PHE.LANG.PHEMENU.ABOUT.DONATE, 	  function() gui.OpenURL(label.ldonate) end},
		[2] = { PHE.LANG.PHEMENU.ABOUT.HOME, 	  function() gui.OpenURL(label.lhome) end},
		[3] = { PHE.LANG.PHEMENU.ABOUT.GITHUB, 	  	  function() gui.OpenURL(label.lgit) end},
	}},grid,"")
	pVgui("spacer1","spacer",nil,grid,"" )
	pVgui("","label","Trebuchet24",grid, LANG.PHEMENU.ABOUT.THANKS .. "\n" .. label.credits )

	tab:AddSheet(PHE.LANG.PHEMENU.ABOUT.TAB,panel,"icon16/information.png")
end)