extends CharacterBody2D
@onready var sprite = $AnimatedSprite2D
@onready var sprite2 =$effect
@onready var dmgnr =$next_move/dmgnr
var health_progress_bar
var max_hp = 40
var dmgnumber : int = randf_range(1, 4)
var hp = max_hp
var is_on_fier : bool = false
var have_poison : bool = false
var is_in_combat : bool = false
var is_attack : bool = false
var taking_dmg : bool = false
var turn = 0
var attack_values : Array=[10,25,50]
var player : CharacterBody2D




func _ready():
	health_progress_bar = $ProgressBar
	
	
func _process(delta):
	health_progress_bar.max_value = max_hp 
	health_progress_bar.value = hp 
	var status = Global.this_enemy1_live()
	dmgnr.set_text(str(dmgnumber))
	
	if is_attack:
		sprite.play("attack")
		await get_tree().create_timer(1).timeout
		is_attack = false
	if !is_attack:
		sprite.play("default")
		
	if !taking_dmg:
		sprite2.play("default")
		
	if !status:
		queue_free() 
		
func dmg_rng():
	dmgnumber = randf_range(1, 4)
func dmg_now():
	return dmgnumber

func my_name():
	return name

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
			
func attack_animation():
	
	is_attack = true
	
func attack_take_animation():
	taking_dmg= true
	sprite2.play("dmg")
	await get_tree().create_timer(1).timeout
	taking_dmg= false
	sprite2.play("default")

func attack_take_fier_animation():
	taking_dmg= true
	sprite2.play("fire_dmg")
	await get_tree().create_timer(2).timeout
	taking_dmg= false
	sprite2.play("default")



func take_damage(damage):
	print("tury", turn)
	hp -= damage
	print("damage normalyn", damage)
	if hp <= 0:
		hp = 0
		is_in_combat = false
		Global.enemy1_die()
		queue_free() 
		get_tree().change_scene_to_file("res://Worlds/world.tscn")

	
func poison_status():
	return have_poison
	
func fier_status():
	return is_on_fier

