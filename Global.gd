extends Node
var Soer : int = 800
var Player_hp = 50
var Enemy1_live : bool = true
var Enemy2_live : bool = true
var Enemy3_live : bool = true



func pull_score():
	return Soer
func take_score(value):
	Soer = value 
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hp_now():
	return Player_hp

func change_hp(hp):
	Player_hp = hp

func End_battle_hp(hp):
	Player_hp = hp

func Change_battle_hp():
	return Player_hp

func enemy1_die():
	Enemy1_live = false

func this_enemy1_live():
	return Enemy1_live

func enemy2_die():
	Enemy2_live = false

func this_enemy2_live():
	return Enemy2_live

func enemy3_die():
	Enemy3_live = false

func this_enemy3_live():
	return Enemy3_live
