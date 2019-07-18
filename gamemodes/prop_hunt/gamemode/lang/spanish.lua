LANG = {}
-- No me se la regla de los acentos ni español neutro asi que se aguantan >:C

-- Language code and name
LANG.Code = "es"
LANG.Name = "español"
LANG.NameEnglish = "spanish"

LANG.Help = [[	Un modo de juego mejorado basado en el clasico 'Prop Hunt'

	Para ver mas ayuda, abra el 'Menu de Prop Hunt'.

	Version: %u  Revision: %s
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

LANG.HUD.ROTLOCKON = "Prop Rotation Lock: Enabled"
LANG.HUD.ROTLOCKOFF = "Prop Rotation Lock: Disabled"
LANG.HUD.FREEZECAM = "Fuiste asesinado por %s"

LANG.HUD.WAIT = "Esperando jugadores..."
LANG.HUD.WIN = "%s ganan!"
LANG.HUD.DRAW = "Empate, todos pierden!"

LANG.HUD.BLINDTIME = "Los Hunters serán liberados en %s"
LANG.HUD.BLINDEND = "Listos o no, ahi vamos!"

--  Kill text (X killed Y)
LANG.DEATHNOTICE = {}
LANG.DEATHNOTICE.KILLED = "mató a"

LANG.DEATHNOTICE.SUICIDE = {
	"se suicidó",
	"se mató",
	"esta borracho",
	"murió por arte de magia",
	"se tropezó con un palo",
	"murió misteriosamente",
}

-- Common
LANG.MISC = {}

LANG.MISC.ACCEPT = "Aceptar"
LANG.MISC.CLOSE = "Cerrar"
LANG.MISC.TIMELEFT = "Tiempo Restante: %s"
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
LANG.DERMA.PLAYER = "(%d jugador)"
LANG.DERMA.PLAYERS = "(%d jugadores)"
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

-- // ** PHE Menu (F1 > PHE Menu) ** // --
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
LANG.PHEMENU.MAPVOTE.SETTINGS = "Opciones de MapVote"

LANG.PHEMENU.MAPVOTE.mv_allowcurmap = "Permitir el mapa actual en la votacion"
LANG.PHEMENU.MAPVOTE.mv_cooldown = "Enable map Cooldown for voting" -- No se ni que hace?
LANG.PHEMENU.MAPVOTE.mv_use_ulx_votemaps = "Usar lista de mapas de ULX? Si nó, se usaran mapas de maps/*.bsp."
LANG.PHEMENU.MAPVOTE.mv_maplimit = "Cantidad de mapas para mostrar en el MapVote."
LANG.PHEMENU.MAPVOTE.mv_timelimit = "Tiempo en segundos para el MapVote."
LANG.PHEMENU.MAPVOTE.mv_mapbeforerevote = "Cambios necesarios para que un mapa aparezca otra vez"
LANG.PHEMENU.MAPVOTE.mv_rtvcount = "Cuantos jugadores se necesitan para cambiar el mapa (RTV)?"

LANG.PHEMENU.MAPVOTE.EXPLANATION1 = "Para configurar que mapas deberian aparecer, utilize (por ejemplo) [ mv_mapprefix 'ph_,cs_,de_' ] en la consola."
LANG.PHEMENU.MAPVOTE.EXPLANATION2 = "Si no puedes comenzar un MapVote, DEBES instalar ULX Admin Mod!"
LANG.PHEMENU.MAPVOTE.EXPLANATION3 = "Para cancelar el MapVote, escribe !unmap_vote en el chat (o unmap_vote en la consola)"

LANG.PHEMENU.MAPVOTE.START = "Comenzar MapVote"
LANG.PHEMENU.MAPVOTE.STOP = "Parar MapVote"

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