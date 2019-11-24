local LANG = {}

-- Language code and name
LANG.Code = "en"
LANG.Name = "english"
LANG.NameEnglish = "english"

LANG.Help = [[	An Enhanced Classic Prop Hunt Gamemode.
To See More Help, Click 'Prop Hunt Menu' for more!

	Version: %u  Revision: %s
		What's New:
		- Multilanguage support (WIP)
		- More options on PHE menu
		- More optimization
		- And much more!
	]]

-- HUD elements
LANG.HUD = {}

LANG.HUD.HEALTH = "HEALTH"
LANG.HUD.AMMO = "AMMO"
LANG.HUD.TIME = "TIME"
LANG.HUD.ROUND = "ROUND"

LANG.HUD.ROTLOCKON = "Prop Rotation: Locked"
LANG.HUD.ROTLOCKOFF = "Prop Rotation: Free"
LANG.HUD.FREEZECAM = "You were killed by %s"

LANG.HUD.WAIT = "Waiting for players..."
LANG.HUD.WIN = "%s win!"
LANG.HUD.DRAW = "Draw, everyone loses!"

LANG.HUD.BLINDTIME = "Hunters will be unblinded and released in %s"
LANG.HUD.BLINDEND = "Ready or not, here we come!"

--  Kill text (X killed Y)
LANG.DEATHNOTICE = {}
LANG.DEATHNOTICE.KILLED = "killed"

LANG.DEATHNOTICE.SUICIDE = {
	"suicided!",
	"died mysteriously.",
	"died from magic.",
	"no-scoped themself.",
	"has just ragequit.",
	"is drunk.",
	"died... better luck next time!",
	"slapped themself.",
	"tripped on a stick.",
	"died by the force.",
	"ragdolled.",
}

-- Common
LANG.MISC = {}

LANG.MISC.ACCEPT = "Accept"
LANG.MISC.CLOSE = "Close"
LANG.MISC.TIMELEFT = "Time Left: %s"
LANG.MISC.NOTIMELEFT = "Game will end after this round"

-- Derma elements
LANG.DERMA = {}

-- Team selection screen (F2)
LANG.DERMA.TEAMSELECT = "Choose Team"

-- F1 screeen
LANG.DERMA.RTV = "Vote For Change (RTV)"
LANG.DERMA.PHMENU = "Prop Hunt Menu"
LANG.DERMA.CHANGETEAM = "Change Team"

-- Scoreboard
LANG.DERMA.PLAYER = "(%d player)"
LANG.DERMA.PLAYERS = "(%d players)"
LANG.DERMA.NAME = "Name"
LANG.DERMA.KILLS = "Kills"
LANG.DERMA.DEATHS = "Deaths"
LANG.DERMA.PING = "Ping"

-- Chat messages
LANG.CHAT = {}

LANG.CHAT.NOTENOUGHPLYS = "There's not enough players to start the game!"
LANG.CHAT.SWAP = "Teams have been swapped!"

LANG.CHAT.JOINED = " joined "
LANG.CHAT.JOINEDTHE = " joined the "

LANG.CHAT.SWAPBALANCE = "%s has been changed to %s for team balance."
LANG.CHAT.SWAPBALANCEYOU = "You were swapped to achieve perfect balance." -- Smile... for even in death, you have become children of Thanos

LANG.CHAT.RANDOM_SPECTATORS = {
	"to watch and chill.",
	"to see them hanging around.",
	"to see the things.",
	"",
}

-- PHE Menu (F1 > PHE Menu)
LANG.PHEMENU = {}


LANG.PHEMENU.HELP = {}
LANG.PHEMENU.HELP.TAB = "Help"

LANG.PHEMENU.MUTE = {}
LANG.PHEMENU.MUTE.TAB = "Mute"
LANG.PHEMENU.MUTE.SELECT = "Select one player that you wish to mute."

LANG.PHEMENU.PLAYER = {}
LANG.PHEMENU.PLAYER.TAB = "Player"
LANG.PHEMENU.PLAYER.OPTIONS = "Player Options:"

