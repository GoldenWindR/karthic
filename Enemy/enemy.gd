extends CharacterBody2D
@onready var sprite = $AnimatedSprite2D
enum EnemyType { Type1, Type2, Type3 }

signal enemy_defeated
var health_progress_bar
var max_hp = 40
var hp = max_hp
var is_on_fier : bool = false
var is_in_combat : bool = false
var turn = 0
var shield = 0
var attack_values : Array=[10,25,50]
var player : CharacterBody2D



func _ready():
	health_progress_bar = $ProgressBar
	sprite.play("default")
	
	
func _process(delta):
	health_progress_bar.max_value = max_hp 
	health_progress_bar.value = hp 
	
	sprite.play("default")

func fier_set():
	is_on_fier = true
	
func turn_number():
	if is_on_fier == true:
		turn+=1
		take_damage(2)
		print("damage od ognia", 2)
		if turn == 2:
			is_on_fier = false
			turn = 0



func take_damage(damage):
	print("tury", turn)
	hp -= damage
	print("damage normalyn", damage)
	if hp <= 0:
		hp = 0
		is_in_combat = false
		queue_free()  # Usunięcie wroga z gry po jego pokonaniu
		get_tree().get_root().emit_signal("enemy_defeated")
		print("enemy_defeated")
		get_tree().change_scene_to_file("res://Worlds/world.tscn")





