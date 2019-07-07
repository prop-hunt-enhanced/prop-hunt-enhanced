LANG = {}
-- No me se la regla de los acentos ni español neutro asi que se aguantan >:C

-- Language code and name
LANG.Code = "es"
LANG.Name = "español"
LANG.NameEnglish = "spanish"
LANG.Help = [[	Un modo de juego mejorado basado en el clasico 'Prop Hunt'

	Para ver mas ayuda, abra el 'Menu de Prop Hunt'.

	Version: ]] .. GAMEMODE._VERSION .. [[  Revision: ]] .. GAMEMODE.REVISION .. [[ 
		Que hay de nuevo:
		- Soporte para multiples idiomas
		- Mas opciones en el Menu de Prop Hunt
		- Gamemode mejor optimizado
		-- Y mucho mas!
	]]

-- HUD elements
LANG.HUD = {}

LANG.HUD.HEALTH = "SALUD"
LANG.HUD.AMMO = "MUNICION"
LANG.HUD.TIME = "TIEMPO"
LANG.HUD.ROUND = "RONDA"
LANG.HUD.WAIT = "Esperando jugadores..."

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

-- Saving
PHE.LANGUAGES[LANG.Code] = LANG