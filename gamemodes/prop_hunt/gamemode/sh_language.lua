-- Language implementation
PHE.LANGUAGES = {}

-- Load languages
for _, lang in pairs(file.Find("prop_hunt/gamemode/lang/*.lua", "LUA")) do
	AddCSLuaFile("lang/" .. lang)
	include("lang/" .. lang)
end

-- Load english
PHE.LANG = table.Copy(PHE.LANGUAGES["en"])

-- Load selected language
local LANG = PHE.LANGUAGES[GetConVar("ph_language"):GetString()] || {}

-- Some tables will have english on them if the other language has less values
if istable(LANG.CHAT.RANDOM_SPECTATORS) then PHE.LANG.CHAT.RANDOM_SPECTATORS = nil end
if istable(LANG.DEATHNOTICE.SUICIDE) then PHE.LANG.DEATHNOTICE.SUICIDE = nil end

-- Override language
table.Merge(PHE.LANG, LANG)