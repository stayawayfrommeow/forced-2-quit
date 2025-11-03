extends Node2D

signal upd_stress(val)
signal upd_bank(val)
signal upd_day(val)

var day1scn = preload("res://day1/day1.tscn")
var letter_scn = preload("res://starting_letter/starting_letter.tscn")
var stressbar = "res://stressbar/stressbar.tscn"

const events := [
	[
		{
			"group": "cooler",
			"lifetime": 5,
			"stress": 5,
			"bank": 50,
			"penalty": 20,
			"name": "Распечатать документы",
			"eventTimes": [6, 12, 18, 24, 30, 36]
		}
	],
	[
				{
			"group": "printer",
			"lifetime": 5,
			"stress": 5,
			"bank": 50,
			"penalty": 20,
			"name": "Распечатать документы",
			"eventTimes": [6, 12, 18, 24]
		},
		{
			"group": "cooler",
			"lifetime": 5,
			"stress": 10,
			"bank": 50,
			"penalty": 20,
			"name": "Попить воду",
			"eventTimes": [3, 9, 15, 21]
		},
		{
			"group": "elevator",
			"lifetime": 5,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "Погулять",
			"eventTimes": [30, 36, 42]
		}
	],
	[],
	[],
	[]
]

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

var day = 1


func generate_events(time_tick: int):
	for event in events[day - 1]:
		if (event.eventTimes.has(time_tick)):
			var nodes = get_tree().get_nodes_in_group(event.group)
			for i in range(nodes.size()):
				var val = nodes[i]
				if (!val.activated):
					val.activate(event.lifetime, event.penalty, event.stress, event.bank, event.name)
					break;
				
		
	
	#var nodes = get_tree().get_nodes_in_group("Interactables")
	#for i in range(nodes.size()):
		#var val = nodes[i] 
#
		#if schedule[i].has(time_tick):
			#val.activate()
			#print("Активация", i)

func start_next_day():
	var nodes = get_tree().get_nodes_in_group("Interactables")
	for i in range(nodes.size()):
		var val = nodes[i]
		if (val.activated):
			val.deactivate()
	
	stress = -stress
	day += 1
	emit_signal('upd_day', day)
	
	
	get_tree().change_scene_to_file("res://day1/day1.tscn")

func end_current_day():
	get_tree().change_scene_to_file("res://day_passed/day_passed.tscn")
