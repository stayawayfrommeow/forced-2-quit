extends Node2D

signal upd_stress(val)
signal upd_bank(val)
signal upd_day(val)
signal upd_current_event(val)
signal final_day_report(done, failed, income, stress)

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
		"sound": "res://assets/sounds/comics/comics_1/1.wav",
		"quick_sound": "res://assets/sounds/events/board.wav"
	},
	"trade": {
		"id": "trade",
		"name": "потрейдить",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav",
		"quick_sound": "res://assets/sounds/events/board.wav"
	},
	"walk": {
		"id": "walk",
		"name": "прошвырнуться",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav",
		"quick_sound": "res://assets/sounds/events/board.wav"
	},
	"planerka": {
		"id": "planerka",
		"name": "планёрка",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav",
		"quick_sound": "res://assets/sounds/events/board.wav"
	},
	"call": {
		"id": "call",
		"name": "позвонить другу",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav",
		"quick_sound": "res://assets/sounds/events/board.wav"
	},
	"motivate": {
		"id": "motivate",
		"name": "делай это ради них",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav",
		"quick_sound": "res://assets/sounds/events/board.wav"
	},
	"polish": {
		"id": "polish",
		"name": "до блеска!",
		"images": [
			"res://assets/comics/comics_1/4.png",
		],
		"sound": "res://assets/sounds/comics/comics_1/1.wav",
		"quick_sound": "res://assets/sounds/events/board.wav"
	},
	"nocomics": {
		"id": "nocomics",
		"name": "Без комикса",
		"images": [
		],
	},
}


@export var day_result = {
	"stress": 0,
	"income": 0,
	"done": 0,
	"failed": 0
}



