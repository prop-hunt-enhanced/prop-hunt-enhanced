local LANG = {}

-- Language code and name
LANG.Code = "ru"
LANG.Name = "Русский"
LANG.NameEnglish = "russian"

LANG.Help = [[	Улучшенный классический Prop Hunt режим.
Чтобы увидеть Помощь, Кликните по 'Prop Hunt Menu'!

	Версия: %u  Ревизия: %s
		Что нового:
		- Поддержка многих языков (WIP)
		- Больше настроек в меню PHE
		- Больше оптимизации
		- И больше!
	]]

-- HUD elements
LANG.HUD = {}

LANG.HUD.HEALTH = "ЗДОРОВЬЕ"
LANG.HUD.AMMO = "ПАТРОНЫ"
LANG.HUD.TIME = "ВРЕМЯ"
LANG.HUD.ROUND = "РАУНД"

LANG.HUD.ROTLOCKON = "Вращение Пропа: Заблокировано"
LANG.HUD.ROTLOCKOFF = "Вращение Пропа: Свободно"
LANG.HUD.FREEZECAM = "Вы были убиты игроком %s"

LANG.HUD.WAIT = "Ожидание игроков..."
LANG.HUD.WIN = "%s выиграли!"
LANG.HUD.DRAW = "Ничья, все проиграли!"

LANG.HUD.BLINDTIME = "Охотники будут освобождены %s"
LANG.HUD.BLINDEND = "Готовы или нет, мы идем!"

--  Kill text (X killed Y)
LANG.DEATHNOTICE = {}
LANG.DEATHNOTICE.KILLED = "убил"

LANG.DEATHNOTICE.SUICIDE = {
	"суицид!",
	"умер мистически.",
	"умер от магии.",
	"ноу-скоупнул себя.",
	"просто вышел в ярости.",
	"пьян.",
	"умер... удачи в следующий раз!",
	"шлепнул себя.",
	"споткнулся об палку.",
	"умер от силы.",
	"стал рэгдоллом.",
}

-- Common
LANG.MISC = {}

LANG.MISC.ACCEPT = "Принять"
LANG.MISC.CLOSE = "Закрыть"
LANG.MISC.TIMELEFT = "Времени осталось: %s"
LANG.MISC.NOTIMELEFT = "Игра закончится после этого раунда"

-- Derma elements
LANG.DERMA = {}

-- Team selection screen (F2)
LANG.DERMA.TEAMSELECT = "Выберите команду"

-- F1 screeen
LANG.DERMA.RTV = "Голосование за смену карты (RTV)"
LANG.DERMA.PHMENU = "Меню Prop Hunt"
LANG.DERMA.CHANGETEAM = "Сменить команду"

-- Scoreboard
LANG.DERMA.PLAYER = "(%d игрок)"
LANG.DERMA.PLAYERS = "(%d игроков)"
LANG.DERMA.NAME = "Имя"
LANG.DERMA.KILLS = "Убийств"
LANG.DERMA.DEATHS = "Смертей"
LANG.DERMA.PING = "Пинг"

-- Chat messages
LANG.CHAT = {}

LANG.CHAT.NOTENOUGHPLYS = "Не хватает игроков для начала игры!"
LANG.CHAT.SWAP = "Команды поменялись местами!"

LANG.CHAT.JOINED = " присоединился к "
LANG.CHAT.JOINEDTHE = " присоединился к "

LANG.CHAT.SWAPBALANCE = "%s присоединился к %s для баланса команд."
LANG.CHAT.SWAPBALANCEYOU = "Вам поменяли команду для идеального баланса." -- Smile... for even in death, you have become children of Thanos

LANG.CHAT.RANDOM_SPECTATORS = {
	"ушел наблюдать и отдыхать.",
	"ушел, чтобы увидеть как вы бегаете.",
	"ушел, чтобы увидеть вещи.",
	"",
}

-- PHE Menu (F1 > PHE Menu)
LANG.PHEMENU = {}


LANG.PHEMENU.HELP = {}
LANG.PHEMENU.HELP.TAB = "Помощь"

LANG.PHEMENU.MUTE = {}
LANG.PHEMENU.MUTE.TAB = "Заглушить"
LANG.PHEMENU.MUTE.SELECT = "Выберите игрока, которого хотите заглушить."

LANG.PHEMENU.PLAYER = {}
LANG.PHEMENU.PLAYER.TAB = "Игрок"
LANG.PHEMENU.PLAYER.OPTIONS = "Настройки игрока:"

