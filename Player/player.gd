extends CharacterBody2D

var max_hp = 30
var hp
var shild = 0
var health_progress_bar
var mana = 3

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var canWalk = false
var direction

func _ready():
	hp = max_hp
	health_progress_bar = $ProgressBar
	var currentScene = get_tree().get_current_scene()
	if currentScene.get_name() =="world":
		canWalk = true
	
func _process(delta):

	health_progress_bar.max_value = max_hp 
	health_progress_bar.value = hp 

func take_damage(damage: int):
	damage = damage - shild
	if damage > 0:
		hp -= damage
		print("damage w bochatera", damage)
		if hp <=0:
			hp =0
			if hp <= 0:
				hp=0
				get_tree().change_scene_to_file("res://GameOver/GameOver.tscn")
				hide()
			


func mana_cost(amount):
	mana -= amount

func mana_reset():
	mana = 3 

func have_mana():
	return mana

func take_shild(amount):
	shild = amount 


func _physics_process(delta):
	
	if canWalk:
		if not is_on_floor():
			velocity.y += gravity * delta
			
		direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()


func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://FightScreen/FightScene.tscn")
	canWalk = false

