extends CharacterBody2D
@onready var sprite1 = $AnimatedSprite2D1
@onready var sprite2 = $AnimatedSprite2D2
@onready var sprite3 = $AnimatedSprite2D3
@onready var sprite5 = $effect
var health_progress_bar
var max_hp = 100
var hp = max_hp
var is_on_fier : bool = false
var is_in_combat : bool = false
var is_attack : bool = false
var taking_dmg : bool = false
var turn = 0
var attack_values : Array=[10,25,50]
var player : CharacterBody2D


func _ready():
	health_progress_bar = $ProgressBar
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
	health_progress_bar.max_value = max_hp 
	health_progress_bar.value = hp 
	var status = Global.this_enemy2_live()
		
	if !taking_dmg:
		sprite5.play("default")
		
	if !status:
		queue_free() 
		

	
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
	sprite5.play("dmg")
	await get_tree().create_timer(1).timeout
	taking_dmg= false
	sprite5.play("default")

func attack_take_fier_animation():
	taking_dmg= true
	sprite5.play("fire_dmg")
	await get_tree().create_timer(2).timeout
	taking_dmg= false
	sprite5.play("default")



func take_damage(damage):
	print("tury", turn)
	hp -= damage
	print("damage normalyn", damage)
	if hp <= 0:
		hp = 0
		is_in_combat = false
		Global.enemy2_die()
		queue_free() 
		get_tree().change_scene_to_file("res://Worlds/world.tscn")

