extends Camera2D

var zoom_speed: float = 0.05
var zoom_min: float = 0.1
var zoom_max: float = 2.0
var drag_sensitivity: float = 1.0

func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		#panning
		#get the previous frame's mouse position relative to the current frame's mouse position
		#and multiply it by drag_sensitivity to give a new position.
		position -= event.relative * drag_sensitivity / zoom #dividing by zoom adds relative scale to the speed at which we pan
		
	#zooming:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP: #zoom in
			zoom += Vector2(zoom_speed, zoom_speed)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN: #zoom out
			zoom -= Vector2(zoom_speed, zoom_speed)
		zoom = clamp(zoom, Vector2(zoom_min, zoom_min), Vector2(zoom_max, zoom_max)) #we clamp here to add zoom limitations
