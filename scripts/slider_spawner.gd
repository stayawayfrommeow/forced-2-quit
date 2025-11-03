extends Node
class_name SliderSpawner

signal slider_closed

const SLIDER_SCENE := preload("res://scenes/ImageSlider.tscn")

func show_slider(
		asset_paths: Array,
		audio_path: String = "",
		pause_game: bool = true
) -> void:
	var layer := CanvasLayer.new()
	var slider := SLIDER_SCENE.instantiate() as ImageSlider

	if pause_game:
		layer.process_mode  = Node.PROCESS_MODE_ALWAYS
		slider.process_mode = Node.PROCESS_MODE_ALWAYS

	layer.add_child(slider)
	get_tree().current_scene.add_child(layer)

	if pause_game:
		get_tree().paused = true
		slider.closed.connect(_on_slider_closed.bind(layer)) # layer тоже удалим


	var textures: Array[Texture2D]
	for p in asset_paths:
		var tex := load(p) as Texture2D
		if tex:
			textures.append(tex)
	slider.setup(textures, audio_path)

func _on_slider_closed(layer: CanvasLayer) -> void:
	get_tree().paused = false
	emit_signal('slider_closed')
	layer.queue_free()
