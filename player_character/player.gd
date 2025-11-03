extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
const SPEED = 400.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		anim.play("walk")
		anim.scale.x = -direction * 1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play('idle')
	

	move_and_slide()
