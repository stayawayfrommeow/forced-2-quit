class_name TaskCounter
extends Control

var player: Node2D
var camera: Camera2D
const TIME_LEFT_ALERT = 5.0

enum ArrowSide { LEFT, RIGHT }
@export var side: ArrowSide = ArrowSide.LEFT:
	set(v):
		side = v
@onready var label = $ColorRect/Label
@onready var label2 = $ColorRect/Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.upd_current_event.connect(upd_current_event)
	
	player = get_tree().get_first_node_in_group("player")
	camera = get_tree().get_first_node_in_group("main_camera")
	
	pass # Replace with function body.

func _on_camera_moved() -> void:
	upd_current_event(Global.current_events)   # или ваш массив заданий
	
var _cam_pos_prev: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	upd_current_event(Global.current_events)   # или ваш массив заданий
	#if player.global_position != _cam_pos_prev:
		#_cam_pos_prev = player.global_position
		#_on_camera_moved()

func upd_current_event(events) -> void:
	var left_in_view = []
	var right_in_view = []
	var left_out_view = []
	var right_out_view = []

	var cam_rect := _get_camera_rect()

	for t in events:
		if is_instance_valid(t):
			var pos = t.global_position
			var is_left = pos.x < player.global_position.x
			var in_camera := cam_rect.has_point(pos)

			if is_left:
				if in_camera:
					left_in_view.append(t)
				else:
					left_out_view.append(t)
			else:
				if in_camera:
					right_in_view.append(t)
				else:
					right_out_view.append(t)

		if (side == ArrowSide.LEFT):
			if (left_out_view.size() > 0):
				if has_urgent_outside(left_out_view):
					label2.text = "*"
				else:
					label2.text = ""
				
				self.visible = true
				label.text = str(left_out_view.size())
			else:
				self.visible = false
		else:
			if (right_out_view.size() > 0):
				if has_urgent_outside(right_out_view):
					label2.text = "*"
				else:
					label2.text = ""
				
				self.visible = true
				label.text = str(right_out_view.size())
			else:
				self.visible = false

	#print("L-in: %d, R-in: %d, L-out: %d, R-out: %d" %
		  #[left_in_view.size(), right_in_view.size(), left_out_view.size(), right_out_view.size()])

func has_urgent_outside(out_view) -> bool:
	for item in out_view:
		if item.time_left < TIME_LEFT_ALERT:
			return true
	return false

func _get_camera_rect() -> Rect2:
	var vp_size := get_viewport().get_visible_rect().size
	var top_left := camera.get_screen_center_position() - vp_size * 0.5
	return Rect2(top_left, vp_size)
