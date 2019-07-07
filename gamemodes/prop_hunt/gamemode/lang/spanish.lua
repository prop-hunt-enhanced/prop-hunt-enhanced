LANG = {}
-- No me se la regla de los acentos ni español neutro asi que se aguantan >:C

-- Language code and name
LANG.Code = "es"
LANG.Name = "español"
LANG.NameEnglish = "spanish"

LANG.Help = [[	Un modo de juego mejorado basado en el clasico 'Prop Hunt'

	Para ver mas ayuda, abra el 'Menu de Prop Hunt'.

	Version: ]] .. GM._VERSION .. [[  Revision: ]] .. GM.REVISION .. [[ 
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
LANG.DERMA.PING = "Ping" -- No hay traduccion creo

-- Chat
LANG.CHAT = {}

LANG.CHAT.NOTENOUGHPLYS = "No hay suficientes jugadores para comenzar el juego!"
LANG.CHAT.SWAP = "Los equipos se intercambiaron!"

LANG.CHAT.JOINED = " se unió a "
LANG.CHAT.JOINEDTHE = " se unió a los "

LANG.CHAT.RANDOM_SPECTATORS = {
	"para observar las cosas.",
	".",
	"para mirar y relajarse."
}

-- Saving
PHE.LANGUAGES[LANG.Code] = LANG