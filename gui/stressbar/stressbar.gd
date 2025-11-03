extends Control

@onready var bar = $TextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	bar.value = 0
	Global.upd_stress.connect(upd_stress)
	pass # Replace with function body.

func upd_stress(value):
	bar.value = value
