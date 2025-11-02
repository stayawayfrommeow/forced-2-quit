extends Node2D

@onready var quest1 = $Interactable
@onready var quest2 = $Interactable2
@onready var quest3 = $Interactable3
@onready var win_screen = $win_screen_placeholder


# Called when the node enters the scene tree for the first time.
func _ready():
	quest1.visible = true
	quest2.visible = false
	quest3.visible = false
	win_screen.visible = false
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#quest 1 completed
func _on_interactable_tree_exited():
	quest2.visible = true
	quest3.visible = false
	pass # Replace with function body.

#quest 2 completed
func _on_interactable_2_tree_exited():
	quest3.visible = true

	
	pass # Replace with function body.

#quest 3 completed
func _on_interactable_3_tree_exited():
	win_screen.visible = true

	
	Global.endDay(1)
	pass # Replace with function body.
