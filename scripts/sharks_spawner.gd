extends Node
class_name SharksSpawnerClass

const SHARK_HEAD_SCENE := preload("res://gui/sharks_head/sharks_head.tscn")

func create_head() -> void:
	var head := SHARK_HEAD_SCENE.instantiate() as SharksHead

	get_tree().get_first_node_in_group("gui").add_child(head)

	head.setup()
