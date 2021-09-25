extends ItemList
	
func add_to_inventory(inv, label, item_name):
	if(inv == "playerInv"):
		print("this is the player inventory")
		var path = "res://Resources/Textures/Items/" + item_name + ".png";
		add_item(label, load(path), true);
	
	
func _ready():
	PersistedInventory.connect("item_added", self, "add_to_inventory")
	PersistedInventory.connect("item_removed", self, "remove_from_inventory")
	
	#load values in from the persistent store
	for item in PersistedInventory.playerInv:
		add_to_inventory("playerInv", item["label"], item["item_name"])

func remove_from_inventory(inv, label):
	print("removing " + label + " from inventory menu")
	if(inv == "playerInv"):
		print("remove method")
		for index in range(get_item_count()):
			if(get_item_text(index) == label):
				remove_item(index)
				break
	
	
