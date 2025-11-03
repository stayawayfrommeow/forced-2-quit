extends Node2D

enum OBJ_NAMES { ДОСКА }

#тут инициация переменных сцены
@onready var interact_popup = $Interact_popup
@onready var gj_popup = $gj_popup
@onready var animations = $Interact_popup/AnimationPlayer
@onready var player_near = false
@onready var obj_sprt = $AnimatedSprite2D
@onready var killtimer = $kill_timer
@onready var activate_timer = $activate_timer
@onready var comic = $Comic


@export var stress = 15
@export var money = 100
@export var panel_sprts: Array[CompressedTexture2D]
@export var obj_name: OBJ_NAMES

var DURATION = 3

@export var activated = false

var event_penalty = 0
var event_bank = 0
var event_stress = 0
var obj_link

# Called when the node enters the scene tree for the first time.
func _ready():
	#по умолчанию попапы скрыты
	interact_popup.visible = false
	gj_popup.visible = false
	#комикс не видно

	match obj_name:
		OBJ_NAMES.ДОСКА:
			obj_link = preload("res://level/items/доска/доска.tscn").instantiate()
			add_child(obj_link)
			
	
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
			%Player.do_backflip()
		deactivate()

	pass
	
		
func activate(lifetime, penalty, stress, bank, name):
	interact_popup.text = name
	activate_timer.start(lifetime)
	event_penalty = penalty
	event_stress = stress
	event_bank = bank
	obj_link.make_it_glow()

	activated = true
	#obj_sprt.modulate = Color.RED   
	_update_popup()

func deactivate(): 
	activated = false
	#obj_sprt.modulate = Color.GREEN
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


func _on_kill_timer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_activate_timer_timeout() -> void:
	Global.stress = event_penalty
	deactivate()

func _on_comic_comic_ended():
	deactivate()
	#добавить комик ресет
	#comic.reset = false
	pass
