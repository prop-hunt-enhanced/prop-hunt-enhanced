
local LANG = {}

-- Language code and name
LANG.Code = "fr"
LANG.Name = "français"
LANG.NameEnglish = "french"

LANG.Help = [[	Un Prop Hunt Classique amélioré.
Pour afficher l'aide, Clic sur 'Prop Hunt Menu'.
	Version: %u  Revision: %s
		Nouveautés:
		- Support Multilangues (WIP)
		- Plus d'options dans le menu PHE
		- Optimisations
		- Et plus encore !

	Traduction par lucas2107 et TR1NITY !
	]]

-- HUD elements
LANG.HUD = {}

LANG.HUD.HEALTH = "SANTÉ"
LANG.HUD.AMMO = "MUNITIONS"
LANG.HUD.TIME = "TEMPS"
LANG.HUD.ROUND = "MANCHE"

LANG.HUD.ROTLOCKON = "Rotation du Prop: Bloquée"
LANG.HUD.ROTLOCKOFF = "Rotation du Prop: Libre"
LANG.HUD.FREEZECAM = "Vous avez été tué par %s"

LANG.HUD.WAIT = "En attente de joueurs..."
LANG.HUD.WIN = "Les %s ont gagnés !"
LANG.HUD.DRAW = "Egalité !"

LANG.HUD.BLINDTIME = "Les Hunters seront libérez dans %s"
LANG.HUD.BLINDEND = "Prêt ou non, nous arrivons !"

--  Kill text (X killed Y)
LANG.DEATHNOTICE = {}
LANG.DEATHNOTICE.KILLED = "a tué"

LANG.DEATHNOTICE.SUICIDE = {
	"s'est suicidé !",
	"est mort mystérieusement.",
	"est mort par la magie.",
	"s'est no-scop lui même.",
	"a simplement ragequit.",
	"a trop picolé.",
	"est mort... plus de chance la prochaine fois !",
	"s'est giflé.",
	"a trébuché sur un bâton.",
	"est mort par la foce.",
	"ragdolled.",
}

-- Common
LANG.MISC = {}

LANG.MISC.ACCEPT = "Accepter"
LANG.MISC.CLOSE = "Fermer"
LANG.MISC.TIMELEFT = "Temps Restant: %s"
LANG.MISC.NOTIMELEFT = "La partie va se terminer après cette manche"

-- Derma elements
LANG.DERMA = {}

-- Team selection screen (F2)
LANG.DERMA.TEAMSELECT = "Choisir une équipe"

-- F1 screeen
LANG.DERMA.RTV = "Voter pour changer (RTV)"
LANG.DERMA.PHMENU = "Menu Prop Hunt"
LANG.DERMA.CHANGETEAM = "Changer d'équipe"

-- Scoreboard
LANG.DERMA.PLAYER = "(%d joueur)"
LANG.DERMA.PLAYERS = "(%d joueurs)"
LANG.DERMA.NAME = "Pseudo"
LANG.DERMA.KILLS = "Kills"
LANG.DERMA.DEATHS = "Morts"
LANG.DERMA.PING = "Ping"

-- Chat messages
LANG.CHAT = {}

LANG.CHAT.NOTENOUGHPLYS = "Il n'y a pas assez de joueurs pour commencer une partie !"
LANG.CHAT.SWAP = "Les équipes ont été échangées !"

LANG.CHAT.JOINED = " a rejoint "
LANG.CHAT.JOINEDTHE = " a rejoint les "

LANG.CHAT.SWAPBALANCE = "%s a été remplacé par %s pour l'équilibre de l'équipe."
LANG.CHAT.SWAPBALANCEYOU = "Vous avez été échangé pour atteindre un équilibre parfait."

LANG.CHAT.RANDOM_SPECTATORS = {
	"pour regarder et se détendre.",
	"pour les voir traîner dans le coin.",
	"pour voir des choses.",
	"",
}

-- PHE Menu (F1 > PHE Menu)
LANG.PHEMENU = {}


LANG.PHEMENU.HELP = {}
LANG.PHEMENU.HELP.TAB = "Aide"

LANG.PHEMENU.MUTE = {}
LANG.PHEMENU.MUTE.TAB = "Mute"
LANG.PHEMENU.MUTE.SELECT = "Sélectionne un joueur que tu veux rendre muet."

LANG.PHEMENU.PLAYER = {}
LANG.PHEMENU.PLAYER.TAB = "Joueur"
LANG.PHEMENU.PLAYER.OPTIONS = "Options du joueur:"

