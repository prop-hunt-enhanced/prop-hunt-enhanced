LANG = {}
-- Cualquier persona es bienvenida a mejorar esta traduccion (soy argentino y no se la regla de las tildes) - Fafy

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

	Traducción al español por Fafy!
	]]

-- HUD elements
LANG.HUD = {}

LANG.HUD.HEALTH = "SALUD"
LANG.HUD.AMMO = "MUNICION"
LANG.HUD.TIME = "TIEMPO"
LANG.HUD.ROUND = "RONDA"

LANG.HUD.ROTLOCKON = "Rotacion de Prop: Bloqueada"
LANG.HUD.ROTLOCKOFF = "Rotacion de Prop: Libre"
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
LANG.PHEMENU.MUTE.SELECT = "Select one player that you wish to mute."

LANG.PHEMENU.PLAYER = {}
LANG.PHEMENU.PLAYER.TAB = "Jugador"
LANG.PHEMENU.PLAYER.OPTIONS = "Opciones para jugadores:"

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
LANG.PHEMENU.PLAYERMODEL.TAB = "Modelos para jugadores"
LANG.PHEMENU.PLAYERMODEL.OFF = "Los modelos personalizados están deshabilitados en este servidor!"
LANG.PHEMENU.PLAYERMODEL.SETFOV = "Establecer FOV del modelo"

LANG.PHEMENU.ADMINS = {}
LANG.PHEMENU.ADMINS.TAB = "Administracion" -- Creo que queda mejor considerando el proposito de esa pestaña

LANG.PHEMENU.ADMINS.OPTIONS = "Opciones del servidor (solo visible para admins/dueños)"

LANG.PHEMENU.ADMINS.ph_language = "Idioma del juego (necesita un cambio de mapa)"
LANG.PHEMENU.ADMINS.ph_use_custom_plmodel = "Habilitar modelos personalizados para Hunters"
LANG.PHEMENU.ADMINS.ph_use_custom_plmodel_for_prop = "Habilitar modelos personalizados para Props - Activar para Hunters tambien!"
LANG.PHEMENU.ADMINS.ph_customtaunts_delay = "Demora para Taunts personalizados (segundos)"
LANG.PHEMENU.ADMINS.ph_normal_taunt_delay = "Demora para Taunts normales (segundos)"
LANG.PHEMENU.ADMINS.ph_autotaunt_enabled = "Habilitar Taunts automaticos"
LANG.PHEMENU.ADMINS.ph_autotaunt_delay = "Demora para Taunts automaticos (segundos)"

LANG.PHEMENU.ADMINS.ph_notice_prop_rotation = "Mostrar notificacion de 'Rotacion de Prop' en cada spawn de Props"
LANG.PHEMENU.ADMINS.ph_prop_camera_collisions = "Habilitar la colision de las camaras de Props con las paredes"
LANG.PHEMENU.ADMINS.ph_freezecam = "Habilitar camara de muerte para el equipo Props"
LANG.PHEMENU.ADMINS.ph_prop_collision = "Habilitar colisiones de Props entre sí"
LANG.PHEMENU.ADMINS.ph_swap_teams_every_round = "Intercambiar equipos cada ronda - Desactivar esto significa que los equipos nunca cambiaran"
LANG.PHEMENU.ADMINS.ph_hunter_fire_penalty = "Penalidad de salud de los Hunters"
LANG.PHEMENU.ADMINS.ph_hunter_kill_bonus = "Recompensa de salud de los Huters"
LANG.PHEMENU.ADMINS.ph_hunter_smg_grenades = "Granadas SMG de los Hunters"
LANG.PHEMENU.ADMINS.ph_game_time = "Tiempo total del juego (minutos)"
LANG.PHEMENU.ADMINS.ph_hunter_blindlock_time = "Tiempo de cegera de los Hunters (segundos)"
LANG.PHEMENU.ADMINS.ph_round_time = "Tiempo de rondas (segundos)"
LANG.PHEMENU.ADMINS.ph_rounds_per_map = "Cantidad maxima de rondas por mapa"
LANG.PHEMENU.ADMINS.ph_enable_lucky_balls = "Permitir que 'Lucky Balls' aparezcan en props rompibles (probabilidades son 8%)"
LANG.PHEMENU.ADMINS.ph_enable_devil_balls = "Permitir que 'Lucky Balls' aparezcan cuando un Hunter muere (probablilidades son 70%)"
LANG.PHEMENU.ADMINS.ph_waitforplayers = "Esperar a jugadores para comenzar el juego"
LANG.PHEMENU.ADMINS.ph_min_waitforplayers = "Cantidad minima de jugadores para comenzar el juego"

LANG.PHEMENU.ADMINS.TAUNTMODES = "Habilitar Taunts personalizados."
LANG.PHEMENU.ADMINS.TAUNTMODE0 = "Modo [0/F3]: Taunt al azar"
LANG.PHEMENU.ADMINS.TAUNTMODE1 = "Modo [1/C]: Taunt personalizado"
LANG.PHEMENU.ADMINS.TAUNTMODE2 = "Modo [2]: Ambos modos"
LANG.PHEMENU.ADMINS.TAUNTSOPEN = "Abrir ventana de Taunts"

LANG.PHEMENU.MAPVOTE = {}

LANG.PHEMENU.MAPVOTE.TAB = "MapVote"
LANG.PHEMENU.MAPVOTE.SETTINGS = "Opciones de MapVote"

LANG.PHEMENU.MAPVOTE.mv_allowcurmap = "Permitir el mapa actual en la votacion"
LANG.PHEMENU.MAPVOTE.mv_cooldown = "Habilitar demora para que un mapa aparezca de nuevo"
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