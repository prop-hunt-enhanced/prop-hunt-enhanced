-- Generic Sound Precache function
CreateConVar("ph_precache_phe_core", "1", {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Precache Prop Hunt: Enhanced core sounds during player initial spawn.")
CreateConVar("ph_precache_taunts", "0", {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY}, "Precache Prop Hunt: Enhanced core taunts during player's initial spawn.")

hook.Add("PlayerInitialSpawn", "PHE.PrecacheSoundCore", function()
	-- WARNING: THESE ARE FIXED FOR OPTIMISATION PURPOSE. 
	-- If you want to modify the gamemode, remove this function as well as the ConVars above.
	local path = {
		misc = "misc/",
		core = "prop_idbs/",
		swep = "weapons/mkbren/",
		swepb = "weapons/brenmk3/",
		
		generic = "gamemode/prop_hunt/content/sound/"
	}
	
	local function PrecacheThis(path)
		if file.Exists(path, "GAME") then
			wav = file.Find(path.."*.wav", "GAME")
			mp3 = file.Find(path.."*.mp3", "GAME")
			
			printVerbose("[PH:E] Precaching Sound Core...")
			for _,snd in pairs(wav) do util.PrecacheSound(snd) end
			for _,sndm in pairs(mp3) do util.PrecacheSound(sndm) end
		end
	end

	if GetConVar("ph_precache_phe_core"):GetBool() then
		PrecacheThis(path.generic..path.misc)
		PrecacheThis(path.generic..path.core)
		PrecacheThis(path.generic..path.swep)
		PrecacheThis(path.generic..path.swepb)
	end
	
	if GetConVar("ph_precache_taunts"):GetBool() then
		timer.Simple(3, function()
			for _,ptaunts in pairs(PHE.PROP_TAUNTS) do util.PrecacheSound(ptaunts) end
			for _,htaunts in pairs(PHE.HUNTER_TAUNTS) do util.PrecacheSound(htaunts) end
		end)
	end
end)