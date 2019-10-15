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

-- Override language
table.Merge(PHE.LANG, LANG)

-- Some tables will have english on them if the other language has less values
if istable(LANG.CHAT.RANDOM_SPECTATORS) then PHE.LANG.CHAT.RANDOM_SPECTATORS = table.Copy(LANG.CHAT.RANDOM_SPECTATORS) end
if istable(LANG.DEATHNOTICE.SUICIDE) then PHE.LANG.DEATHNOTICE.SUICIDE = table.Copy(LANG.DEATHNOTICE.SUICIDE) end