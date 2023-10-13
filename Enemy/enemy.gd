extends CharacterBody2D

enum EnemyType { Type1, Type2, Type3 }

var max_hp = 100
var hp = max_hp
var is_in_combat : bool = false
var shield = 0
var attack_values : Array=[10,25,50]
var player : CharacterBody2D

func _ready():
	max_hp = attack_values[EnemyType]
	hp = max_hp
	player = $player  # Node player

func _on_detection_area_body_entered(body):
	if body is CharacterBody2D and not is_in_combat:
		is_in_combat = true
		print("Combat started with enemy of type", EnemyType)
		start_combat()
##################################################Przenieść do logiki gracza#######################
func _input(event): 
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_global_mouse_position()
		var entities = get_tree().get_nodes_in_group("enemies")
		for entity in entities:
			if entity.global_position.distance_to(mouse_pos) < entity.texture.get_width() / 2:
				is_in_combat = true
				print("Combat started with enemy of type", EnemyType)
				start_combat()
####################################################################################################
func start_combat():
	# Funkcja zarządzająca walką turową
	while is_in_combat and hp > 0:
		await get_tree().create_timer(15.0).timeout  # Przerwa między turami wroga
		perform_attack()
	if hp <= 0:
		print("Enemy of type", EnemyType, "defeated!")

func perform_attack():
	# Funkcja wykonująca atak wroga
	if is_in_combat:
		var attack_value = attack_values[EnemyType]
		player.take_damage(attack_value)
		print("Enemy of type", EnemyType, "dealt", attack_value, "damage to the player!")

func take_damage(damage):
	# Funkcja obsługująca zadawane obrażenia wrogowi
	hp -= damage
	if hp <= 0:
		hp = 0
		is_in_combat = false
		queue_free()  # Usunięcie wroga z gry po jego pokonaniu
		print("Enemy of type", EnemyType, "defeated!")
