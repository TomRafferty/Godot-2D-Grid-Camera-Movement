extends Node2D

@onready var grid = $Grid

func _ready():
	#call to generate upon creation
	grid.generate_grid()

func _process(_delta):
	debug_input()

func debug_input():
	#if we press the 'HOME' button then we toggle the visibility of debug rects/grid debug
	var debug_rect_contatiner = get_node("Grid/debug_rect_container")
	if Input.is_action_just_pressed("ui_home"):
		debug_rect_contatiner.visible = !debug_rect_contatiner.visible
