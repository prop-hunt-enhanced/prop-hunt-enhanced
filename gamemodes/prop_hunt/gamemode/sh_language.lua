-- Language implementation
PHE.LANGUAGES = {}

-- Include languages
AddCSLuaFile("lang/english.lua")
include("lang/english.lua")

AddCSLuaFile("lang/spanish.lua")
include("lang/spanish.lua")

-- Load english
PHE.LANG = PHE.LANGUAGES["en"]
-- Override language
table.Merge(PHE.LANG, PHE.LANGUAGES[GetConVar("ph_language"):GetString()] || {})