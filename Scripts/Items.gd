extends ItemList

func _ready():
	PersistedInventory.connect("item_added", self, "add_to_inventory")
	PersistedInventory.connect("item_removed", self, "remove_from_inventory")
	#load values in from the persistent store
	for item in PersistedInventory.playerInv:
		add_to_inventory("playerInv", item)

func add_to_inventory(inv, item):
	if(inv == "playerInv"):
		print("this is the player inventory")
		add_item(item["display_name"], load(item["texture_path"]), true);
	
func remove_from_inventory(inv, display_name):
	print("removing " + display_name + " from inventory menu")
	if(inv == "playerInv"):
		print("remove method")
		for index in range(get_item_count()):
			if(get_item_text(index) == display_name):
				remove_item(index)
				break
	
	
