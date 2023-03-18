class_name Grid
extends Node2D

@export var width: int = 12 #size of the grid x
@export var height: int = 12 #size of the grid y
@export var cell_size: int = 128 #size of each grid cell in pixels
@export var show_debug: bool = true #switch for debug(shows the grid)

var grid: Dictionary = {} #stores our grid -> Vector2 keys corresponding to a grid position

func generate_grid():
	#nested loop to create our grid
	for x in width:
		for y in width:
			grid[Vector2(x,y)] = null #null simply indicating that the space is empty
			if show_debug:
				create_debug_rect(x,y)

func grid_to_world(pos: Vector2) -> Vector2:
	#takes a grid position and multiplies it by
	#the cell size to give us a world position in pixels
	return pos * cell_size

func world_to_grid(pos: Vector2) -> Vector2:
	#takes a world position and divides it by the 
	#cell size to give us our grid position
	return floor(pos / cell_size)

func create_debug_rect(x, y):
	#creates a debug rect for easy visual 
	#representation of the grid - complete with label of position
	
	var container = $debug_rect_container
	
	var rect = ReferenceRect.new()
	rect.position = grid_to_world(Vector2(x,y))
	rect.size = Vector2(cell_size, cell_size)
	rect.editor_only = false
	container.add_child(rect)
	var label = Label.new()
	label.position = grid_to_world(Vector2(x,y))
	label.text = str(Vector2(x,y))
	container.add_child(label)
