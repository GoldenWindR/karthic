extends HBoxContainer
@onready var poison = $poison
@onready var fier = $fier
var is_on_fier : bool = false
var have_poison : bool = false



func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Enemy = get_parent()
	if Enemy:
		var poison_status : bool = Enemy.poison_status()
		var fier_status : bool = Enemy.fier_status()
		poison.visible  = poison_status
		fier.visible  = fier_status
		
