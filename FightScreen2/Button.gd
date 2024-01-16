extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _pressed():
	var Player=get_parent().get_node("Player")
	var Enemy=get_parent().get_node("Krwiopijca")
	if Enemy:
		Enemy.turn_number()
		Enemy.attack_animation()
	if Player:
		Player.take_damage(Enemy.dmg_now()*3)
		Enemy.dmg_rng()
		Player.mana_reset()

	
	var CardResset=get_parent().get_node("Card")
	if CardResset:
		CardResset.reset_object(50)
		
	var CardResset2=get_parent().get_node("Card2")
	if CardResset2:
		CardResset2.reset_object(-100)
		
	var CardResset3=get_parent().get_node("Card3")
	if CardResset3:
		CardResset3.reset_object(-250)

