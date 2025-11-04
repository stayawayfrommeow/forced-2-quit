@tool               
class_name Character
extends Node2D

@onready var sprite: Sprite2D = $Sprite
@onready var label_left = $BubbleLeft/Label
@onready var label_right = $BubbleRight/Label
@onready var bubble_left = $BubbleLeft
@onready var bubble_right = $BubbleRight
@export var target_group := "player"

enum ArrowSide { LEFT, RIGHT }
var side: ArrowSide = ArrowSide.LEFT

@onready var timerNewDialog = $"TimerNewDialog"
@onready var timerCloseDialog = $"TimerCloseDialog"

const TIMER_NEW_SECONDS = 5
const TIMER_CLOSE_SECONDS = 10

var can_view_dialog = true

var phrases = {
	"ant": {
		"phrases": [
			[  # 1
				"Шарк дал мне работу. Теперь мой долг — медленно умирать за неё. Честная сделка.",
				"Я не избегаю общения. Я экономлю энергию.",
				"Моя душа уже ушла с работы, а тело нет, потому что у него есть кредит."
			],
			[  # 2
				"Иногда я ловлю себя на том, что завидую мухе на стене. У нее нет KPI.",
				"Я не пью кофе. Я заправляюсь жидкостью для выживания.",
				"Если подумать, моя продуктивность — это просто результат серии мелких паник."
			],
			[  # 3
				"Я не герой. Я статист в чьём-то корпоративном сне.",
				"Моя переписка в чате состоит из “ясно” и “сделаю”. Я — душа общения.",
				"Муравьи общаются усиками. Я бы тоже предпочел это болтовне у кулера."
			],
			[  # 4
				"Иногда мне кажется, что я просто муравей в гигантском муравейнике.",
				"Я уже не помню, какое хобби у меня было. Кажется, это был сон.",
				"Я не ищу смысла. Я ищу очередную чашку кофе."
			],
			[  # 5
				"Срочная задача, которую нужно было сделать “еще вчера”, будет ждать согласования неделю.",
				"“Гибкий график” означает, что твой график гибко подстраивается под нужды компании.",
				"Каждый год я получаю бонус в виде фирменной кружки. Спасибо, я в восторге."
			]
		],
		"side": ArrowSide.RIGHT
	},
	"shark": {
		"phrases": [
			[  # 1
				"Шарк дал мне работу. Теперь мой долг — медленно умирать за неё. Честная сделка.",
				"Я не избегаю общения. Я экономлю энергию.",
				"Моя душа уже ушла с работы, а тело нет, потому что у него есть кредит."
			],
			[  # 2
				"Иногда я ловлю себя на том, что завидую мухе на стене. У нее нет KPI.",
				"Я не пью кофе. Я заправляюсь жидкостью для выживания.",
				"Если подумать, моя продуктивность — это просто результат серии мелких паник."
			],
			[  # 3
				"Я не герой. Я статист в чьём-то корпоративном сне.",
				"Моя переписка в чате состоит из “ясно” и “сделаю”. Я — душа общения.",
				"Муравьи общаются усиками. Я бы тоже предпочел это болтовне у кулера."
			],
			[  # 4
				"Иногда мне кажется, что я просто муравей в гигантском муравейнике.",
				"Я уже не помню, какое хобби у меня было. Кажется, это был сон.",
				"Я не ищу смысла. Я ищу очередную чашку кофе."
			],
			[  # 5
				"Срочная задача, которую нужно было сделать “еще вчера”, будет ждать согласования неделю.",
				"“Гибкий график” означает, что твой график гибко подстраивается под нужды компании.",
				"Каждый год я получаю бонус в виде фирменной кружки. Спасибо, я в восторге."
			]
		],
		"side": ArrowSide.LEFT
	},
	"bunny": {
		"phrases": [
			[  # 1
				"Помни, главное — выглядеть занятым, а не быть им…",
				"Я бы помог, но у меня лапки…",
				"Дай угадаю: Шарк опять сыплет угрозами?"
			],
			[  # 2
				"Придет день и эта лисичка заметит какой пушистый парень рядом с ней",
				"Тебе тоже платят морковками?",
				"Держись, друг, скоро обед"
			],
			[  # 3
				"Можно я буду твоей моральной поддержкой издалека?",
				"Я не отлыниваю, возле этого кулера просто вид лучше…",
				"Наш отдел как морровка: сверху зелень, а внутри все хрустит от напряжения"
			],
			[  # 4
				"Я не бездельничаю — я медитирую на тему эффективности…",
				"Если Шарк начнет охоту, я отвлеку его морковкой, а ты улетишь",
				"Друг, тебе надо передохнуть. Может, прогуляемся?"
			],
			[  # 5
				"Гоняют по всему городу с посылками, а я ведь не лошадь!",
				"Шепни, если увидишь босса, он сегодня в сером настроении",
				"Может, просто сделаем вид, что всё сломалось?"
			]
		],
		"side": ArrowSide.LEFT
	},
	"fox": {
		"phrases":  [
			[  # 1
				"Пожалуйста, направляйте свои предложения в общий чат. Я его не читаю",
				"Может заберешь своего друга отсюда? Он тратит слишком много воды.",
				"Мой макияж держится дольше, чем мотивация некоторых сотрудников"
			],
			[  # 2
				"Я держу всю эту офисную цирк-шапито на своих плечах. И прическу при этом не порчу",
				"Шарк единственный, чьи угрозы звучат для меня как комплименты",
				"Резкость босса — это просто защитный механизм. На самом деле он плюшевый..."
			],
			[  # 3
				"Я не просто сижу за стойкой. Я формирую первое впечатление о компании.",
				"Твой черный уже не в моде, ты знаешь?",
				"Я лиса. Я кушаю зайцев. Это не метафора."
			],
			[  # 4
				"Мой статус в соцсетях важнее, чем ваш дедлайн",
				"Этот офис — серая масса. А я в нем — единственный акцент роскоши",
				"Вы стоите слишком близко. Вы нарушаете мою личную ауру"
			],
			[  # 5
				"Ваши амбиции такие же серые, как и наш офис",
				"Да, я знаю все секреты этого офиса. Нет, я не расскажу.",
				"Настоящая власть не в кабинете Шарка, а на ресепшене"
			]
		],
		"side": ArrowSide.LEFT
	},
	"barsik": {
		"phrases": [
			[  # 1
				"Ваше мнение было бы ценным, если бы я собирался провалить сделку.",
				"Не загораживай мне вид. Ты мешаешь обзору моего будущего кабинета.",
				"Шарк правит, потому что не встречал достойного хищника. Пока."
			],
			[  # 2
				"Пока вы пьете кофе, я заключаю сделки, которые изменят баланс сил в этом офисе.",
				"Они называют это нарциссизмом. Я называю это адекватной самооценкой.",
				"Если бы гениальность имела цену, я был бы дороже, чем активы этой компании."
			],
			[  # 3
				"Я не работаю с цифрами. Я чувствую потоки капитала. Это дар.",
				"Мои инстинкты острее, чем у любого аналитика с его графиками.",
				"Когда я вхожу в трейдинговый зал, курс начинает колебаться в такт моему пульсу."
			],
			[  # 4
				"Каждый промах Шарка — это шаг к моему будущему креслу.",
				"Его методы устарели, как вчерашние котировки. Скромность — не мой порок.",
				"Не пытайтесь меня понять. Профиль хищника недоступен для восприятия травоядных."
			],
			[  # 5
				"Не переживайте. Ваша некомпетентность — лишь фон для моего триумфа.",
				"Пока вы составляете планы, я уже их реализую.",
				"Помните: даже Шарк когда-то был мелкой рыбешкой."
			]
		],
		"side": ArrowSide.LEFT
	}
}

