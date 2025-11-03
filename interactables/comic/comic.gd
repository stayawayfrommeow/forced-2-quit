extends CanvasLayer

@export var panel_sprts: Array[CompressedTexture2D]

@onready var timer = $Timer
@onready var layout1 = $layout1

#import PANELS
@onready var p1 = $layout1/Panel1
@onready var p2 = $layout1/Panel2
@onready var p3 = $layout1/Panel3
@onready var ps = [p1,p2,p3]

signal comic_ended
signal comic_start

var TIME_BETWEEN_PANELS = 1
var NUMBER_OF_PANELS = 3

func _ready():
	print("ready")
	pass

func _on_comic_start():
	p1.visible = true
	timer.start(1)
	await timer.timeout
	p2.visible = true
	timer.start(1)
	await timer.timeout
	p3.visible = true
	emit_signal('comic_ended')
