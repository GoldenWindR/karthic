extends Sprite2D

var textures = [preload("res://assets/card/1.png"), preload("res://assets/card/4.png")]

func _ready():
	# Losowe wybranie indeksu tekstury
	var random_texture_index = randi() % textures.size()
	
	# Ustawienie wybranej tekstury
	texture = textures[random_texture_index]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Tu możesz umieścić kod, który zostanie wykonany co klatkę, jeśli to konieczne.
