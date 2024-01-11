extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("enemy_defeated",_on_enemy_defeated)



func _process(delta):
	pass
	

func _on_enemy_defeated():
	print("enemy_defeated_world")
	var enemy = get_node("Enemy")
	if enemy:
		enemy.queue_free()
	