LANG.PHEMENU.PLAYER.ph_cl_halos = "Переключить эффект Halo при выборе пропа"
LANG.PHEMENU.PLAYER.ph_cl_pltext = "Показывать имена командных игроков над их головами (и через стены тоже)"
LANG.PHEMENU.PLAYER.ph_cl_endround_sound = "Проигрывать звук конца раунда"
LANG.PHEMENU.PLAYER.ph_cl_autoclose_taunt = "Опция автоматического закрытия окна Насмешки при двойном щелчке по нему"
LANG.PHEMENU.PLAYER.ph_cl_spec_hunter_line = "Показывать линию куда смотрит Охотник, чтобы мы могли видеть их цель в режиме наблюдателя."
LANG.PHEMENU.PLAYER.cl_enable_luckyballs_icon = "Включить значок 'Счастливый Шар' отображаемый после их появления"
LANG.PHEMENU.PLAYER.cl_enable_devilballs_icon = "Включить значок 'Шар Дьявола' отображаемый после их появления"
LANG.PHEMENU.PLAYER.ph_cl_taunt_key = "Кнопка для воспроизведения случайной насмешки"

LANG.PHEMENU.PLAYER.ph_hud_use_new = "Использовать новый интерфейс PH: Enhanced"
LANG.PHEMENU.PLAYER.ph_show_tutor_control = "Показать всплывающее окно туториала (Показано только 2x при каждом появлении)"
LANG.PHEMENU.PLAYER.ph_show_custom_crosshair = "Включить сторонний прицел"
LANG.PHEMENU.PLAYER.ph_show_team_topbar = "Показывать общее количество живых игроков команды в левом верхнем углу (По крайней мере 4 игрока будут показаны)"

LANG.PHEMENU.PLAYERMODEL = {}
LANG.PHEMENU.PLAYERMODEL.TAB = "Игровые модели"
LANG.PHEMENU.PLAYERMODEL.OFF = "Извините, сторонние Игровые Модели отключены на этом сервере!"
LANG.PHEMENU.PLAYERMODEL.SETFOV = "Поле зрения модели"


LANG.PHEMENU.ADMINS = {}
LANG.PHEMENU.ADMINS.TAB = "Администратирование"

LANG.PHEMENU.ADMINS.OPTIONS = "Настройки на стороне сервера (Только видны для Админа/Владельца)"

LANG.PHEMENU.ADMINS.ph_language = "Язык режима (нужен перезапуск карты)"
LANG.PHEMENU.ADMINS.ph_use_custom_plmodel = "Включить сторонние модели для Охотников"
LANG.PHEMENU.ADMINS.ph_use_custom_plmodel_for_prop = "Включить сторонние модели для пропов - Убедитесь включить Охотникам тоже."
LANG.PHEMENU.ADMINS.ph_customtaunts_delay = "Задержка сторонней насмешки (Секунд)"
LANG.PHEMENU.ADMINS.ph_normal_taunt_delay = "Задержка обычной насмешки (Секунд)"
LANG.PHEMENU.ADMINS.ph_autotaunt_enabled = "Включить авто. насмешку"
LANG.PHEMENU.ADMINS.ph_autotaunt_delay = "Задержка авто. насмешки (Секунд)"
LANG.PHEMENU.ADMINS.ph_forcejoinbalancedteams = "Баланс игроков при заходе в игру"
LANG.PHEMENU.ADMINS.ph_autoteambalance = "Автоматический баланс команд в начале раунда"
LANG.PHEMENU.ADMINS.ph_allow_prop_pickup = "Разрешить использовать маленькие пропы (0 = Нет; 1 = Да; 2 = Только Охотникам)"

