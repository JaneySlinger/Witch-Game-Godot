extends Node

var playerInv = []
var shop01 = []
var playerQuests = []
signal item_added(inv, label, item_name, price)
signal item_removed(inv, label)
signal quest_added(quest_name)
signal quest_removed(quest_name)
var playerMoney = 0
var shopMoney = 100
var hour = 6
var minutes = 30
var day = 1

func add_quest(quest_name):
	playerQuests.append(quest_name)
	print (playerQuests)
	emit_signal("quest_added", quest_name)

func map_to_inventory(inv):
	if inv == "playerInv": return playerInv
	if inv == "shop01": return shop01

func add_item(inv, label, item_name, price):
	var mapped_inv = map_to_inventory(inv)
	mapped_inv.append({
		"label": label,
		"item_name": item_name,
		"price": price
		})
	emit_signal("item_added", inv, label, item_name)
	print(mapped_inv)
	
func remove_item(inv, label, item_name):
	var mapped_inv = map_to_inventory(inv)
	for index in range(mapped_inv.size()):
		if(mapped_inv[index]["item_name"] == item_name):
			mapped_inv.remove(index)
			break
	emit_signal("item_removed", inv, label)
	print(mapped_inv)
	
func isItemInInventory(inv, item_name):
	var mapped_inv = map_to_inventory(inv)
	for item in mapped_inv:
		if mapped_inv["item_name"] == item_name:
			return true
	return false

func allItemsInInventory(inv, required_items):
	var mapped_inv = map_to_inventory(inv)
	var copied_inventory = mapped_inv.duplicate(true)
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
		
func addMoney(wallet, price):
	wallet += price
	print (shopMoney)
	print (playerMoney)

func subMoney(wallet, price):
	wallet -= price
	print(shopMoney)
	print(playerMoney)
