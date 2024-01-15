extends CharacterBody2D
@onready var Player_sprite = $AnimatedSprite2D
@onready var shild_status = $shild
@onready var shildnr = $shild/shildnr

var max_hp = 50
var hp
var shild = 0
var health_progress_bar
var mana = 2
var moving : bool = false
var is_on_fier : bool = false
var have_poison : bool = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var canWalk = false
var direction

func _ready():
	hp = Global.hp_now()
	health_progress_bar = $ProgressBar
	var currentScene = get_tree().get_current_scene()
	if currentScene.get_name() =="world":
		canWalk = true
	
func _process(delta):
	health_progress_bar.max_value = max_hp 
	health_progress_bar.value = hp 
	if shild > 0:
		shildnr.set_text(str(shild))
		shild_status.visible = true
	else:
		shild_status.visible = false
	if !moving:
		Player_sprite.play("default")
	if moving:
		Player_sprite.play("run")
	

func take_damage(damage: int):
	damage = damage - shild
	shild = 0
	if damage > 0:
		hp -= damage
		Global.change_hp(hp)
		print("damage w bochatera", damage)
		if hp <=0:
			hp =0
			if hp <= 0:
				hp=0
				Global.change_hp(max_hp)
				get_tree().change_scene_to_file("res://GameOver/GameOver.tscn")
				hide()
		


func mana_cost(amount):
	mana -= amount

func mana_reset():
	mana = 2 

func have_mana():
	return mana

func take_shild(amount):
	shild += amount 


func _physics_process(delta):
	
	if canWalk:
		if not is_on_floor():
			velocity.y += gravity * delta
			
		direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			
			velocity.x = direction * SPEED
			Player_sprite.play("run")
			if direction < 0:
				Player_sprite.flip_h = true
			elif direction > 0:
				Player_sprite.flip_h = false
			moving = true
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			moving = false
		move_and_slide()


func _on_area_2d_body_entered(body):
	print(body.name)
	if body.name == "Enemy":
		get_tree().change_scene_to_file("res://FightScreen/FightScene.tscn")
	if body.name == "Krwiopijca":
		get_tree().change_scene_to_file("res://FightScreen2/FightScreen2.tscn")
	canWalk = false
	moving = false
	
func poison_status():
	return have_poison
	
func fier_status():
	return is_on_fier

