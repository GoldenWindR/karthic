extends Timer

func _ready():
	connect("timeout", self, "_on_timeout")

func _on_timeout():
	# Tu możesz umieścić kod do wyświetlenia ekranu z zakończeniem gry