LANG.PHEMENU.ADMINS.ph_notice_prop_rotation = "Показывать уведомление 'Вращение пропа' на экране при каждом появлении пропа"
LANG.PHEMENU.ADMINS.ph_prop_camera_collisions = "Включить камеру пропа при столкновении со стеной"
LANG.PHEMENU.ADMINS.ph_freezecam = "Включить функцию Свободного полета для командных пропов"
LANG.PHEMENU.ADMINS.ph_prop_collision = "Включить столкновение друг с другом пропами игроками"
LANG.PHEMENU.ADMINS.ph_swap_teams_every_round = "Менять команды каждый раунд - Отключение означает, что команда не будет меняться навсегда"
LANG.PHEMENU.ADMINS.ph_hunter_fire_penalty = "Штраф здоровья Охотнику"
LANG.PHEMENU.ADMINS.ph_hunter_kill_bonus = "Бонус Охотнику за убийство"
LANG.PHEMENU.ADMINS.ph_hunter_smg_grenades = "SMG Гранаты Охотнику"
LANG.PHEMENU.ADMINS.ph_game_time = "Общее время игры (Минут)"
LANG.PHEMENU.ADMINS.ph_hunter_blindlock_time = "Время ослепления или освобождения Охотников (Секунд)"
LANG.PHEMENU.ADMINS.ph_round_time = "Общее время раунда (Секунд)"
LANG.PHEMENU.ADMINS.ph_rounds_per_map = "Всего раундов на карту"
LANG.PHEMENU.ADMINS.ph_enable_lucky_balls = "Разрешить создание Счастливых Шаров на ломающихся пропах (Шанс 8%)"
LANG.PHEMENU.ADMINS.ph_enable_devil_balls = "Разрешить создание Шаров Дьявола когда Охотник умирает (Шанс 70%)"
LANG.PHEMENU.ADMINS.ph_waitforplayers = "Подождите, пока игроки начнут играть"
LANG.PHEMENU.ADMINS.ph_min_waitforplayers = "Минимум игроков, чтобы ждать до начала игры (по умолчанию: 1)"

LANG.PHEMENU.ADMINS.TAUNTMODES = "Включить сторонние насмешки."
LANG.PHEMENU.ADMINS.TAUNTMODE0 = "Режим [0/F3]: Случайная насмешка"
LANG.PHEMENU.ADMINS.TAUNTMODE1 = "Режим [1/C]: Сторонняя насмешка"
LANG.PHEMENU.ADMINS.TAUNTMODE2 = "Режим [2]: Оба Режима"
LANG.PHEMENU.ADMINS.TAUNTSOPEN = "Открыть окно насмешек"

LANG.PHEMENU.MAPVOTE = {}

LANG.PHEMENU.MAPVOTE.TAB = "Голосование за карту"
LANG.PHEMENU.MAPVOTE.SETTINGS = "Настройки голосования"

LANG.PHEMENU.MAPVOTE.mv_allowcurmap = "Разрешить голосовать за текущую карту"
LANG.PHEMENU.MAPVOTE.mv_cooldown = "Включить задержку между сменой карт"
LANG.PHEMENU.MAPVOTE.mv_use_ulx_votemaps = "Использовать голосование карты из ULX? Если нет, по умолчанию maps/*.bsp будут использованы."
LANG.PHEMENU.MAPVOTE.mv_maplimit = "Количество карт, которые будут показаны в голосовании."
LANG.PHEMENU.MAPVOTE.mv_timelimit = "Время в секундах на голосование."
LANG.PHEMENU.MAPVOTE.mv_mapbeforerevote = "Изменения карты, необходимые для повторного появления карты"
LANG.PHEMENU.MAPVOTE.mv_rtvcount = "Сколько игроков нужно для RTV (Кинуть Голос)"

LANG.PHEMENU.MAPVOTE.EXPLANATION1 = "Чтобы установить, какая карта должна быть в списке, используйте (для примера) [ mv_mapprefix 'ph_,cs_,de_' ] в консоль."
LANG.PHEMENU.MAPVOTE.EXPLANATION2 = "Если вы не можете сделать Голосование, вам нужно установить ULX Admin Mod!"
LANG.PHEMENU.MAPVOTE.EXPLANATION3 = "Действие Голосования (Чтобы отменить, просто введите !unmap_vote в чат или введите 'unmap_vote' в консоль)"

LANG.PHEMENU.MAPVOTE.START = "Начать голосование"
LANG.PHEMENU.MAPVOTE.STOP = "Остановить голосование"
--                   YOU VIOLATED THE LAW!

LANG.PHEMENU.ABOUT = {}

LANG.PHEMENU.ABOUT.CURRENTVER = "Текущая версия: "
LANG.PHEMENU.ABOUT.CURRENTREV = "Текущая ревизия: "
LANG.PHEMENU.ABOUT.ENJOYING = "Если вам нравится играть, то задонатьте!"
LANG.PHEMENU.ABOUT.LINKS = "Ссылки и авторство"
LANG.PHEMENU.ABOUT.THANKS = "Отдельное спасибо: "
LANG.PHEMENU.ABOUT.TAB = "Об PHE"
LANG.PHEMENU.ABOUT.DONATE = "Задонатить проекту PH:E"
LANG.PHEMENU.ABOUT.HOME = "Официальная станичка PH:E"
LANG.PHEMENU.ABOUT.GITHUB = "GitHub Repository"

-- Saving
PHE.LANGUAGES[LANG.Code] = LANG