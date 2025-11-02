extends Node

var HOURS_PER_DAY = 10
var MINUTES_PER_HOUR = 60
var MINUTERS_PER_TICK = 5
@onready var timer = $"../Timer"
@onready var clock_text = $Label
var total_time
var START_HOURS = 08
var START_MINUTES = 00

# Called when the node enters the scene tree for the first time.
func _ready():
	total_time = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func calc_time (total_time):
	var total_minutes = total_time * MINUTERS_PER_TICK
	var total_hours = floor(total_minutes / MINUTES_PER_HOUR)
	var pretty_minutes = total_minutes % MINUTES_PER_HOUR
	var pretty_hours = START_HOURS + total_hours
	clock_text.text = str(pretty_hours, ':', pretty_minutes)
	pass
	


func _on_timer_timeout():
	total_time += 1
	calc_time(total_time)
	pass # Replace with function body.
