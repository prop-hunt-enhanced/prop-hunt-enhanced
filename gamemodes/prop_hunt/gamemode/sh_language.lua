-- Language implementation
PHE.LANGUAGES = {}

-- Load languages
for _, lang in pairs(file.Find("prop_hunt/gamemode/lang/*.lua", "LUA")) do
	AddCSLuaFile("lang/" .. lang)
	include("lang/" .. lang)
end

-- Load english
PHE.LANG = table.Copy(PHE.LANGUAGES["en"])
-- Override language
table.Merge(PHE.LANG, PHE.LANGUAGES[GetConVar("ph_language"):GetString()] || {})