## Размер (масштаб)
@export var sprite_size: Vector2 = Vector2(64,64):
	set(s):
		sprite_size = s
		if sprite: sprite.scale = sprite_size / sprite.texture.get_size()

## Смещение пиксельного центра
@export var sprite_offset: Vector2:
	set(o):
		sprite_offset = o
		if sprite:
			sprite.centered = true
			sprite.offset = sprite_offset

## Картинка
@export var sprite_texture: Texture2D:
	set(t):
		sprite_texture = t
		$Sprite.texture = t

# Called when the node enters the scene tree for the first time.
func _ready():
	if sprite.texture:
		_update_sprite_scale()
	else:
		await get_tree().process_frame
		_update_sprite_scale()
	$Area2D.body_entered.connect(_on_area_entered)
	$Area2D.body_exited.connect(_on_area_exited)

func _on_area_entered(body: Node2D) -> void:
	if body.is_in_group(target_group):
		if (phrases[self.name]):
			if (phrases[self.name].phrases[Global.day - 1].size() > 0 and can_view_dialog):
							
				timerCloseDialog.start(TIMER_CLOSE_SECONDS)	
				if (phrases[self.name].side == ArrowSide.LEFT):
					bubble_right.visible = true
					label_right.text = str(phrases[self.name].phrases[Global.day - 1][0])
				else:
					bubble_left.visible = true
					label_left.text = str(phrases[self.name].phrases[Global.day - 1][0])


func _on_area_exited(body: Node2D) -> void:
	if (can_view_dialog):
		bubble_left.visible = false
		bubble_right.visible = false
		
		if (phrases[self.name].phrases[Global.day - 1].size() > 0):
			phrases[self.name].phrases[Global.day - 1].remove_at(0)
		
		can_view_dialog = false
		timerNewDialog.start(TIMER_NEW_SECONDS)
	timerCloseDialog.stop()	
	pass

func _update_sprite_scale() -> void:
	if not sprite or not sprite.texture: return

	var tex_size := Vector2(sprite.texture.get_size())
	sprite.scale = Vector2.ONE if tex_size == Vector2.ZERO else sprite_size / tex_size
	sprite.offset = sprite_offset


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_new_dialog_timeout() -> void:
	bubble_left.visible = false
	bubble_right.visible = false
	can_view_dialog = true
	pass # Replace with function body.


func _on_timer_close_dialog_timeout() -> void:
	bubble_left.visible = false
	bubble_right.visible = false
	
	pass # Replace with function body.
