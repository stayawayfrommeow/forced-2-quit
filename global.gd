extends Node2D

signal upd_stress(val)
signal upd_bank(val)

var day1scn = preload("res://day1/day1.tscn")
var letter_scn = preload("res://starting_letter/starting_letter.tscn")
var stressbar = "res://stressbar/stressbar.tscn"

var MAX_STRESS = 100
@export var stress = 0:
	set(delta):
		var old_value = stress
		var new_value = old_value + delta
		if new_value < 0:
			stress = 0
		if new_value > MAX_STRESS:
			print('gg')
		stress = new_value
		emit_signal('upd_stress', new_value)
		
@export var bank = 0:
	set(delta):
		var old_value = stress
		var new_value = old_value + delta
		bank = new_value
		emit_signal('upd_bank', new_value)
	get:
		return bank


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().change_scene_to_packed(letter_scn)
	pass # Replace with function body.

func goToDay(number):
	match number:
		1:
			get_tree().change_scene_to_packed(day1scn)
		2:
			get_tree().change_scene_to_file("res://day1/day1.tscn")

func endDay(number):
	get_tree().change_scene_to_file("res://day_passed/day_passed.tscn")
