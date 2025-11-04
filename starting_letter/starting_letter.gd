extends Node2D
var level = preload("res://level/level.tscn")

var comic_ended = false

var images = [
	"res://assets/comics/start/1.png",
	"res://assets/comics/start/2.png",
	"res://assets/comics/start/3.png",
	"res://assets/comics/start/4.png"
	]
var sound = "res://assets/sounds/comics/comics_1/1.wav"


# Called when the node enters the scene tree for the first time.
func _ready():
	Spawner.show_slider(images, sound)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event: InputEvent) -> void:
	# Отловить нажатие на клавишу "space"
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		get_tree().change_scene_to_packed(level)
		
		
	if event is InputEventKey and event.pressed and event.keycode == KEY_E:
		get_tree().change_scene_to_packed(level)
		
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().change_scene_to_packed(level)
