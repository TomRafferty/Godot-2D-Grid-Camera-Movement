extends Camera2D

var zoom_speed: float = 0.05
var zoom_min: float = 0.001
var zoom_max: float = 2.0
var drag_sensitivity: float = 1.0

func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		#get the previous frame's mouse position relative to the current frame's mouse position
		#and multiply it by drag_sensitivity to give a new position.
		position -= event.relative * drag_sensitivity
