extends CharacterBody2D

var max_hp = 100
var hp = max_hp
var shild = 0
var health_progress_bar
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	health_progress_bar = $ProgressBar
	
func _process(delta):

	health_progress_bar.max_value = max_hp 
	health_progress_bar.value = hp 

func take_damage(damage):
	hp -= damage
	if hp <=0:
		hp =0

func heal(amount):
	hp += amount
	if hp > max_hp:
		hp = max_hp
		

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	


func _on_area_2d_body_entered(body):
	hp-=5
	print("weszłeś")