const events := [
	#DAY 1
	[
		{
			"group": "cooler",
   			"bank": 5,
   			"stress": -5,
  			"penalty": 0,
			"lifetime": 100,
			"eventTimes": [1, 120, 240, 360, 480],
			"name": "попитлз",
			"instanse": event_instanses["motivate"]
		},
		{

			"group": "flower",
			"bank": 20,
			"stress": 5,
			"penalty": 5,
			"lifetime": 120,
			"eventTimes": [80, 280, 440],
			"name": "полить бедолагу",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "computer",
			"bank": 150,
			"stress": 10,
			"penalty": 20,
			"lifetime": 150,
			"eventTimes": [160, 400],
			"name": "треееейд",
			"instanse": event_instanses["trade"]
>
		},
	],
	#DAY 2
	[
		{
			"group": "board",
			"bank": 5,
			"stress": 5,

			"penalty": 0,
			"lifetime": 60,
			"eventTimes": [20, 80, 140, 220, 280, 340, 420, 480],
			"name": "Новости?",

			"instanse": event_instanses["board"]
		},
		{
			"group": "cooler",

			"bank": 5,
			"stress": -5,
			"penalty": 0,
			"lifetime": 80,
			"eventTimes": [1, 100, 200, 300, 400, 500],

			"name": "Попить воду",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "computer",

			"bank": 150,
			"stress": 10,
			"penalty": 20,
			"lifetime": 160,
			"eventTimes": [120, 320],
			"name": "трейдинг",
			"instanse": event_instanses["trade"]

		},{
			
			"group": "closet",

			"bank": 150,
			"stress": 5,
			"penalty": 10,
			"lifetime": 180,
			"eventTimes": [180, 440],

			"name": "протереть",
			"instanse": event_instanses["nocomics"]
		},{
			"group": "flower",

			"bank": 20,
			"stress": 5,
			"penalty": 5,
			"lifetime": 140,
			"eventTimes": [60, 260, 380],

			"name": "полить",
			"instanse": event_instanses["nocomics"]
		},
	],
	#DAY 3
	[
		{
			"group": "board",
			"bank": 5,
			"stress": 5,

			"penalty": 0,
			"lifetime": 60,
			"eventTimes": [1, 180, 360],

			"name": "Новости???",
			"instanse": event_instanses["board"]
		},
		{
			"group": "cooler",

			"bank": 5,
			"stress": -5,
			"penalty": 0,
			"lifetime": 80,
			"eventTimes": [80, 220, 340, 460],

			"name": "Попить воду",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "computer",

			"bank": 150,
			"stress": 10,
			"penalty": 20,
			"lifetime": 150,
			"eventTimes": [160, 400],

			"name": "спааам",
			"instanse": event_instanses["trade"]
		},
		{
			"group": "closet",

			"bank": 150,
			"stress": 5,
			"penalty": 10,
			"lifetime": 160,
			"eventTimes": [200, 440],
			"name": "протереть",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "flower",
			"bank": 20,
			"stress": 5,
			"penalty": 5,
			"lifetime": 140,
			"eventTimes": [120, 320, 480],
			"name": "полить",
			"instanse": event_instanses["nocomics"]
		},
		{
			 "group": "lift",
			"bank": 0,
			"stress": -15,
			"penalty": 20,
			"lifetime": 140,
			"eventTimes": [140, 380],

			"name": "прошвырнуться",
			"instanse": event_instanses["walk"]
		},
		{
			"group": "printer",
			"bank": 50,

			"stress": 5,
			"penalty": 10,
			"lifetime": 120,
			"eventTimes": [100, 300],

			"name": "поксерить",
			"instanse": event_instanses["nocomics"]
		},
	],
	#DAY 4
	[
		{
			"group": "board",
			"bank": 5,
			"stress": 5,

			"penalty": 0,
			"lifetime": 60,
			"eventTimes": [1],

			"name": "Новости????",
			"instanse": event_instanses["board"]
		},
		{
			"group": "cooler",

			"bank": 5,
			"stress": -5,
			"penalty": 0,
			"lifetime": 70,
			"eventTimes": [100, 240, 380, 500],

			"name": "Попить воду",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "computer",

			"bank": 150,
			"stress": 10,
			"penalty": 20,
			"lifetime": 140,
   			"eventTimes": [200, 400],
			"name": "умомск",
			"instanse": event_instanses["trade"]
		},
		{
			"group": "closet",
			"bank": 150,
			"stress": 5,
			"penalty": 10,
			"lifetime": 150,
			"eventTimes": [260, 480],

			"name": "протереть",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "flower",

			"bank": 20,
			"stress": 5,
			"penalty": 5,
			"lifetime": 120,
			"eventTimes": [160, 340, 480],

			"name": "полить",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "lift",

			"bank": 0,
			"stress": -15,
			"penalty": 20,
			"lifetime": 120,
			"eventTimes": [180, 420],

			"name": "прошвырнуться",
			"instanse": event_instanses["walk"]
		},
		{
			 "group": "printer",
			"bank": 50,

			"stress": 5,
			"penalty": 10,
			"lifetime": 100,
			"eventTimes": [120, 320],

			"name": "поксерить",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "phone",
			"bank": 50,

			"stress": -5,
			"penalty": 5,
			"lifetime": 100,
			"eventTimes": [140, 280, 460],
			"name": "ало?",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "boss",
			"bank": 100,
			"stress": 10,
			"penalty": 20,
			"lifetime": 140,
			"eventTimes": [220, 440],

			"name": "!%№*?",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "planerka",
			"bank": 100,
			"stress": 15,
			"penalty": 30,
			"lifetime": 120,
			"eventTimes": [40],
			"name": "планёр0чка",
			"instanse": event_instanses["planerka"]
		},
	],
	#DAY 5
	[
		{
			 "group": "board",
			"bank": 5,
			"stress": 5,

			"penalty": 0,
			"lifetime": 50,
			"eventTimes": [1],

			"name": "Новости?????",
			"instanse": event_instanses["board"]
		},
		{
			"group": "cooler",

			"bank": 5,
			"stress": -5,
			"penalty": 0,
			"lifetime": 60,
			"eventTimes": [130, 210, 290, 370, 450, 530],

			"name": "Попить воду",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "computer",

			"bank": 150,
			"stress": 10,
			"penalty": 20,
			"lifetime": 80,
			"eventTimes": [100, 280, 400],

			"name": "спааам",
			"instanse": event_instanses["trade"]
		},
		{
			"group": "closet",

			"bank": 150,
			"stress": 5,
			"penalty": 10,
			"lifetime": 80,
			"eventTimes": [160, 320, 480],

			"name": "протереть",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "flower",

			"bank": 20,
			"stress": 5,
			"penalty": 5,
			"lifetime": 70,
			"eventTimes": [110, 190, 270, 350, 430, 510],

			"name": "полить",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "lift",

			"bank": 0,
			"stress": -15,
			"penalty": 20,
			"lifetime": 70,
			"eventTimes": [80, 200, 340, 460],

			"name": "прошвырнуться",
			"instanse": event_instanses["walk"]
		},
		{
			"group": "printer",
			"bank": 50,

			"stress": 5,
			"penalty": 10,
			"lifetime": 70,
			"eventTimes": [60, 140, 220, 300, 380],

			"name": "поксерить",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "phone",
			"bank": 50,

			"stress": -5,
			"penalty": 5,
			"lifetime": 60,
			"eventTimes": [90, 170, 250, 330, 410, 490],
			"name": "ответить на звонок",
			"instanse": event_instanses["nocomics"]
		},
		{
			 "group": "boss",
			"bank": 100,
			"stress": 10,
			"penalty": 20,
			"lifetime": 70,
			"eventTimes": [120, 240, 360, 440],

			"name": "!%№*?",
			"instanse": event_instanses["nocomics"]
		},
		{
			"group": "planerka",

			"bank": 100,
			"stress": 15,
			"penalty": 30,
			"lifetime": 80,
			"eventTimes": [40, 260],

			"name": "планёр0чка",
			"instanse": event_instanses["planerka"]
		},
		{
			"group": "photo",
			"bank": 5,
			"stress": -20,
			"penalty": 0,
			"lifetime": 60,
			"eventTimes": [150, 310, 470],
			"name": "do it for...",
			"instanse": event_instanses["nocomics"]
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
		day_result["stress"] += delta
		emit_signal('upd_stress', new_value)
		
@export var bank = 0:
	set(delta):
		var old_value = stress
		var new_value = old_value + delta
		bank = new_value
		day_result["income"] += delta
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
	
	day_result["stress"] = 0
	day_result["income"] = 0
	day_result["done"] = 0
	day_result["failed"] = 0

func end_current_day():
	get_tree().change_scene_to_file("res://day_passed/day_passed.tscn")
