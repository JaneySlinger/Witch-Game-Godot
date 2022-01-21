extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	#file.open(save_file, File.WRITE)
	#file.store_var(PersistedInventory.playerInv)
	#file.store_var(PersistedInventory.shop01)
	#file.store_var(PersistedInventory.playerQuests)
	#file.store_var(PersistedInventory.playerMoney)
	#file.store_var(PersistedInventory.shopMoney)
	#file.store_var(PersistedInventory.day)

func _on_LoadButton_pressed():
	var save_file = "user://player.save"
	
	var file = File.new()
	if file.file_exists(save_file):
		file.open(save_file, File.READ)
		PersistedInventory.playerInv = file.get_var()
		PersistedInventory.shop01 = file.get_var()
		PersistedInventory.playerQuests = file.get_var()
		PersistedInventory.playerMoney = file.get_var()
		PersistedInventory.shopMoney = file.get_var()
		PersistedInventory.day = file.get_var()
		file.close()
		get_tree().change_scene("res://Scenes/Area.tscn")