LANG.PHEMENU.PLAYER.ph_cl_halos = "Activer l'effet Halo lors du choix d'un Prop"
LANG.PHEMENU.PLAYER.ph_cl_pltext = "Voir l'équipe du joueur au dessus de la tête (apparaît à travers les murs)"
LANG.PHEMENU.PLAYER.ph_cl_endround_sound = "Jouer la musique à la fin de la manche"
LANG.PHEMENU.PLAYER.ph_cl_autoclose_taunt = "Fermer automatiquement le menu des taunts lors d'un double clic"
LANG.PHEMENU.PLAYER.ph_cl_spec_hunter_line = "Afficher la ligne aim des hunters en spectateur"
LANG.PHEMENU.PLAYER.cl_enable_luckyballs_icon = "Activer les icones 'Lucky ball'"
LANG.PHEMENU.PLAYER.cl_enable_devilballs_icon = "Activer les icones 'Devil ball'"
LANG.PHEMENU.PLAYER.ph_cl_taunt_key = "Bouton pour jouer un Taunt aléatoire"

LANG.PHEMENU.PLAYER.ph_hud_use_new = "Utiliser le nouveau HUD"
LANG.PHEMENU.PLAYER.ph_show_tutor_control = "Afficher le tutoriel (Apparaît 2x à chaque apparition en Prop)"
LANG.PHEMENU.PLAYER.ph_show_custom_crosshair = "Activer le Crosshair customisé"
LANG.PHEMENU.PLAYER.ph_show_team_topbar = "Afficher le nombre total de joueurs de l'équipe en vie (4 joueurs minimum)"

LANG.PHEMENU.PLAYERMODEL = {}
LANG.PHEMENU.PLAYERMODEL.TAB = "Skins"
LANG.PHEMENU.PLAYERMODEL.OFF = "Les skins customisés sont désactivés sur le serveur !"
LANG.PHEMENU.PLAYERMODEL.SETFOV = "Définir le FOV des skins"


LANG.PHEMENU.ADMINS = {}
LANG.PHEMENU.ADMINS.TAB = "Administration"

LANG.PHEMENU.ADMINS.OPTIONS = "Options Serveur du mode de jeux (Visible uniquement pour les admins)"

LANG.PHEMENU.ADMINS.ph_language = "Langue du mode de jeu (nécessite un changement de carte)"
LANG.PHEMENU.ADMINS.ph_use_custom_plmodel = "Activer les modèles customisés pour les Hunters"
LANG.PHEMENU.ADMINS.ph_use_custom_plmodel_for_prop = "Activer les modèles customisés pour les Props - Doit être activé pour les Hunters."
LANG.PHEMENU.ADMINS.ph_customtaunts_delay = "Délai des taunts customisés (Secondes)"
LANG.PHEMENU.ADMINS.ph_normal_taunt_delay = "Délai des taunts normaux (Secondes)"
LANG.PHEMENU.ADMINS.ph_autotaunt_enabled = "Activer l'Autotaunt"
LANG.PHEMENU.ADMINS.ph_autotaunt_delay = "Délai de l'Autotaunt (Secondes)"
LANG.PHEMENU.ADMINS.ph_forcejoinbalancedteams = "Forcer les joueurs à équilibré les équipes"
LANG.PHEMENU.ADMINS.ph_autoteambalance = "Équilibre automatiquement les équipes au début d'une manche"
LANG.PHEMENU.ADMINS.ph_allow_prop_pickup = "Autoriser le ramassage de props (0 = non; 1 = oui; 2 = uniquement les hunters)"

LANG.PHEMENU.ADMINS.ph_notice_prop_rotation = "Afficher la notification de «rotation de props» sur chaque apparition au spawns"
LANG.PHEMENU.ADMINS.ph_prop_camera_collisions = "Activer la collision de la caméra Prop avec le mur"
LANG.PHEMENU.ADMINS.ph_freezecam = "Activer les fonctionnalités Freecam pour l'équipe props"
LANG.PHEMENU.ADMINS.ph_prop_collision = "Activer la collision des props avec les autres joueurs"
LANG.PHEMENU.ADMINS.ph_swap_teams_every_round = "Changer d'équipe à chaque tour - La désactivation de l'option ne changera pas les équipes"
LANG.PHEMENU.ADMINS.ph_hunter_fire_penalty = "Pénalité de santé du hunter"
LANG.PHEMENU.ADMINS.ph_hunter_kill_bonus = "Bonus de mise à mort du hunter"
LANG.PHEMENU.ADMINS.ph_hunter_smg_grenades = "Grenades SMG Hunter"
LANG.PHEMENU.ADMINS.ph_game_time = "Durée totale du jeu (minutes)"
LANG.PHEMENU.ADMINS.ph_hunter_blindlock_time = "Temps de verrouillage du hunter (secondes)"
LANG.PHEMENU.ADMINS.ph_round_time = "Durée de la manche (secondes)"
LANG.PHEMENU.ADMINS.ph_rounds_per_map = "Total de parties de jeu par map"
LANG.PHEMENU.ADMINS.ph_enable_lucky_balls = "Permettre aux Lucky Balls d'apparaître sur des props cassables (la chance est de 8%)"
LANG.PHEMENU.ADMINS.ph_enable_devil_balls = "Permettre aux Devil Balls d'apparaître lorsque le hunter meurt (la chance est de 70%)"
LANG.PHEMENU.ADMINS.ph_waitforplayers = "Attendre que des joueurs soit présent pour commencé une manche"
LANG.PHEMENU.ADMINS.ph_min_waitforplayers = "Joueurs Mininum à attendre avant le début de la manche (par défaut: 1)"

