extends Node2D


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Worlds/world.tscn")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
