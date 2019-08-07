LANG = {}
-- Cualquier persona es bienvenida a mejorar esta traduccion (soy argentino y no se la regla de las tildes) - Fafy

-- Language code and name
LANG.Code = "es"
LANG.Name = "español"
LANG.NameEnglish = "spanish"

LANG.Help = [[	Un modo de juego mejorado basado en el clásico 'Prop Hunt'

	Para ver más ayuda, abra el 'Menú de Prop Hunt'.

	Versión: %u Revisión: %s
		Que hay de nuevo:
		- Soporte para múltiples idiomas
		- Más opciones en el Menú de Prop Hunt
		- Gamemode mejor optimizado
		- Y mucho más!

	Traducción al español por Fafy!
	]]

-- HUD elements
LANG.HUD = {}

LANG.HUD.HEALTH = "SALUD"
LANG.HUD.AMMO = "MUNICIÓN"
LANG.HUD.TIME = "TIEMPO"
LANG.HUD.ROUND = "RONDA"

LANG.HUD.ROTLOCKON = "Rotación de Prop: Bloqueada"
LANG.HUD.ROTLOCKOFF = "Rotación de Prop: Libre"
LANG.HUD.FREEZECAM = "Fuiste asesinado por %s"

LANG.HUD.WAIT = "Esperando jugadores..."
LANG.HUD.WIN = "%s ganan!"
LANG.HUD.DRAW = "Empate, todos pierden!"

LANG.HUD.BLINDTIME = "Los Hunters serán liberados en %s"
LANG.HUD.BLINDEND = "Listos o no, aquí vamos!"

-- Kill text (X killed Y)
LANG.DEATHNOTICE = {}
LANG.DEATHNOTICE.KILLED = "mató a"

LANG.DEATHNOTICE.SUICIDE = {
	"se suicidó",
	"se mató",
	"está borracho",
	"murió por arte de magia",
	"se tropezó con un palo",
	"murió misteriosamente",
}

-- Common
LANG.MISC = {}

LANG.MISC.ACCEPT = "Aceptar"
LANG.MISC.CLOSE = "Cerrar"
LANG.MISC.TIMELEFT = "Tiempo Restante: %s"
LANG.MISC.NOTIMELEFT = "El juego finalizará después de esta ronda"

-- Derma elements
LANG.DERMA = {}

-- Team selection screen (F2)
LANG.DERMA.TEAMSELECT = "Elegir equipo"

-- F1 screeen
LANG.DERMA.RTV = "Votar Cambio de Mapa (RTV)"
LANG.DERMA.PHMENU = "Menú de Prop Hunt"
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
	"",
}

-- // ** PHE Menú (F1 > PHE Menú) ** // --
LANG.PHEMENU = {}


LANG.PHEMENU.HELP = {}
LANG.PHEMENU.HELP.TAB = "Ayuda (en ingles)"

LANG.PHEMENU.MUTE = {}
LANG.PHEMENU.MUTE.TAB = "Silenciar"
LANG.PHEMENU.MUTE.SELECT = "Selecciona un jugador que desees silenciar."

LANG.PHEMENU.PLAYER = {}
LANG.PHEMENU.PLAYER.TAB = "Jugador"
LANG.PHEMENU.PLAYER.OPTIONS = "Opciones para jugadores:"

LANG.PHEMENU.PLAYER.ph_cl_halos = "Alternar el efecto 'Halo' al elegir una prop"
LANG.PHEMENU.PLAYER.ph_cl_pltext = "Mostrar nombres de compañeros arriba de sus cabezas (y mostrar a través de las paredes también)"
LANG.PHEMENU.PLAYER.ph_cl_endround_sound = "Reproducir un sonido al final de cada ronda"
LANG.PHEMENU.PLAYER.ph_cl_autoclose_taunt = "Cerrar ventana de Taunts al hacer doble click en un sonido"
LANG.PHEMENU.PLAYER.ph_cl_spec_hunter_line = "Dibujar una línea en los hunters para saber dónde apuntan en modo espectador"
LANG.PHEMENU.PLAYER.cl_enable_luckyballs_icon = "Mostrar icono de Bola de la Suerte 'Lucky ball' cuando estas aparecen"
LANG.PHEMENU.PLAYER.cl_enable_devilballs_icon = "Mostrar icono de Bola del Diablo 'Devil ball' cuando estas aparecen"
LANG.PHEMENU.PLAYER.ph_cl_taunt_key = "Botón para reproducir un taun aleatorio"

LANG.PHEMENU.PLAYER.ph_hud_use_new = "Usar HUD nueva de PH: Enhanced"
LANG.PHEMENU.PLAYER.ph_show_tutor_control = "Mostrar tutorial (solo 2 veces al spawnear como prop)"
LANG.PHEMENU.PLAYER.ph_show_custom_crosshair = "Mostrar Crosshair personalizada"
LANG.PHEMENU.PLAYER.ph_show_team_topbar = "Mostrar la cantidad total de jugadores vivos arriba a la derecha (al menos 4 jugadores se mostraran)"

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

