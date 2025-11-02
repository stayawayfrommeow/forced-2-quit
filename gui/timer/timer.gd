extends Node

var HOURS_PER_DAY = 10
var MINUTES_PER_HOUR = 60
var MINUTERS_PER_TICK = 5
@onready var timer = $"../Timer"
@onready var clock_text = $Label
var total_time

# Called when the node enters the scene tree for the first time.
func _ready():
	total_time = 0
	calc_time(total_time)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func calc_time(total_time : int) -> void:
	# константы, которые должны быть где-то объявлены
	const MINUTERS_PER_TICK := 10          # сколько минут игрового времени в одном тике
	const MINUTES_PER_HOUR  := 60
	const START_HOURS       := 9    

	var total_minutes := total_time * MINUTERS_PER_TICK
	var hours   := START_HOURS + total_minutes / MINUTES_PER_HOUR
	var minutes := total_minutes % MINUTES_PER_HOUR

	# %02d — всегда две цифры, с ведущим нулём
	clock_text.text = "%02d:%02d" % [hours, minutes]
	


func _on_timer_timeout():
	total_time += 1
	calc_time(total_time)
	
	Global.generate_events(total_time)
	
	if (total_time > 54):
		Global.end_current_day()
	pass # Replace with function body.
