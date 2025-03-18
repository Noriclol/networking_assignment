extends Node

const SAVEGAME = "user://Savegame.json"

var save_data = {}

func _ready() -> void:
	save_data = get_data()
	
func get_data():
	if !FileAccess.file_exists(SAVEGAME):
		save_data = {"player_name" : "unnamed"}
		save_game()
	var file = FileAccess.open(SAVEGAME,FileAccess.READ)
	var content = file.get_as_text()
	var data = JSON.parse_string(content)
	save_data = data
	file.close()
	return(data)


func save_game():
	var _save_game = FileAccess.open(SAVEGAME, FileAccess.WRITE)
	_save_game.store_line(JSON.stringify(save_data))
	_save_game.close()
	pass
	#var save_game = FileAccess.new()
