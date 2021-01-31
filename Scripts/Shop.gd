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

# Called when the node enters the scene tree for the first time.
func _ready():
	# setup the inventory for the shop
	PersistedInventory.add_item("shop01", "Carrot", "carrot", 1)
	
	PersistedInventory.connect("item_added", self, "add_to_inventory")
	PersistedInventory.connect("item_removed", self, "remove_from_inventory")
	
	#load values in from the persistent store
	for item in PersistedInventory.playerInv:
		add_to_inventory("playerInv", item["label"], item["item_name"])
	for item in PersistedInventory.shop01:
		add_to_inventory("shop01Inv", item["label"], item["item_name"])
	
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

func add_to_inventory(inv, label, item_name):
	var path = "res://Resources/Textures/Items/" + item_name + ".png";
	if(inv == "playerInv"):
		print("this is the player inventory")
		InventoryPlayer.add_item(label, load(path), true);
	elif(inv == "shop01"):
		print("adding to shop01 inv")
		InventoryShop.add_item(label, load(path), true);
	
func remove_from_inventory(inv, label):
	var inventory
	if(inv == "playerInv"):
		inventory = InventoryPlayer
	elif(inv == "shop01"):
		inventory = InventoryShop 
	print("remove method")
	for index in range(inventory.get_item_count()):
		if(inventory.get_item_text(index) == label):
			inventory.remove_item(index)
			break
			
func canAfford(wallet, item_label):
	var price = GlobalIngredients.get_ingredient_price(GlobalIngredients.get_ingredient_name(item_label)) 
	print(wallet-price)
	return (wallet - price >= 0)

func _on_BuyButton_pressed():
	var item_name = GlobalIngredients.get_ingredient_name(item_to_buy)
	var price = GlobalIngredients.get_ingredient_price(item_name)
	PersistedInventory.add_item("playerInv",item_to_buy, item_name, GlobalIngredients.get_ingredient_price(item_name))
	
	PersistedInventory.playerMoney -= price
	playerMoneyLabel.text = String(PersistedInventory.playerMoney)
	PersistedInventory.shopMoney += price
	shopMoneyLabel.text = String(PersistedInventory.shopMoney)
	buyButton.disabled = true

func _on_SellButton_pressed():
	var item_name = GlobalIngredients.get_ingredient_name(item_to_sell)
	var price = GlobalIngredients.get_ingredient_price(item_name)
	PersistedInventory.add_item("shop01",item_to_sell, item_name, price)
	PersistedInventory.remove_item("playerInv", item_to_sell, item_name)

	PersistedInventory.playerMoney += price
	playerMoneyLabel.text = String(PersistedInventory.playerMoney)
	PersistedInventory.shopMoney -= price
	shopMoneyLabel.text = String(PersistedInventory.shopMoney)
	sellButton.disabled = true	#stops you selling an item from an empty inventory
	
func _on_InventoryPlayer_item_selected(index):
	sellButton.disabled = true	#stops you selling an item from an empty inventory
	if InventoryPlayer.get_item_count() != 0:
		item_to_sell = InventoryPlayer.get_item_text(index)
		priceLabel.text = String(GlobalIngredients.get_ingredient_price(GlobalIngredients.get_ingredient_name(item_to_sell)))
		if(canAfford(PersistedInventory.shopMoney, item_to_sell)):
			sellButton.disabled = false			

func _on_InventoryShop_item_selected(index):
	buyButton.disabled = true
	if InventoryShop.get_item_count() != 0:
		item_to_buy = InventoryShop.get_item_text(index)
		priceLabel.text = String(GlobalIngredients.get_ingredient_price(GlobalIngredients.get_ingredient_name(item_to_buy)))
		if(canAfford(PersistedInventory.playerMoney, item_to_buy)):
			buyButton.disabled = false			
