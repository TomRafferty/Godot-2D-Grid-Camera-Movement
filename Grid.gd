class_name Grid
extends Node2D

@export var width: int = 12 #size of the grid x
@export var height: int = 12 #size of the grid y
@export var cell_size: int = 128 #size of each grid cell in pixels

var grid: Dictionary = {} #stores our grid -> Vector2 keys corresponding to a grid position

func generate_grid():
	#nested loop to create our grid
	for x in width:
		for y in width:
			grid[Vector2(x,y)] = null #null simply indicating that the space is empty

func grid_to_world(pos: Vector2) -> Vector2:
	#takes a grid position and multiplies it by
	#the cell size to give us a world position in pixels
	return pos * cell_size

func world_to_grid(pos: Vector2) -> Vector2:
	#takes a world position and divides it by the 
	#cell size to give us our grid position
	return floor(pos / cell_size)
