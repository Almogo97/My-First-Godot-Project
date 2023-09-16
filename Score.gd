extends Label

const save_file_path: String = "user://savegame.save"

var score: int = 0 : 
	get:
		return score
	set(value):
		score = value
		self.text = str(score)

func _ready():
	_load_game()

func _on_click_button_pressed():
	score += 1
	_save_game()

func _save_game():
	var file = FileAccess.open(save_file_path, FileAccess.WRITE)
	file.store_32(score)
	
func _load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
		
	var file = FileAccess.open(save_file_path, FileAccess.READ)
	self.score = file.get_32()