LANG.PHEMENU.PLAYER.ph_cl_halos = "Toggle Halo effect when choosing a prop"
LANG.PHEMENU.PLAYER.ph_cl_pltext = "Show Team player names above their heads instead (and appear through wall too)"
LANG.PHEMENU.PLAYER.ph_cl_endround_sound = "Play End round sound cue"
LANG.PHEMENU.PLAYER.ph_cl_autoclose_taunt = "Option for Auto closing for Taunt window when double-clicking them"
LANG.PHEMENU.PLAYER.ph_cl_spec_hunter_line = "Draw a line on hunters so we can see their aim in spectator mode."
LANG.PHEMENU.PLAYER.cl_enable_luckyballs_icon = "Enable 'Lucky ball' icon to be displayed once they are spawned"
LANG.PHEMENU.PLAYER.cl_enable_devilballs_icon = "Enable 'Devil ball' icon to be displayed once they are spawned"
LANG.PHEMENU.PLAYER.ph_cl_taunt_key = "Button to play a random taunt"

LANG.PHEMENU.PLAYER.ph_hud_use_new = "Use New PH: Enhanced HUD"
LANG.PHEMENU.PLAYER.ph_show_tutor_control = "Show Tutorial Pop-up (Shown only 2x on each prop spawns)"
LANG.PHEMENU.PLAYER.ph_show_custom_crosshair = "Enable Custom Crosshair"
LANG.PHEMENU.PLAYER.ph_show_team_topbar = "Show total alive team players bar on the top left (At least 4 Players will be shown)"

LANG.PHEMENU.PLAYERMODEL = {}
LANG.PHEMENU.PLAYERMODEL.TAB = "Playermodels"
LANG.PHEMENU.PLAYERMODEL.OFF = "Sorry, Custom Player Model is disabled on this server!"
LANG.PHEMENU.PLAYERMODEL.SETFOV = "Set Model FOV"


LANG.PHEMENU.ADMINS = {}
LANG.PHEMENU.ADMINS.TAB = "Admins"

LANG.PHEMENU.ADMINS.OPTIONS = "Serverside gamemode Options (Only visible for Admins/Owner)"

LANG.PHEMENU.ADMINS.ph_language = "Gamemode language (requires map change)"
LANG.PHEMENU.ADMINS.ph_use_custom_plmodel = "Enable custom models for Hunters"
LANG.PHEMENU.ADMINS.ph_use_custom_plmodel_for_prop = "Enable custom models for Props - Make sure to enable for Hunter too."
LANG.PHEMENU.ADMINS.ph_customtaunts_delay = "Custom Taunts Delay (Seconds)"
LANG.PHEMENU.ADMINS.ph_normal_taunt_delay = "Normal Taunts Delay (Seconds)"
LANG.PHEMENU.ADMINS.ph_autotaunt_enabled = "Enable Auto Taunt Features"
LANG.PHEMENU.ADMINS.ph_autotaunt_delay = "Auto Taunts Delay (Seconds)"
LANG.PHEMENU.ADMINS.ph_forcejoinbalancedteams = "Force players to even out teams upon joining"
LANG.PHEMENU.ADMINS.ph_autoteambalance = "Automatically even out teams at the start of a round"
LANG.PHEMENU.ADMINS.ph_allow_prop_pickup = "Allow pick up of small props (0 = No; 1 = Yes; 2 = Only Hunters)"

