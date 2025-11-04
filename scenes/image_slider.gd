extends Control
class_name ImageSlider
signal closed()

@export var fade_duration := 0.25
var _resources: Array[Texture2D]
var _idx: int = -1
var _busy: bool = false
var _audio_stream: AudioStream
var _audio_player: AudioStreamPlayer

func setup(resources: Array[Texture2D], audio_path: String = "") -> void:
	_audio_player = AudioStreamPlayer.new()
	add_child(_audio_player)
	_audio_player.process_mode = Node.PROCESS_MODE_ALWAYS
	
	if resources.is_empty():
		queue_free(); return
	_resources = resources
	_idx = 0
	if audio_path and not audio_path.is_empty():
		_audio_stream = load(audio_path)
		if _audio_stream:
			_audio_player.stream = _audio_stream
			_audio_player.play()
		else:
			printerr("★★★  Wav не загружен!  ★★★")
	_show_current()

# ---------- клик мышью ----------
func _gui_input(ev: InputEvent) -> void:
	if ev is InputEventMouseButton and ev.pressed and ev.button_index == MOUSE_BUTTON_LEFT:
		_next()

# ---------- клавиатура ----------
func _input(ev: InputEvent) -> void:
	if ev is InputEventKey and ev.pressed and ev.keycode == KEY_SPACE:
		_next()
		
		if (get_viewport()):
			get_viewport().set_input_as_handled() # чтобы Space не дошёл до других узлов

func _next() -> void:
	if _busy: return
	_busy = true
	_idx += 1
	if _idx >= _resources.size():
		_fade_out_and_die()
	else:
		_fade_to_next()

func _fade_to_next() -> void:
	create_tween().tween_property($Image, "modulate:a", 0, fade_duration * 0.5) \
		.finished.connect(_on_half_done)

func _on_half_done() -> void:
	_show_current()
	create_tween().tween_property($Image, "modulate:a", 1, fade_duration * 0.5) \
		.finished.connect(_on_fade_done)

func _on_fade_done() -> void:
	_busy = false

func _fade_out_and_die() -> void:
	if _audio_player and _audio_player.playing:
		_audio_player.stop()
	create_tween().tween_property(self, "modulate:a", 0, fade_duration) \
		.finished.connect(queue_free)
	closed.emit()

func _show_current() -> void:
	$Image.texture = _resources[_idx]
	modulate = Color.WHITE
