extends Control

@onready var dayLabel = $Label

const days = ["ПН", "ВТ", "СР", "ЧТ", "ПТ", "СБ", "ВС"]

# Called when the node enters the scene tree for the first time.
func _ready():
	print("day", Global.day - 1)
	dayLabel.text = str(days[Global.day])
	Global.upd_day.connect(upd_day)
	pass # Replace with function body.

func upd_day(val):
	dayLabel.text = str(days[val])
