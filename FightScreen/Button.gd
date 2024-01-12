extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _pressed():
	var Player=get_parent().get_node("Player")
	if Player:
		Player.take_damage(1)
		Player.mana_reset()
	var Enemy=get_parent().get_node("Enemy")
	if Enemy:
		Enemy.turn_number()
		Enemy.attack_animation()
	
	var CardResset=get_parent().get_node("Card")
	if CardResset:
		CardResset.reset_object(50)
		
	var CardResset2=get_parent().get_node("Card2")
	if CardResset2:
		CardResset2.reset_object(-100)
		
	var CardResset3=get_parent().get_node("Card3")
	if CardResset3:
		CardResset3.reset_object(-250)

