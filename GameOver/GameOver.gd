extends CanvasLayer
@onready var value: Label = $PanelContainer/MarginContainer/VBoxContainer/CenterContainer/VBoxContainer/Label
@onready var lineedit = $PanelContainer/MarginContainer/VBoxContainer/CenterContainer/VBoxContainer/LineEdit
var score
var player_name

func _ready():
	pass # Replace with function body.

func _process(delta):
	value.set_text(str(Global.pull_score()))
	score = Global.pull_score()
	pass
func _on_exit_button_pressed():
	player_name = lineedit.get_text()
	Db.insertScore(player_name,score)
	get_tree().change_scene_to_file("res://MainManu/menu.tscn") 
