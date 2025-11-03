extends Node2D
var level = preload("res://level/level.tscn")

var comic_ended = false

var images = ["res://assets/comics/comics_1/1.png","res://assets/comics/comics_1/2.jpg","res://assets/comics/comics_1/5.jpg"]
var sound = "res://assets/sounds/comics/comics_1/1.wav"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if !comic_ended:
		Spawner.show_slider(images, sound)
		comic_ended = true
	else:
		get_tree().change_scene_to_packed(level)
	pass # Replace with function body.