LANG.PHEMENU.ADMINS.ph_notice_prop_rotation = "Mostrar notificación de 'Rotación de Prop' en cada spawn de Props"
LANG.PHEMENU.ADMINS.ph_prop_camera_collisions = "Habilitar la colisión de las cámaras de Props con las paredes"
LANG.PHEMENU.ADMINS.ph_freezecam = "Habilitar cámara de muerte para el equipo Props"
LANG.PHEMENU.ADMINS.ph_prop_collision = "Habilitar colisiones de Props entre sí"
LANG.PHEMENU.ADMINS.ph_swap_teams_every_round = "Intercambiar equipos cada ronda - Desactivar esto significa que los equipos nunca cambiaran"
LANG.PHEMENU.ADMINS.ph_hunter_fire_penalty = "Penalidad de salud de los Hunters"
LANG.PHEMENU.ADMINS.ph_hunter_kill_bonus = "Recompensa de salud de los Hunters"
LANG.PHEMENU.ADMINS.ph_hunter_smg_grenades = "Granadas SMG de los Hunters"
LANG.PHEMENU.ADMINS.ph_game_time = "Tiempo total del juego (minutos)"
LANG.PHEMENU.ADMINS.ph_hunter_blindlock_time = "Tiempo de ceguera de los Hunters (segundos)"
LANG.PHEMENU.ADMINS.ph_round_time = "Tiempo de rondas (segundos)"
LANG.PHEMENU.ADMINS.ph_rounds_per_map = "Cantidad máxima de rondas por mapa"
LANG.PHEMENU.ADMINS.ph_enable_lucky_balls = "Permitir que 'Lucky Balls' aparezcan en props rompibles (probabilidades son 8%)"
LANG.PHEMENU.ADMINS.ph_enable_devil_balls = "Permitir que 'Lucky Balls' aparezcan cuando un Hunter muere (probablilidades son 70%)"
LANG.PHEMENU.ADMINS.ph_waitforplayers = "Esperar a jugadores para comenzar el juego"
LANG.PHEMENU.ADMINS.ph_min_waitforplayers = "Cantidad mínima de jugadores para comenzar el juego"

LANG.PHEMENU.ADMINS.TAUNTMODES = "Habilitar Taunts personalizados."
LANG.PHEMENU.ADMINS.TAUNTMODE0 = "Modo [0/F3]: Taunt al azar"
LANG.PHEMENU.ADMINS.TAUNTMODE1 = "Modo [1/C]: Taunt personalizado"
LANG.PHEMENU.ADMINS.TAUNTMODE2 = "Modo [2]: Ambos modos"
LANG.PHEMENU.ADMINS.TAUNTSOPEN = "Abrir ventana de Taunts"

LANG.PHEMENU.MAPVOTE = {}

LANG.PHEMENU.MAPVOTE.TAB = "MapVote"
LANG.PHEMENU.MAPVOTE.SETTINGS = "Opciones de MapVote"

LANG.PHEMENU.MAPVOTE.mv_allowcurmap = "Permitir el mapa actual en la votación"
LANG.PHEMENU.MAPVOTE.mv_cooldown = "Habilitar demora para que un mapa aparezca de nuevo"
LANG.PHEMENU.MAPVOTE.mv_use_ulx_votemaps = "Usar lista de mapas de ULX? Si no, se usaran mapas de maps/*.bsp."
LANG.PHEMENU.MAPVOTE.mv_maplimit = "Cantidad de mapas para mostrar en el MapVote."
LANG.PHEMENU.MAPVOTE.mv_timelimit = "Tiempo en segundos para el MapVote."
LANG.PHEMENU.MAPVOTE.mv_mapbeforerevote = "Cambios necesarios para que un mapa aparezca otra vez"
LANG.PHEMENU.MAPVOTE.mv_rtvcount = "Cuantos jugadores se necesitan para cambiar el mapa (RTV)?"

LANG.PHEMENU.MAPVOTE.EXPLANATION1 = "Para configurar que mapas deberían aparecer, utilize (por ejemplo) [ mv_mapprefix 'ph_,cs_,de_' ] en la consola."
LANG.PHEMENU.MAPVOTE.EXPLANATION2 = "Si no puedes comenzar un MapVote, DEBES instalar ULX Admin Mod!"
LANG.PHEMENU.MAPVOTE.EXPLANATION3 = "Para cancelar el MapVote, escribe !unmap_vote en el chat (o unmap_vote en la consola)"

LANG.PHEMENU.MAPVOTE.START = "Comenzar MapVote"
LANG.PHEMENU.MAPVOTE.STOP = "Parar MapVote"

LANG.PHEMENU.ABOUT = {}

LANG.PHEMENU.ABOUT.CURRENTVER = "Versión actual: "
LANG.PHEMENU.ABOUT.CURRENTREV = "Revisión actual: "
LANG.PHEMENU.ABOUT.ENJOYING = "Si estas disfrutando el juego, considera ayudarnos donando!"
LANG.PHEMENU.ABOUT.LINKS = "Links y créditos"
LANG.PHEMENU.ABOUT.THANKS = "Gracias especiales: " -- Necesito uno mejor
LANG.PHEMENU.ABOUT.TAB = "Acerca de PHE"
LANG.PHEMENU.ABOUT.DONATE = "Donar al proyecto PH:E"
LANG.PHEMENU.ABOUT.HOME = "PH:E Página oficial"
LANG.PHEMENU.ABOUT.GITHUB = "Repositorio GitHub"


LANG.PHEMENU.TABS = {}
LANG.PHEMENU.TABS.PLUGINS = "Plugins (BETA)"



-- Saving
PHE.LANGUAGES[LANG.Code] = LANG