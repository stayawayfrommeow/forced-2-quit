extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var animplayer = $AnimationPlayer
@onready var worktimer = $worktimer
const SPEED = 400.0
var working = false

var _audio_stream: AudioStream
var _audio_player: AudioStreamPlayer
var _tween

func _ready():
	_audio_player = AudioStreamPlayer.new()
	add_child(_audio_player)
	_audio_player.process_mode = Node.PROCESS_MODE_ALWAYS
	_audio_stream = load("res://assets/sounds/general/steps.mp3")
	_tween = Tween.new()
	if _audio_stream:
		_audio_player.stream = _audio_stream

	else:
		printerr("★★★  Wav не загружен!  ★★★")	

func fade_out_audio(duration: float):
	# Анимируем громкость до нуля за заданное время
	_tween.tween_property(_audio_player, "volume_db", 0, 0)
	_tween.tween_property(_audio_player, "volume_db", -80, duration)
	call_deferred("_stop_audio_after", duration)

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if !working:
		if direction:
			velocity.x = direction * SPEED
			anim.play("walk")
			anim.scale.x = -direction * 1
		
			
			if !_audio_player.playing:
				_audio_player.play()
			
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			_audio_player.stop()
			anim.play('idle')


	move_and_slide()
	
func do_backflip():
	animplayer.play('backflip')
	
func _on_tween_completed():
	_audio_player.stop()	
	
func do_work(time: int):
	velocity.x = 0
	working = true
	worktimer.start(time)
	anim.play("work_start")
	await anim.animation_looped
	anim.play("work_active")
	await worktimer.timeout
	anim.play_backwards("work_start")
	await anim.animation_looped
	anim.play("idle")
	working = false
