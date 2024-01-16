extends CanvasLayer
@onready var value: Label = $PanelContainer/MarginContainer/VBoxContainer/CenterContainer/VBoxContainer/Label
@onready var lineedit = $PanelContainer/MarginContainer/VBoxContainer/CenterContainer/VBoxContainer/LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	value.set_text("test")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value.set_text(str(Global.pull_score()))
	pass
func _on_exit_button_pressed():
	print(lineedit.get_text())
	get_tree().change_scene_to_file("res://MainManu/menu.tscn")
