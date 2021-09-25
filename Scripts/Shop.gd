extends Control


onready var InventoryPlayer = get_node("Panel/InventoryPlayer")
onready var InventoryShop = get_node("Panel/InventoryShop")
onready var buyButton = get_node("Panel/BuyButton")
onready var sellButton = get_node("Panel/SellButton")
onready var priceLabel = get_node("Panel/Amount")
onready var playerMoneyLabel = get_node("Panel/PlayerMoney")
onready var shopMoneyLabel = get_node("Panel/ShopMoney")

var item_to_sell
var item_to_buy
var price
var item_texture

# Called when the node enters the scene tree for the first time.
func _ready():
	# setup the inventory for the shop
	PersistedInventory.add_item("shop01", "Carrot", "carrot", 1, "res://Resources/Textures/Items/carrot.png")
	
	PersistedInventory.connect("item_added", self, "add_to_inventory")
	PersistedInventory.connect("item_removed", self, "remove_from_inventory")
	
	#load values in from the persistent store
	for item in PersistedInventory.playerInv:
		#var path = "res://Resources/Textures/Items/" + item["item_name"] + ".png"
		#print("player path in ready is " + path)
		add_to_inventory("playerInv", item["label"], item["texture_path"])
	for item in PersistedInventory.shop01:
		var path = "res://Resources/Textures/Items/" + item["item_name"] + ".png"
		print("shop path in ready is " + path)
		print(item)
		add_to_inventory("shop01Inv", item["label"], item["texture_path"])
	
	playerMoneyLabel.text = String(PersistedInventory.playerMoney)
	shopMoneyLabel.text = String(PersistedInventory.shopMoney)
	priceLabel.text = String(0)
	
	buyButton.disabled = true
	sellButton.disabled = true
	_on_InventoryPlayer_item_selected(0)
	_on_InventoryShop_item_selected(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("ui_cancel")):
		visible = false

func add_to_inventory(inv, display_name, item_texture):
	#var path = "res://Resources/Textures/Items/" + item_texture;
	print("item texture in add_to_inventory is " + item_texture)
	if(inv == "playerInv"):
		print("this is the player inventory")
		InventoryPlayer.add_item(display_name, load(item_texture), true);
	elif(inv == "shop01"):
		print("adding to shop01 inv")
		InventoryShop.add_item(display_name, load(item_texture), true);
	
func remove_from_inventory(inv, display_name):
	var inventory
	if(inv == "playerInv"):
		inventory = InventoryPlayer
	elif(inv == "shop01"):
		inventory = InventoryShop 
	print("remove method")
	for index in range(inventory.get_item_count()):
		if(inventory.get_item_text(index) == display_name):
			print("removing " + display_name + "from player inv list in shop.")
			inventory.remove_item(index)
			break
			
func canAfford(wallet, price):
	print(wallet-price)
	return (wallet - price >= 0)

func _on_BuyButton_pressed():
	if GlobalIngredients.get_ingredient_name(item_to_buy) == null:
		var item_name = item_to_buy
		PersistedInventory.add_item("playerInv",item_to_buy, item_texture, price, "res://Resources/Textures/Items/" + item_name + ".png")
	else:
		var item_name = GlobalIngredients.get_ingredient_name(item_to_buy)
		PersistedInventory.add_item("playerInv",item_to_buy, item_name, price, "res://Resources/Textures/Items/" + item_name + ".png")
	#var price = GlobalIngredients.get_ingredient_price(item_name)
	#PersistedInventory.add_item("playerInv",item_to_buy, item_name, price)
	
	PersistedInventory.playerMoney -= price
	playerMoneyLabel.text = String(PersistedInventory.playerMoney)
	PersistedInventory.shopMoney += price
	shopMoneyLabel.text = String(PersistedInventory.shopMoney)
	buyButton.disabled = true

func _on_SellButton_pressed():
	print("Item to sell is: " + item_to_sell)
	if GlobalIngredients.get_ingredient_name(item_to_sell) == null:
		#this is for potions
		var item_name = item_to_sell
		#PersistedInventory.add_item("playerInv",item_to_sell, item_name, price)
		PersistedInventory.add_item("shop01",item_to_sell, item_texture, price, "res://Resources/Textures/Items/" + item_name + ".png")
		PersistedInventory.remove_item("playerInv", item_to_sell, item_name)
	else:
		#this is for ingredients
		var item_name = GlobalIngredients.get_ingredient_name(item_to_sell)
		#PersistedInventory.add_item("playerInv",item_to_sell, item_name, price)
		PersistedInventory.add_item("shop01",item_to_sell, item_name, price, "res://Resources/Textures/Items/" + item_name + ".png")
		PersistedInventory.remove_item("playerInv", item_to_sell, item_name)
		
	#var item_name = GlobalIngredients.get_ingredient_name(item_to_sell)
	#var price = GlobalIngredients.get_ingredient_price(item_name)
	
	PersistedInventory.playerMoney += price
	playerMoneyLabel.text = String(PersistedInventory.playerMoney)
	PersistedInventory.shopMoney -= price
	shopMoneyLabel.text = String(PersistedInventory.shopMoney)
	sellButton.disabled = true	#stops you selling an item from an empty inventory
	
func _on_InventoryPlayer_item_selected(index):
	sellButton.disabled = true	#stops you selling an item from an empty inventory
	if InventoryPlayer.get_item_count() != 0:
		item_to_sell = InventoryPlayer.get_item_text(index)
		item_texture = InventoryPlayer.get_item_icon(index).resource_path
		print("item texture is " + item_texture)
		price = get_price(item_to_sell)
		priceLabel.text = String(price)
		#priceLabel.text = String(GlobalIngredients.get_ingredient_price(GlobalIngredients.get_ingredient_name(item_to_sell)))
		if(canAfford(PersistedInventory.shopMoney, price)):
			sellButton.disabled = false			

func _on_InventoryShop_item_selected(index):
	buyButton.disabled = true
	if(index > 0):
		if InventoryShop.get_item_count() != 0:
			item_to_buy = InventoryShop.get_item_text(index)
			item_texture = InventoryPlayer.get_item_icon(index).resource_path
			price = get_price(item_to_buy)
			priceLabel.text = String(price)
			if(canAfford(PersistedInventory.playerMoney, price)):
				buyButton.disabled = false

func get_price(item_to_check):
	#need to check if potion or ingredient
	if "potion" in item_texture:
		print("This is a potion")
		return GlobalPotions.get_potion_price(item_to_check)
	else:
		print("This is not a potion")
		return GlobalIngredients.get_ingredient_price(GlobalIngredients.get_ingredient_name(item_to_check))
