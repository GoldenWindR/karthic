extends Node2D
@onready var sprite = $Sprite2D
@onready var swinger = $Sprite2D/Swinnger
var random_index = 0;

signal mouse_released
signal picked_up_changed(picked)
var sprites:Array = [
	preload("res://assets/card/1.png"),
	preload("res://assets/card/2.png"),
	preload("res://assets/card/3.png"),
	preload("res://assets/card/4.png"),
	preload("res://assets/card/5.png"),
]

var scene_width = get_viewport_rect().size.x
var scene_height = get_viewport_rect().size.y

var picked_up:bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize_sprite()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Player=get_parent().get_node("Player")
	var mana = Player.have_mana()
	print(mana)
	match random_index:
		0:
			if mana < 1:
				hide_object()
		1:
			if mana < 1:
				hide_object()
			
		2:
			if mana < 1:
				hide_object()
			
		3:
			if mana < 2:
				hide_object()
			
		4:
			if mana < 1:
				hide_object()
			
	if picked_up:
		global_position = get_global_mouse_position()
		
	if Input.is_action_just_released("M1"):
		mouse_released.emit()

func reset_object(n):
	visible = true
	randomize_sprite()
	global_position = Vector2((scene_width / 2)-(100+n), scene_height)



func hide_object():
	visible = false

func _on_mause_region_pressed():
	picked_up = true
	await mouse_released
	picked_up = false
	var Enemy=get_parent().get_node("Enemy")
	var Player=get_parent().get_node("Player")
	match random_index:
		0:
			Enemy.take_damage(1)
			Player.mana_cost(1)
		1:
			Enemy.take_damage(3)
			Player.mana_cost(1)
		2:
			Enemy.take_damage(2)
			Player.mana_cost(1)
		3:
			Enemy.take_damage(2)
			Player.mana_cost(2)
			Enemy.fier_set()
		4:
			Player.take_shild(3)
			Player.mana_cost(1)
			
	hide_object()

func randomize_sprite():
	random_index = randi() % sprites.size()
	sprite.texture = sprites[random_index]
	print(random_index)
