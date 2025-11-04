extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
var tween


func blink_start(cycle_duration := 0.5) -> void:
	if tween and tween.is_running():          # уже мигаем
		return
	
	modulate = Color.BLACK          # явный старт
	tween = create_tween().set_loops()          # бесконечно
	# красный → чёрный → красный (один полный цикл)
	tween.tween_property(self, "modulate", Color.RED,   cycle_duration * 0.5)
	tween.tween_property(self, "modulate", Color.BLACK, cycle_duration * 0.5)
		
func blink_stop() -> void:
	if tween:
		tween.kill()
		modulate = Color.BLACK
