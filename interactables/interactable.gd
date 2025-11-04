@tool               
class_name Interactable
extends Node2D

#@export_group("glow")
@export var glow_sprite: Sprite2D
@export var animation_name := "pulsing_rapid"

@export var trigger_width: int:
	set(t):
		trigger_width = t
		var q = $Area2D/CollisionShape2D.shape
		if q is RectangleShape2D:
			q.size = Vector2(trigger_width, q.size.y) 

@export var trigger_offset: int:
	set(t):
		trigger_offset = t
		$Area2D/CollisionShape2D.position.x = t
		


## Картинка
@export var sprite_texture: Texture2D:
	set(t):
		sprite_texture = t
		$Sprite.texture = t

@export var glow_texture: Texture2D:
	set(t):
		glow_texture = t
		$Glow.texture = t
		
@export var glow_scale: Vector2:
	set(t):
		glow_scale = t
		$Glow.scale = t
		
@export var glow_offset: Vector2:
	set(t):
		glow_offset = t
		$Glow.offset = t

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
			
@onready var sprite: Sprite2D = $Sprite

#тут инициация переменных сцены
@onready var interact_popup = $Interact_popup
@onready var player_near = false
@onready var activate_timer = $activate_timer
@onready var glow_image = $Glow
@onready var animGlow = $animGlow

@export var stress = 15
@export var money = 100
@export var panel_sprts: Array[CompressedTexture2D]


var DURATION = 3

@export var activated = false

var event_penalty = 0
var event_bank = 0
var event_stress = 0
var event_images = []
var event_sound = ""
var event_id = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	if sprite.texture:
		_update_sprite_scale()
	else:
		await get_tree().process_frame
		_update_sprite_scale()
	animGlow.play("pulsing_rapid")
	_update_popup_position()
	#по умолчанию попапы скрыты
	interact_popup.visible = false


	pass # Replace with function body.

func _update_sprite_scale() -> void:
	if not sprite or not sprite.texture: return
	var tex_size := Vector2(sprite.texture.get_size())
	sprite.scale = Vector2.ONE if tex_size == Vector2.ZERO else sprite_size / tex_size
	# сдвигаем текстуру внутри спрайта (pivot остаётся в центре)

@export var time_left := 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_left = activate_timer.time_left
	pass
	
func start_glow() -> void:
	return
	animGlow.play(animation_name)

func stop_glow() -> void:
	return
	animGlow.stop(animation_name)

@export var popup_offset: Vector2 = Vector2(0, -50):  # смещение вверх на 50 px
	set(v):
		popup_offset = v
		_update_popup_position()

func _update_popup_position() -> void:
	if not interact_popup:
		return
	interact_popup.position = popup_offset

#что происходит на интеракт
func _input(event: InputEvent): 

	if (activated and player_near and event.is_action_pressed("interact")):
		interact_popup.visible = false
		if (stress):
			Global.stress = event_stress
			Global.bank = event_bank
			
			if (event_images and event_sound and !Global.has_readed_comics(event_id)):
				Spawner.show_slider(event_images, event_sound)
				Global.add_readed_comics(event_id)
			else:
				%Player.do_work(2)

			#comic.emit_signal('comic_start')
		deactivate()

	pass

func activate(event):
	interact_popup.text = event.instanse.get("name",   "")
	event_images = event.instanse.get("images", [])
	event_sound = event.instanse.get("sound",   "")
	event_id = event.instanse.get("id",   "")
	activate_timer.start(event.get("lifetime",  0) / 10)
	event_penalty = event.get("penalty",   0)
	event_stress = event.get("stress",   0)
	event_bank = event.get("bank",   0)

	glow_image.visible = true
	activated = true
	
	Global.add_events(self)
	#obj_sprt.modulate = Color.RED   
	_update_popup()

func deactivate(): 
	activated = false
	#obj_sprt.modulate = Color.GREEN
	interact_popup.visible = false
	activate_timer.stop()
	glow_image.visible = false
	stop_glow()
	Global.delete_events(self)
	
func _on_area_2d_body_entered(body):
	player_near = true
	_update_popup()
	pass # Replace with function body.

func _update_popup():
	interact_popup.visible = player_near and activated
	_update_popup_position()  # обновляем позицию


func _on_area_2d_body_exited(body):
	player_near = false
	_update_popup()
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "popup_escape":
			interact_popup.visible = false
			
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	Global.stress = event_penalty
	SharksSpawner.create_head()
	deactivate()

func _on_comic_comic_ended():
	deactivate()
	#добавить комик ресет
	#comic.reset = false
	pass
