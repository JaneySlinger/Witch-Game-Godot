extends Control

onready var nameInput = get_node("NameInput")

func _on_Submit_pressed():
	if(nameInput.text != ""):
		PersistedInventory.player_name = nameInput.text
		print(PersistedInventory.player_name)
		get_tree().change_scene("res://Scenes/Interior.tscn")
	else:
		print("You can't have an empty name")
