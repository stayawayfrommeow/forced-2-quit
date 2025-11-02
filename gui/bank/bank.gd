extends Control

@onready var bankLabel = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	bankLabel.text = str(Global.bank, '$')
	Global.upd_bank.connect(upd_bank)
	pass # Replace with function body.

func upd_bank(val):
	bankLabel.text = str(val, '$')
