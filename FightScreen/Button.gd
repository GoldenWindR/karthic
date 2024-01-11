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
	var CardResset=get_parent().get_node("Card")
	if CardResset:
		CardResset.reset_object(50)
		
	var CardResset2=get_parent().get_node("Card2")
	if CardResset2:
		CardResset2.reset_object(-100)
		
	var CardResset3=get_parent().get_node("Card3")
	if CardResset3:
		CardResset3.reset_object(-250)

