extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _pressed():
	var Player=get_parent().get_node("Player")
	if Player:
		Player.take_damage(10)
	else:
		print("Obiekt A nie został znaleziony.")
		
