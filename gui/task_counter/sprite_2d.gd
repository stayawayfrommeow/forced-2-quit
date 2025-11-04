extends Sprite2D   # скрипт на спрайт

@onready var label = $Label
@export var label_offset_x: float = 0   # желаемое смещение при нормальном состоянии

func _ready() -> void:
	_update_label_pos()

func set_flip_h(enabled: bool) -> void:
	flip_h = enabled
	_update_label_pos()
	
func _update_label_pos() -> void:
	var w := texture.get_width() * scale.x
	$Label.position.x = -w if flip_h else 0
