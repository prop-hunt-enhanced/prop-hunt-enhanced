LANG = {}

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

LANG.HUD.ROTLOCKON = "Prop Rotation Lock: Enabled"
LANG.HUD.ROTLOCKOFF = "Prop Rotation Lock: Disabled"
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

LANG.PHEMENU.PLAYERMODEL = {}
LANG.PHEMENU.PLAYERMODEL.TAB = "Playermodels"

LANG.PHEMENU.ADMINS = {}
LANG.PHEMENU.ADMINS.TAB = "Admins"

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


LANG.PHEMENU.TABS = {}
LANG.PHEMENU.TABS.PLUGINS = "Plugins (BETA)"



-- Saving
PHE.LANGUAGES[LANG.Code] = LANG