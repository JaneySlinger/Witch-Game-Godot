extends Node

var items = []
signal item_added(label, item_name)
signal item_removed(label)

func add_item(label, item_name):
	items.append({
		"label": label,
		"item_name": item_name
		})
	emit_signal("item_added", label, item_name)
	print(items)
	
func remove_item(label, item_name):
	for index in range(items.size()):
		if(items[index]["item_name"] == item_name):
			items.remove(index)
			break
	emit_signal("item_removed", label)
	print(items)
	
func isItemInInventory(item_name):
	for item in items:
		if item["item_name"] == item_name:
			return true
	return false

func allItemsInInventory(required_items):
	var copied_inventory = items.duplicate(true)
	var itemsPresent = 0
	for item_name in required_items:
		#is the item in the copied inventory
		for inventory_item in copied_inventory:
			if inventory_item["item_name"] == item_name:
				itemsPresent += 1
				copied_inventory.remove(copied_inventory.find(inventory_item))
	if itemsPresent == required_items.size():
		return true
	else:
		return false
		
