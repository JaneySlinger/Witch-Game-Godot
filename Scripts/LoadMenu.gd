extends Control

onready var saveList = get_node("SavesList")
onready var loadButton = get_node("LoadButton")
var file_to_load = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	loadButton.disabled = true
	scan_files()

func scan_files():
	var dir = Directory.new()
	if dir.open("user://") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir():
				saveList.add_item(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when accessing user data.")

func _on_SavesList_item_selected(index):
	file_to_load = saveList.get_item_text(index)
	print(file_to_load)
	loadButton.disabled = false
	

func _on_LoadButton_pressed():
	var file = File.new()
	if file.file_exists("user://" + file_to_load):
		file.open("user://" + file_to_load, File.READ)
		print("opened file")
		PersistedInventory.playerInv = file.get_var()
		PersistedInventory.shop01 = file.get_var()
		PersistedInventory.playerQuests = file.get_var()
		PersistedInventory.playerMoney = file.get_var()
		PersistedInventory.shopMoney = file.get_var()
		PersistedInventory.day = file.get_var()
		PersistedInventory.player_name = file.get_var()
		file.close()
		get_tree().change_scene("res://Scenes/Interior.tscn")
	else:
		print("The file: " + file_to_load + " doesn't exist")
