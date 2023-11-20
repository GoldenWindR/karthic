extends Node2D

var is_dragging = false
var drag_offset = Vector2()

func _process(delta):
	if is_dragging:
		var mouse_pos = get_global_mouse_position()
		set_global_position(mouse_pos - drag_offset)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				start_drag(event.global_position)
			else:
				stop_drag()

func start_drag(mouse_position):
	is_dragging = true
	drag_offset = mouse_position - global_position

func stop_drag():
	is_dragging = false
	drag_offset = Vector2()
