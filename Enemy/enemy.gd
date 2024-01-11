extends CharacterBody2D
@onready var sprite = $AnimatedSprite2D
enum EnemyType { Type1, Type2, Type3 }

signal enemy_defeated

var max_hp = 100
var hp = max_hp
var is_in_combat : bool = false
var shield = 0
var attack_values : Array=[10,25,50]
var player : CharacterBody2D




func _ready():
	print(hp)
	sprite.play("default")
	
	
func _process(delta):
	sprite.play("default")


func take_damage(damage):
	# Funkcja obsługująca zadawane obrażenia wrogowi
	hp -= damage
	if hp <= 0:
		hp = 0
		is_in_combat = false
		queue_free()  # Usunięcie wroga z gry po jego pokonaniu
		get_tree().get_root().emit_signal("enemy_defeated")
		print("enemy_defeated")
		get_tree().change_scene_to_file("res://Worlds/world.tscn")


