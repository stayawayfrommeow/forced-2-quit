extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match Global.day:
		1:
			texture = load("res://assets/next_days/1.png")
		2:
			texture = load("res://assets/next_days/2.png")
		3:
			texture = load("res://assets/next_days/3.png")
		4:
			texture = load("res://assets/next_days/4.png")
		5:
			texture = load("res://assets/next_days/5.png")
		_:
			print("Invalid day")

	print(texture)
	pass  # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
