extends Node2D

@onready var grid = $Grid

func _ready():
	#call to generate upon creation
	grid.generate_grid()
