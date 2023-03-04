extends Node

#loaded from save file
var playerInv = []
var shop01 = []
#var playerQuests = []
var playerMoney = 0
var shopMoney = 100
var day = 1
var player_name = ""

#persisted between areas in session
var hour = 6
var minutes = 30

signal item_added(inv, item)
signal item_removed(inv, display_name)
#signal quest_added(quest_name)
#signal quest_completed(quest_name)

#func add_quest(quest_name):
	#playerQuests.append(GlobalQuests.get_quest_by_name(quest_name))
	#playerQuests.append(quest_name)
	#print (playerQuests)
	#emit_signal("quest_added", quest_name)
	
#func complete_quest(quest_name):
	#print("player quests are ")
	#print(playerQuests)
	#mark the quest with the completed icon in the quest menu
	#emit_signal("quest_completed", quest_name)

func map_to_inventory(inv):
	if inv == "playerInv": return playerInv
	if inv == "shop01": return shop01

func add_item(inv, display_name):
	var item = get_item_details(display_name)
	var mapped_inv = map_to_inventory(inv)
	mapped_inv.append(item)
	emit_signal("item_added", inv, item)
	print(mapped_inv)
	
func remove_item(inv, display_name):
	var mapped_inv = map_to_inventory(inv)
	for index in range(mapped_inv.size()):
		if(mapped_inv[index]["display_name"] == display_name):
			mapped_inv.remove(index)
			break
	emit_signal("item_removed", inv, display_name)
	print(mapped_inv)
	
func remove_quest_item(inv, display_name):
	var mapped_inv = map_to_inventory(inv)
	for index in range(mapped_inv.size()):
		if(mapped_inv[index]["display_name"] == display_name):
			mapped_inv.remove(index)
			break
	emit_signal("item_removed", inv, display_name)
	print(mapped_inv)

func allItemsInInventory(inv, required_items):
	var mapped_inv = map_to_inventory(inv)
	var copied_inventory = mapped_inv.duplicate(true)
	var itemsPresent = 0
	for display_name in required_items:
		#is the item in the copied inventory
		for inventory_item in copied_inventory:
			if inventory_item["display_name"] == display_name:
				print("item: " + display_name + " is present")
				itemsPresent += 1
				copied_inventory.remove(copied_inventory.find(inventory_item))
	if itemsPresent == required_items.size():
		return true
	else:
		return false

func isItemInInventory(inv, required_item):
	var mapped_inv = map_to_inventory(inv)
	var copied_inventory = mapped_inv.duplicate(true)
	for inventory_item in copied_inventory:
		if inventory_item["display_name"] == required_item:
			print("item: " + required_item + " is present")
			return true
	return false

func get_item_details(display_name):
	var item = GlobalIngredients.get_ingredient(display_name)
	if(item != null):
		print(item)
		return item
	item = GlobalPotions.get_potion(display_name)
	if(item != null):
		print(item)
		return item
	print("No item found with that display name")
