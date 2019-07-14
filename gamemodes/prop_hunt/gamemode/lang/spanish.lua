LANG = {}
-- No me se la regla de los acentos ni español neutro asi que se aguantan >:C

-- Language code and name
LANG.Code = "es"
LANG.Name = "español"
LANG.NameEnglish = "spanish"

LANG.Help = [[	Un modo de juego mejorado basado en el clasico 'Prop Hunt'

	Para ver mas ayuda, abra el 'Menu de Prop Hunt'.

	Version: {VERSION}  Revision: {REVISION} 
		Que hay de nuevo:
		- Soporte para multiples idiomas
		- Mas opciones en el Menu de Prop Hunt
		- Gamemode mejor optimizado
		- Y mucho mas!
	]]

-- HUD elements
LANG.HUD = {}

LANG.HUD.HEALTH = "SALUD"
LANG.HUD.AMMO = "MUNICION"
LANG.HUD.TIME = "TIEMPO"
LANG.HUD.ROUND = "RONDA"

LANG.HUD.WAIT = "Esperando jugadores..."
LANG.HUD.WIN = "{TEAM} ganan!"
LANG.HUD.PROPSWIN = "{PROPS} ganan!"
LANG.HUD.DRAW = "Empate, todos pierden!"

LANG.HUD.BLINDTIME = "Los Hunters serán liberados en "
LANG.HUD.BLINDEND = "Listos o no, ahi vamos!"

-- Common
LANG.MISC = {}

LANG.MISC.ACCEPT = "Aceptar"
LANG.MISC.CLOSE = "Cerrar"
LANG.MISC.TIMELEFT = "Tiempo Restante: "
LANG.MISC.NOTIMELEFT = "El juego finalizara despues de esta ronda"

-- Derma elements
LANG.DERMA = {}

-- Team selection screen (F2)
LANG.DERMA.TEAMSELECT = "Elegir equipo"

-- F1 screeen
LANG.DERMA.RTV = "Votar Cambio de Mapa (RTV)"
LANG.DERMA.PHMENU = "Menu de Prop Hunt"
LANG.DERMA.CHANGETEAM = "Cambiar de Equipo"

-- Scoreboard
LANG.DERMA.PLAYERS = " Jugadores"
LANG.DERMA.NAME = "Nombre"
LANG.DERMA.KILLS = "Kills" -- Ayuda
LANG.DERMA.DEATHS = "Muertes"
LANG.DERMA.PING = "Ping" -- Latencia es muy largo y no entra

-- Chat messages
LANG.CHAT = {}

LANG.CHAT.NOTENOUGHPLYS = "No hay suficientes jugadores para comenzar el juego!"
LANG.CHAT.SWAP = "Los equipos se intercambiaron!"

LANG.CHAT.JOINED = " se unió a "
LANG.CHAT.JOINEDTHE = " se unió a los "

LANG.CHAT.RANDOM_SPECTATORS = {
	"para observar las cosas.",
	"para disfrutar el caos.",
	"para mirar y relajarse.",
	".",
}

-- PHE Menu (F1 > PHE Menu)
LANG.PHEMENU = {}


LANG.PHEMENU.HELP = {}
LANG.PHEMENU.HELP.TAB = "Ayuda (en ingles)"

LANG.PHEMENU.MUTE = {}
LANG.PHEMENU.MUTE.TAB = "Silenciar"

LANG.PHEMENU.PLAYERMODEL = {}
LANG.PHEMENU.PLAYERMODEL.TAB = "Modelo de jugador"

LANG.PHEMENU.ADMINS = {}
LANG.PHEMENU.ADMINS.TAB = "Administracion" -- Creo que queda mejor considerando el proposito de esa pestaña

LANG.PHEMENU.MAPVOTE = {}
LANG.PHEMENU.MAPVOTE.TAB = "MapVote"

LANG.PHEMENU.ABOUT = {}

LANG.PHEMENU.ABOUT.CURRENTVER = "Version actual: "
LANG.PHEMENU.ABOUT.CURRENTREV = "Revision actual: "
LANG.PHEMENU.ABOUT.ENJOYING = "Si estas disfrutando el juego, considera ayudarnos donando!"
LANG.PHEMENU.ABOUT.LINKS = "Links y creditos"
LANG.PHEMENU.ABOUT.THANKS = "Gracias especiales: " -- Necesito uno mejor
LANG.PHEMENU.ABOUT.TAB = "Acerca de PHE"
LANG.PHEMENU.ABOUT.DONATE = "Donar al proyecto PH:E"
LANG.PHEMENU.ABOUT.HOME = "PH:E Pagina oficial"
LANG.PHEMENU.ABOUT.GITHUB = "Repositorio GitHub"


LANG.PHEMENU.TABS = {}
LANG.PHEMENU.TABS.PLUGINS = "Plugins (BETA)"



-- Saving
PHE.LANGUAGES[LANG.Code] = LANG