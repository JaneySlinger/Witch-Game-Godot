extends ItemList
	
func add_to_inventory(label, item_name):
	var path = "res://Resources/Textures/Items/" + item_name + ".png";
	add_item(label, load(path), true);
	
