extends Node2D

signal upd_stress(val)
signal upd_bank(val)
signal upd_day(val)
signal upd_current_event(val)

var letter_scn = preload("res://starting_letter/starting_letter.tscn")
var stressbar = "res://stressbar/stressbar.tscn"

const event_instanses = {
	"board": {
		"id": "board",
		"name": "Посмотреть на доску",
		"images": [
			"res://assets/comics/comics_1/1.png",
			"res://assets/comics/comics_1/2.jpg",
			"res://assets/comics/comics_1/5.jpg",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav"
	},
	"mail": {
		"id": "mail",
		"name": "проверить почту",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav"
	},
	"walk": {
		"id": "walk",
		"name": "прошвырнуться",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav"
	},
	"planerka": {
		"id": "planerka",
		"name": "планёрка",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav"
	},
	"call": {
		"id": "call",
		"name": "позвонить другу",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav"
	},
	"motivate": {
		"id": "motivate",
		"name": "делай это ради них",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav"
	},
	"polish": {
		"id": "polish",
		"name": "до блеска!",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav"
	},
	"nocomics": {
		"id": "nocomics",
		"name": "Без комикса",
		"images": [
		],
	},
}

const events := [
	#DAY 1
	[
		{
			"group": "cooler",
			"lifetime": 120,
			"stress": 5,
			"bank": 50,
			"penalty": 20,
			"eventTimes": [10, 140],
			"name": "попитлз",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "board",
			"lifetime": 150,
			"stress": 5,
			"bank": 50,
			"penalty": 200,
			"name": "новости?",
			"eventTimes": [20, 400],
			"instanse": event_instanses["board"]
		},
		{
			"group": "computer",
			"lifetime": 150,
			"stress": 5,
			"bank": 50,
			"penalty": 200,
			"name": "чек почты",
			"eventTimes": [30, 600],
			"instanse": event_instanses["mail"]
		},
	],
	#DAY 2
	[
		{
			"group": "board",
			"lifetime": 50,
			"stress": 5,
			"bank": 50,
			"penalty": 20,
			"name": "Новости??",
			"eventTimes": [60, 120, 180, 240],
			"instanse": event_instanses["board"]
		},
		{
			"group": "cooler",
			"lifetime": 50,
			"stress": 10,
			"bank": 50,
			"penalty": 20,
			"name": "Попить воду",
			"eventTimes": [30, 90, 150, 210],
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "computer",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "спааам",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["mail"]
		},{
			"group": "closet",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "протереть",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["polish"]
		},{
			"group": "flower",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "полить",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["nocomics"]
		},
	],
	#DAY 3
	[
		{
			"group": "board",
			"lifetime": 50,
			"stress": 5,
			"bank": 50,
			"penalty": 20,
			"name": "Новости???",
			"eventTimes": [60, 120, 180, 240],
			"instanse": event_instanses["board"]
		},
		{
			"group": "cooler",
			"lifetime": 50,
			"stress": 10,
			"bank": 50,
			"penalty": 20,
			"name": "Попить воду",
			"eventTimes": [30, 90, 150, 210],
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "computer",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "спааам",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["mail"]
		},
		{
			"group": "closet",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "протереть",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["polish"]
		},
		{
			"group": "flower",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "полить",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "lift",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "прошвырнуться",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["walk"]
		},
		{
			"group": "printer",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "поксерить",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["nocomics"]
		},
	],
	#DAY 4
	[
		{
			"group": "board",
			"lifetime": 50,
			"stress": 5,
			"bank": 50,
			"penalty": 20,
			"name": "Новости????",
			"eventTimes": [60, 120, 180, 240],
			"instanse": event_instanses["board"]
		},
		{
			"group": "cooler",
			"lifetime": 50,
			"stress": 10,
			"bank": 50,
			"penalty": 20,
			"name": "Попить воду",
			"eventTimes": [30, 90, 150, 210],
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "computer",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "спааам",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["mail"]
		},
		{
			"group": "closet",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "протереть",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["polish"]
		},
		{
			"group": "flower",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "полить",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "lift",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "прошвырнуться",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["walk"]
		},
		{
			"group": "printer",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "поксерить",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "phone",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "поговорить с другом",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["call"]
		},
		{
			"group": "boss",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "!%№*?",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["nocomics"]
		},
	],
	#DAY 5
	[
		{
			"group": "board",
			"lifetime": 50,
			"stress": 5,
			"bank": 50,
			"penalty": 20,
			"name": "Новости?????",
			"eventTimes": [60, 120, 180, 240],
			"instanse": event_instanses["board"]
		},
		{
			"group": "cooler",
			"lifetime": 50,
			"stress": 10,
			"bank": 50,
			"penalty": 20,
			"name": "Попить воду",
			"eventTimes": [30, 90, 150, 210],
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "computer",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "спааам",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["mail"]
		},
		{
			"group": "closet",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "протереть",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["polish"]
		},
		{
			"group": "flower",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "полить",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "lift",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "прошвырнуться",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["walk"]
		},
		{
			"group": "printer",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "поксерить",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "phone",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "поговорить с другом",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["call"]
		},
		{
			"group": "boss",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "!%№*?",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "planerka",
			"lifetime": 50,
			"stress": 20,
			"bank": 50,
			"penalty": 20,
			"name": "планёр0чка",
			"eventTimes": [300, 360, 420],
			"instanse": event_instanses["planerka"]
		},
	]
]

const endingImages := ["res://assets/comics/comics_1/1.png","res://assets/comics/comics_1/2.jpg","res://assets/comics/comics_1/5.jpg"]
const endingSound := "res://assets/sounds/comics/comics_1/1.wav"

var MAX_STRESS = 100
@export var stress = 0:
	set(delta):
		var old_value = stress
		var new_value = old_value + delta
		if new_value < 0:
			stress = 0
		if new_value > MAX_STRESS:
			end_the_game()
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

var readed_comics: Array[String] = []

func end_the_game():
	Spawner.show_slider(endingImages, endingSound)
	await Spawner.slider_closed
	get_tree().change_scene_to_file("res://ending_screen/ending_screen.tscn")
	pass

func add_readed_comics(name: String):
	readed_comics.push_back(name)
	
func has_readed_comics(name: String) -> bool:
	return readed_comics.has(name)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().change_scene_to_packed(letter_scn)
	pass # Replace with function body.

var day = 1

@export var current_events = []
func add_events(event):
	current_events.push_back(event)
	emit_signal('upd_current_event', current_events)
	pass
	
func delete_events(event):
	remove_by_id(current_events, event.get_instance_id())
	emit_signal('upd_current_event', current_events)
	pass
	
func remove_by_id(nodes, id: int) -> void:
	# идём с конца, чтобы индексы не съехали
	for i in range(nodes.size() - 1, -1, -1):
		
		if is_instance_valid(nodes[i]) and nodes[i].get_instance_id() == id:
			nodes.remove_at(i)	


func generate_events(time_tick: int):
	for event in events[day - 1]:
		if (event.eventTimes.has(time_tick)):
			var nodes = get_tree().get_nodes_in_group(event.group)
			print(event.group, nodes)
			for i in range(nodes.size()):
				var val = nodes[i]
				if (!val.activated):

					val.activate(event)
					break;
				

func start_next_day():
	var nodes = get_tree().get_nodes_in_group("items")
	for i in range(nodes.size()):
		var val = nodes[i]
		if (val.activated):
			val.deactivate()
  
	stress = -stress
	day += 1
	emit_signal('upd_day', day)
	current_events = []

	get_tree().change_scene_to_file("res://level/level.tscn")

func end_current_day():
	get_tree().change_scene_to_file("res://day_passed/day_passed.tscn")
