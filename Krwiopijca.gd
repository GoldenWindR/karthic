extends CharacterBody2D
@onready var sprite1 = $AnimatedSprite2D1
@onready var sprite2 = $AnimatedSprite2D2
@onready var sprite3 = $AnimatedSprite2D3
enum EnemyType { Type1, Type2, Type3 }
var max_hp = 100
var hp = max_hp
var is_in_combat : bool = false
var shield = 0
var attack_values : Array=[10,25,50]
var player : CharacterBody2D



func _ready():
	hp = max_hp
	sprite1.play("default")
	sprite2.play("default")
	sprite3.play("default")
	position.y +=1
	position.y -=1
	
func _process(delta):
	sprite1.play("default")
	sprite2.play("default")
	sprite3.play("default")

func _on_detection_area_body_entered(body):
	if body is CharacterBody2D and not is_in_combat:
		is_in_combat = true
		print("Combat started with enemy of type", EnemyType)
		start_combat()

func _input(event): 
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_global_mouse_position()
		var entities = get_tree().get_nodes_in_group("enemies")
		for entity in entities:
			if entity.global_position.distance_to(mouse_pos) < entity.texture.get_width() / 2:
				is_in_combat = true
				print("Combat started with enemy of type", EnemyType)
				start_combat()

func start_combat():

	while is_in_combat and hp > 0:
		await get_tree().create_timer(15.0).timeout  # Przerwa między turami wroga
	if hp <= 0:
		print("Enemy of type", EnemyType, "defeated!")


func take_damage(damage):
	hp -= damage
	if hp <= 0:
		hp = 0
		is_in_combat = false
		queue_free()  # Usunięcie wroga z gry po jego pokonaniu
		print("Enemy of type", EnemyType, "defeated!")