LANG.PHEMENU.ADMINS.ph_notice_prop_rotation = "Display 'Prop Rotation' notification on every Prop Spawns"
LANG.PHEMENU.ADMINS.ph_prop_camera_collisions = "Enable Prop Camera collision to the wall"
LANG.PHEMENU.ADMINS.ph_freezecam = "Enable Freecam features for team props"
LANG.PHEMENU.ADMINS.ph_prop_collision = "Enable Prop collide on each other prop players"
LANG.PHEMENU.ADMINS.ph_swap_teams_every_round = "Swap team every round - Disabling means team will stay forever"
LANG.PHEMENU.ADMINS.ph_hunter_fire_penalty = "Hunter health penalty"
LANG.PHEMENU.ADMINS.ph_hunter_kill_bonus = "Hunter kill bonus"
LANG.PHEMENU.ADMINS.ph_hunter_smg_grenades = "Hunter SMG grenades"
LANG.PHEMENU.ADMINS.ph_game_time = "Total Game time (Minutes)"
LANG.PHEMENU.ADMINS.ph_hunter_blindlock_time = "Hunter blindlock time (Seconds)"
LANG.PHEMENU.ADMINS.ph_round_time = "Game round time (Seconds)"
LANG.PHEMENU.ADMINS.ph_rounds_per_map = "Total game Rounds per Map"
LANG.PHEMENU.ADMINS.ph_enable_lucky_balls = "Allow Lucky Balls Features to be spawned on breakable props (Chance is 8%)"
LANG.PHEMENU.ADMINS.ph_enable_devil_balls = "Allow Devil Balls Features to be spawned when hunter dies (Chance is 70%)"
LANG.PHEMENU.ADMINS.ph_waitforplayers = "Wait for Players to begin the gameplay"
LANG.PHEMENU.ADMINS.ph_min_waitforplayers = "Mininum Players to Wait before the game starts (default: 1)"

LANG.PHEMENU.ADMINS.TAUNTMODES = "Enable Custom Taunt."
LANG.PHEMENU.ADMINS.TAUNTMODE0 = "Mode [0/F3]: Random Taunt"
LANG.PHEMENU.ADMINS.TAUNTMODE1 = "Mode [1/C]: Custom Taunt"
LANG.PHEMENU.ADMINS.TAUNTMODE2 = "Mode [2]: Both Modes"
LANG.PHEMENU.ADMINS.TAUNTSOPEN = "Open Taunt Window"

LANG.PHEMENU.MAPVOTE = {}

LANG.PHEMENU.MAPVOTE.TAB = "MapVote"
LANG.PHEMENU.MAPVOTE.SETTINGS = "MapVote Settings"

LANG.PHEMENU.MAPVOTE.mv_allowcurmap = "Allow Current map to be Voted"
LANG.PHEMENU.MAPVOTE.mv_cooldown = "Enable map Cooldown for voting"
LANG.PHEMENU.MAPVOTE.mv_use_ulx_votemaps = "Use map listing from ULX Mapvote? If not, default maps/*.bsp will be used."
LANG.PHEMENU.MAPVOTE.mv_maplimit = "Number of Maps to be shown in MapVote."
LANG.PHEMENU.MAPVOTE.mv_timelimit = "Time in Seconds for default mapvote when voting."
LANG.PHEMENU.MAPVOTE.mv_mapbeforerevote = "Map changes needed for a map to reappear"
LANG.PHEMENU.MAPVOTE.mv_rtvcount = "How many players required to use RTV (Rock the Vote)"

LANG.PHEMENU.MAPVOTE.EXPLANATION1 = "To Setup which map should be listed, use (for example) [ mv_mapprefix 'ph_,cs_,de_' ] in the console."
LANG.PHEMENU.MAPVOTE.EXPLANATION2 = "If you are unable to do a MapVote, you NEED to install ULX Admin Mod!"
LANG.PHEMENU.MAPVOTE.EXPLANATION3 = "MapVote Action (To cancel, simply type !unmap_vote in the chat or type 'unmap_vote' in console)"

LANG.PHEMENU.MAPVOTE.START = "Start MapVote"
LANG.PHEMENU.MAPVOTE.STOP = "Stop MapVote"
--                   YOU VIOLATED THE LAW!

LANG.PHEMENU.ABOUT = {}

LANG.PHEMENU.ABOUT.CURRENTVER = "Current Version: "
LANG.PHEMENU.ABOUT.CURRENTREV = "Current Revision: "
LANG.PHEMENU.ABOUT.ENJOYING = "If you are enjoying the game, consider donating!"
LANG.PHEMENU.ABOUT.LINKS = "Links and credits"
LANG.PHEMENU.ABOUT.THANKS = "Special thanks: "
LANG.PHEMENU.ABOUT.TAB = "About PHE"
LANG.PHEMENU.ABOUT.DONATE = "Donate to PH:E project"
LANG.PHEMENU.ABOUT.HOME = "PH:E Official Homepage"
LANG.PHEMENU.ABOUT.GITHUB = "GitHub Repository"

-- Saving
PHE.LANGUAGES[LANG.Code] = LANG