extends Button

func _on_SaveButton_pressed():
	var save_file = "user://player.save"
	var file = File.new()
	file.open(save_file, File.WRITE)
	file.store_var(PersistedInventory.playerInv)
	file.store_var(PersistedInventory.shop01)
	file.store_var(PersistedInventory.playerQuests)
	file.store_var(PersistedInventory.playerMoney)
	file.store_var(PersistedInventory.shopMoney)
	file.store_var(PersistedInventory.day)
	file.store_var(PersistedInventory.player_name)
	
	file.close()
	print("Saved game!")
