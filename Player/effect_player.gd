
extends HBoxContainer
@onready var poison = $poison
@onready var fier = $fier




func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Player = get_parent()
	if Player:
		var poison_status : bool = Player.poison_status()
		var fier_status : bool = Player.fier_status()
		poison.visible  = poison_status
		fier.visible  = fier_status
		

