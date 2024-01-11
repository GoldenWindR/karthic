extends Node2D
@onready var sprite = $Sprite2D
@onready var swinger = $Sprite2D/Swinnger

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
	if Enemy:
		Enemy.take_damage(10)
	hide_object()

func randomize_sprite():
	var random_index = randi() % sprites.size()
	sprite.texture = sprites[random_index]
