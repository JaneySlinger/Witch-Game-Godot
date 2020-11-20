extends Node

var items = []
signal item_added(label, item_name)
signal item_removed(label, item_name)

func add_item(label, item_name):
	items.append({
		"label": label,
		"item_name": item_name
		})
	emit_signal("item_added", label, item_name)
	print(items)
	
func remove_item(label, item_name):
	for index in range(items.size()):
		if(items[index]["label"] == label):
			items.remove(index)
			break
	emit_signal("item_removed", label, item_name)
	print(items)
