extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var animplayer = $AnimationPlayer
@onready var worktimer = $worktimer
const SPEED = 400.0
var working = false



func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if !working:
		if direction:
			velocity.x = direction * SPEED
			anim.play("walk")
			anim.scale.x = -direction * 1
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			anim.play('idle')


	move_and_slide()
	
func do_backflip():
	animplayer.play('backflip')
	
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
