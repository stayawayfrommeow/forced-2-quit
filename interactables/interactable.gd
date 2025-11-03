extends Node2D

#тут инициация переменных сцены
@onready var interact_popup = $Interact_popup
@onready var gj_popup = $gj_popup
@onready var animations = $Interact_popup/AnimationPlayer
@onready var player_near = false
@onready var obj_sprt = $AnimatedSprite2D
@onready var activate_timer = $activate_timer


@export var stress = 15
@export var money = 100
@export var panel_sprts: Array[CompressedTexture2D]
@export var obj_name: String

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
	#обект не видно
	obj_sprt.visible = false
	#по умолчанию попапы скрыты
	interact_popup.visible = false
	gj_popup.visible = false
	#комикс не видно
	
	#obj_sprt.modulate = Color.GREEN  

	if obj_name == 'board':
		obj_sprt.play("board")
		
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
				print("Анимации")
				%Player.do_backflip()

			#comic.emit_signal('comic_start')
		deactivate()

	pass

func activate(event):
	interact_popup.text = event.instanse.get("name",   "")
	event_images = event.instanse.get("images", [])
	event_sound = event.instanse.get("sound",   "")
	event_id = event.instanse.get("id",   "")
	activate_timer.start(event.get("lifetime",  0))
	event_penalty = event.get("penalty",   0)
	event_stress = event.get("stress",   0)
	event_bank = event.get("bank",   0)

	obj_sprt.visible = true

	activated = true
	#obj_sprt.modulate = Color.RED   
	_update_popup()

func deactivate(): 
	activated = false
	#obj_sprt.modulate = Color.GREEN
	obj_sprt.visible = false
	interact_popup.visible = false
	activate_timer.stop()
	
func _on_area_2d_body_entered(body):
	player_near = true
	_update_popup()
	pass # Replace with function body.

func _update_popup():
	interact_popup.visible = player_near and activated
	if player_near and activated:
		animations.play("popup_enter")
	else:
		animations.play("popup_escape")


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
	print("tut!")
	deactivate()

func _on_comic_comic_ended():
	deactivate()
	#добавить комик ресет
	#comic.reset = false
	pass
