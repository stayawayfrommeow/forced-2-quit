extends Node2D

#тут инициация переменных сцены
@onready var interact_popup = $Interact_popup
@onready var gj_popup = $gj_popup
@onready var animations = $Interact_popup/AnimationPlayer
@onready var player_near = false
@onready var obj_sprt = $AnimatedSprite2D
@onready var killtimer = $kill_timer

@export var stress = 15
@export var money = 100

var DURATION = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	#обект видно
	obj_sprt.visible = true
	
	#по умолчанию попапы скрыты
	interact_popup.visible = false
	gj_popup.visible = false
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event: InputEvent): 
	if (player_near and event.is_action_pressed("interact")):
		gj_popup.visible = true
		obj_sprt.visible = false
		interact_popup.visible = false
		killtimer.start(1)
		Global.stress = stress
		
	pass

func _on_area_2d_body_entered(body):
	#если плеер подошёл, то показываем попап
	player_near = true
	interact_popup.visible = true
	animations.play("popup_enter")
	
	
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	#если плеер отошёл, то скрываем попап
	player_near = false
	animations.play("popup_escape")
	
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "popup_escape":
			interact_popup.visible = false
			
	pass # Replace with function body.


func _on_kill_timer_timeout():
	queue_free()
	pass # Replace with function body.
