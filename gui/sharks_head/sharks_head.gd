extends Control
class_name SharksHead

@onready var timer = $Timer
@onready var anim_player = $AnimationPlayer
@onready var shake_player = $ShakePlayer

var _audio_stream: AudioStream
var _audio_stream2: AudioStream
var _audio_player: AudioStreamPlayer
var _audio_player2: AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_player.play("shake")
	anim_player.connect("animation_finished", _on_animation_finished)
	Global.upd_day.connect(upd_day)
	
	_audio_player = AudioStreamPlayer.new()
	add_child(_audio_player)
	_audio_player.process_mode = Node.PROCESS_MODE_ALWAYS
	
	_audio_player2 = AudioStreamPlayer.new()
	add_child(_audio_player2)
	_audio_player2.process_mode = Node.PROCESS_MODE_ALWAYS
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setup():
	timer.start(5)
	anim_player.play("slide_in")
	shake_player.play("shake")
	
	_audio_stream = load("res://assets/sounds/general/angry_shark.wav")
	_audio_stream2 = load("res://assets/sounds/general/boss_speak_1.mp3")

	if _audio_stream:
		_audio_player.stream = _audio_stream
		_audio_player.play()
		
		var tween = create_tween().set_loops(1)
		tween.tween_property(_audio_player, "volume_db", 0, 0)
		tween.tween_property(_audio_player, "volume_db", -80, 3)
		call_deferred("_stop_audio_after", 3)
	else:
		printerr("★★★  Wav не загружен!  ★★★", _audio_stream)	
	
	if _audio_stream2:
		_audio_player2.stream = _audio_stream2
		_audio_player2.play()
		
		var tween = create_tween().set_loops(1)
		tween.tween_property(_audio_player2, "volume_db", -10, 0)
		tween.tween_property(_audio_player2, "volume_db", -40, 3)
		call_deferred("_stop_audio_after", 3)
	else:
		printerr("★★★  Wav не загружен!  ★★★", _audio_stream)	
	


func _on_timer_timeout() -> void:
	anim_player.play("slide_out")
	pass # Replace with function body.

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "slide_out":
		queue_free() 


func upd_day(val):
	queue_free() 