LANG.PHEMENU.ADMINS.TAUNTMODES = "Activer les taunts customisés."
LANG.PHEMENU.ADMINS.TAUNTMODE0 = "Mode [0/F3]: Taunt Aléatoire"
LANG.PHEMENU.ADMINS.TAUNTMODE1 = "Mode [1/C]: Taunt Customisé"
LANG.PHEMENU.ADMINS.TAUNTMODE2 = "Mode [2]: Taunt Aléatoire et Customisé"
LANG.PHEMENU.ADMINS.TAUNTSOPEN = "Ouvrir le menu des taunts"

LANG.PHEMENU.MAPVOTE = {}

LANG.PHEMENU.MAPVOTE.TAB = "MapVote"
LANG.PHEMENU.MAPVOTE.SETTINGS = "Paramètres MapVote"

LANG.PHEMENU.MAPVOTE.mv_allowcurmap = "Autoriser la map actuelle à être votée"
LANG.PHEMENU.MAPVOTE.mv_cooldown = "Activer le cooldown pour les votes"
LANG.PHEMENU.MAPVOTE.mv_use_ulx_votemaps = "Utiliser le Mapvote ULX pour la liste? Si non, les maps du dossier maps/*.bsp seront utilisées."
LANG.PHEMENU.MAPVOTE.mv_maplimit = "Nombre de maps à afficher lors du vote."
LANG.PHEMENU.MAPVOTE.mv_timelimit = "Temps en seconde pour le Mapvote."
LANG.PHEMENU.MAPVOTE.mv_mapbeforerevote = "Changement de map requis pour faire réapparaitre cette map"
LANG.PHEMENU.MAPVOTE.mv_rtvcount = "Nombre de joueurs nécessaires pour le RTV (Rock the Vote)"

LANG.PHEMENU.MAPVOTE.EXPLANATION1 = "Pour définir les maps à utiliser, utilise (par exemple) [ mv_mapprefix 'ph_,cs_,de_' ] dans la console."
LANG.PHEMENU.MAPVOTE.EXPLANATION2 = "Si vous n'arrivez pas à utiliser le Mapvote, il FAUT installer ULX Admin Mod!"
LANG.PHEMENU.MAPVOTE.EXPLANATION3 = "Action MapVote (Pour annuler, utilise !unmap_vote dans le chat ou 'unmap_vote' dans la console)"

LANG.PHEMENU.MAPVOTE.START = "Démarrer un MapVote"
LANG.PHEMENU.MAPVOTE.STOP = "Arrêter un MapVote"
--                   YOU VIOLATED THE LAW!

LANG.PHEMENU.ABOUT = {}

LANG.PHEMENU.ABOUT.CURRENTVER = "Version Actuelle: "
LANG.PHEMENU.ABOUT.CURRENTREV = "Revision Actuelle: "
LANG.PHEMENU.ABOUT.ENJOYING = "Si vous aimez le jeu, vous pouvez faire un don !"
LANG.PHEMENU.ABOUT.LINKS = "Liens et crédits"
LANG.PHEMENU.ABOUT.THANKS = "Remerciements spéciaux: "
LANG.PHEMENU.ABOUT.TAB = "A propos de PHE"
LANG.PHEMENU.ABOUT.DONATE = "Faire une donation au projet PH:E"
LANG.PHEMENU.ABOUT.HOME = "Page Officielle PH:E"
LANG.PHEMENU.ABOUT.GITHUB = "GitHub"

-- Saving
PHE.LANGUAGES[LANG.Code] = LANG
