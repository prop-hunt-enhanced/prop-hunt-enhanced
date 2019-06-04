-- In here you can add two team taunts without seperating them.
local taunts = {}

-- Begin Table: Hunters
taunts.Hunter = {
	["Guuuh!"]						=	"vo/k_lab/ba_guh.wav",
	["If you See Dr. Breen"]		= 	"vo/streetwar/rubble/ba_tellbreen.wav"
	-- Add more Hunters Taunt here...
}
-- Begin Table: Props
taunts.Props = {
	["Windows XP Shutdown"]			=	"taunts/ph_enhanced/ext_xp_off.wav",
	["Windows XP Startup"]			=	"taunts/ph_enhanced/ext_xp_start.wav"
	-- Add more Props Taunt here...
}

-- if everything's done with above, let's add them as the list. 
-- They will be automatically added as soon as the game loads!
for propTaunt,propPath in pairs(taunts.Props) do list.Set("PHE.CustomPropTaunts", propTaunt, propPath) end
for hunterTaunt,hunterPath in pairs(taunts.Hunter) do list.Set("PHE.CustomHunterTaunts", hunterTaunt, hunterPath) end


-- You can also add your custom taunts outside from this scope with your own [ list.Set("PHE.Custom<Prop/Hunter>Taunts", "Taunt Name", "Your Taunt Path") ]