extends Button
var icon1 = preload("res://assets/card/1.png");


# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureButton.texture_normal = load("res://assets/card/1.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
