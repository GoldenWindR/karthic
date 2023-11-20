extends Area2D

var is_card_inside = false
var entered_card = null

# Funkcja wywoływana, gdy karta zostanie upuszczona na dropzone
func _on_Card_area_entered(area):
	if area is Sprite2D and not is_card_inside:
		entered_card = area
		is_card_inside = true
		# Tutaj możesz dodać logikę obsługi upuszczenia karty
		print("Karta upuszczona na dropzone:", entered_card.name)

# Funkcja wywoływana, gdy karta opuści dropzone
func _on_Card_area_exited(area):
	if area is Sprite2D and is_card_inside:
		is_card_inside = false
		# Tutaj możesz dodać logikę obsługi, gdy karta opuszcza dropzone
		print("Karta opuściła dropzone:", entered_card.name)
		entered_card = null
