extends Label

var randomVariables = []
var randomValue
# Called when the node enters the scene tree for the first time.
func _ready():
	var labelText = ""
	for i in range(randomVariables.size()):
		labelText += str(randomVariables[i]) + ", "
	set_text(labelText)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
