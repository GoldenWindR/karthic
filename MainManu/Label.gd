extends Label
var dane : Array
var dane_index: int = 0
var stat_bool : bool = false

# Called when the node enters the scene tree for the first time.

func _ready():
	show_me_best_players()

func show_me_best_players():
	var dane = Db.show_me_best_player()
	var text_to_display: String = ""
	for i in range(dane.size()):
		text_to_display += str(dane[i]) + "\n"
	return text_to_display

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var text2 = show_me_best_players()
	set_text(text2)
	pass
	
