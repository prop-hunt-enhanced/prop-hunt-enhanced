-- PROP HUNT: ENHANCED CONVARS
-- Playermodels controls convars
local mdlprop 	= CreateConVar("ph_use_custom_plmodel_for_prop", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Should use a custom Player's Model for Props when the round begins?")
local mdlenable = CreateConVar("ph_use_custom_plmodel", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Should use a custom player model available for Hunters?\nPlease note that you must have to activate \'ph_use_custom_plmodel_for_prop\' too!")
-- Tutorial for ph_use_playermodeltype can be found under FAQ.
local mdltype	= CreateConVar("ph_use_playermodeltype", "0", {FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Which model list that should deliver from? 0 = All Playermodels availale, 1 = Use Legacy method: list.Get('PlayerOptionsModel') (Recommended if you want to custom your model list)")

-- Enhanced Prop Hunt specify convars
local cmcoll	= CreateConVar("ph_prop_camera_collisions", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Attempts to stop props from viewing inside walls.")
local fcam		= CreateConVar("ph_freezecam", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Freeze Camera.")
local propcoll	= CreateConVar("ph_prop_collision", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Should Team Props collide with each other?")

-- Custom Taunts ConVars
local ct_delay	= CreateConVar("ph_customtaunts_delay", "6", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "How many in seconds delay for props to play custom taunt again? (Default is 6)")
local ct_enable	= CreateConVar("ph_enable_custom_taunts", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Enable custom taunts for prop teams by pressing C? (Default 0)\n  You must have a list of custom taunts to enable this.")
local nt_delay	= CreateConVar("ph_normal_taunt_delay", "2", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "How many in seconds delay for props to play normal [F3] taunt again? (Default is 2)")

-- The Prop Jump Multiplier (count by float)
local pjumpx	= CreateConVar("ph_prop_jumppower", "1.4", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Multipliers for Prop Jump Power (Do not confused with Prop's Gravity!). Default is 1.4. Min. 1.")

-- The 'Prop Rotation' Notification
local rotation_notify = CreateConVar("ph_notice_prop_rotation", "1", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Enable Prop Rotation notification on every time Prop Spawns.")

-- Freezecam Sound Overrides & Cue Path checks (make sure they don't use '\' but instead '/')
local fc_sound	= CreateConVar("ph_fc_use_single_sound", "0", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Use single Freezecam sound instead of sound list?")
local fc_cue	= CreateConVar("ph_fc_cue_path", "misc/freeze_cam.wav", {FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Path for single Freezecam sound.")
if SERVER then
	cvars.AddChangeCallback("ph_fc_cue_path", function(cvar,old,new) PHE.LegalCuePath = string.Replace(new, "\\", "/") end, "fc_path_modify")
end

-- Lucky Ball ConVars
local lball		= CreateConVar("ph_enable_lucky_balls", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY }, "Spawn Lucky balls on breakable props?")
local dball		= CreateConVar("ph_enable_devil_balls", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY }, "Spawn Devil balls when hunter dies?")

-- PlayerID on Team Specific
local plnames	= CreateConVar("ph_enable_plnames", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Serverside control for if a clients see client\'s team player names through walls.")

-- Generic Prop Hunt ConVars
local h_penalty	= CreateConVar("ph_hunter_fire_penalty", "5", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Health points removed from hunters when they shoot.")
local h_killbns	= CreateConVar("ph_hunter_kill_bonus", "100", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "How much health to give back to the Hunter after killing a prop.")
local h_swap	= CreateConVar("ph_swap_teams_every_round", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Should teams swapped on every round?")
local game_time	= CreateConVar("ph_game_time", "30", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Maximum Time Left (in minutes) - Default is 30 minutes.")
local blind_time = CreateConVar("ph_hunter_blindlock_time", "30", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "How long hunters are blinded (in seconds)")
local round_time = CreateConVar("ph_round_time", "300", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Time (in seconds) for each rounds.")
local round_map	= CreateConVar("ph_rounds_per_map", "10", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Numbers played on a map (Default: 10)")

-- Round Control
local wait_pl	= CreateConVar( "ph_waitforplayers", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Should we wait for players for proper round?" )
local wait_pl_min = CreateConVar( "ph_min_waitforplayers", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Numbers of mininum players that we should wait for round start. Value must not contain less than 1." )

-- Verbose mode & Function
local verbose	= CreateConVar("ph_print_verbose", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Developer Verbose. Some printed messages will only appear if this is enabled.")
function printVerbose(text)
	if GetConVar("ph_print_verbose"):GetBool() && text then
		print(tostring(text))
	end
end

-- Autotaunt delay (in seconds)
local at_delay	= CreateConVar("ph_autotaunt_delay", "45", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "The delay for the auto taunt")

-- Is autotaunt enabled
local at_enable	= CreateConVar("ph_autotaunt_enabled", "1",{ FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Should auto taunting be enabled")

-- Use newer model for Bren MK
local mkbren_new = CreateConVar("ph_mkbren_use_new_mdl", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Use new model for Bren MK II Bonus Weapon (Require Map Restart!!)")

-- OBB Model Data Modifier, specified on map.
local obb_mod	= CreateConVar("ph_sv_enable_obb_modifier", "1",{ FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Developer: Enable OBB Model Data Modifier")
local obb_every = CreateConVar("ph_reload_obb_setting_everyround", "1",{ FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Developer: Reload OBB Model Data Modifier Every round Restarts")

-- This is for a temporary.
local check_boundaries = CreateConVar("phe_check_props_boundaries", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY }, "[EXPERIMENTAL] This feature is under Work-in-Progress! Enable prop boundaries Check? This will prevent you to stuck with other objects/Wall.")