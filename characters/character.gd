@tool               
class_name Character
extends Node2D

@onready var sprite: Sprite2D = $Sprite
@onready var label = $Label
@export var target_group := "player"

const phrases = {
	"ant": [
		
	],
	"shark": [
		
	],
	"bunny": [
		"Помни, главное — выглядеть занятым, а не быть им…",
		"Я бы помог, но у меня лапки…",
		"Дай угадаю: Шарк опять сыплет угрозами?",
		"Придет день и эта лисичка заметит какой пушистый парень рядом с ней",
		"Тебе тоже платят морковками?",
		"Держись, друг, скоро обед",
		"Можно я буду твоей моральной поддержкой издалека?",
		"Я не отлыниваю, возле этого кулера просто вид лучше…",
		"Наш отдел как морковка: сверху зелень, а внутри все хрустит от напряжения",
		"Я не бездельничаю — я медитирую на тему эффективности…",
		"Если Шарк начнет охоту, я отвлеку его морковкой, а ты улетишь",
		"Друг, тебе надо передохнуть. Может, прогуляемся?",
		"Гоняют по всему городу с посылками, а я ведь не лошадь!",
		"Шепни, если увидишь босса, он сегодня в сером настроении",
		"Может, просто сделаем вид, что всё сломалось?"
	],
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

func _on_area_entered(body: Node2D) -> void:
	if body.is_in_group(target_group):
		print("Персонаж вошёл!", self.name)
		if (phrases[self.name]):
			label.text = str(phrases[self.name][0])

func _update_sprite_scale() -> void:
	if not sprite or not sprite.texture: return

	var tex_size := Vector2(sprite.texture.get_size())
	sprite.scale = Vector2.ONE if tex_size == Vector2.ZERO else sprite_size / tex_size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
