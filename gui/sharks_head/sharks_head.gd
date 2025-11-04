extends Control
class_name SharksHead

@onready var timer = $Timer
@onready var anim_player = $AnimationPlayer
@onready var shake_player = $ShakePlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_player.play("shake")
	anim_player.connect("animation_finished", _on_animation_finished)
	Global.upd_day.connect(upd_day)
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setup():
	timer.start(5)
	anim_player.play("slide_in")
	shake_player.play("shake")

func _on_timer_timeout() -> void:
	anim_player.play("slide_out")
	pass # Replace with function body.

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "slide_out":
		queue_free() 


func upd_day(val):
	queue_free() 
