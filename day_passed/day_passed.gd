extends Node2D

@onready var sprint = $Sprite
@onready var stress_label = $Stress
@onready var income_label = $Income
@onready var done_label = $QuestDone
@onready var failed_label = $QuestFailed

# Called when the node enters the scene tree for the first time.
func _ready():
	print(Global.day_result)
	stress_label.text = "Накопившийся стресс: " + str(Global.day_result["stress"]) + "%"
	income_label.text = "Заработная плата: " + str(Global.day_result["income"]) + "$"
	failed_label.text = "Заданий провалено: " + str(Global.day_result["failed"])
	done_label.text = "Заданий выполнено: " + str(Global.day_result["done"])
	pass  # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event: InputEvent) -> void:
	# Отловить нажатие на клавишу "space"
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		Global.start_next_day()

	if event is InputEventKey and event.pressed and event.keycode == KEY_E:
		Global.start_next_day()
		
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Global.start_next_day()
