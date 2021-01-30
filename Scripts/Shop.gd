extends Control


onready var InventoryPlayer = get_node("Panel/InventoryPlayer")
onready var InventoryShop = get_node("Panel/InventoryShop")
onready var buyButton = get_node("Panel/BuyButton")
onready var sellButton = get_node("Panel/SellButton")

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

func _on_BuyButton_pressed():
	var item_name = GlobalIngredients.get_ingredient_name(item_to_buy)
	PersistedInventory.add_item("playerInv",item_to_buy, item_name, GlobalIngredients.get_ingredient_price(item_name))

func _on_SellButton_pressed():
	var item_name = GlobalIngredients.get_ingredient_name(item_to_sell)
	PersistedInventory.add_item("shop01",item_to_sell, item_name, GlobalIngredients.get_ingredient_price(item_name))
	PersistedInventory.remove_item("playerInv", item_to_sell, item_name)

func _on_InventoryPlayer_item_selected(index):
	if InventoryPlayer.get_item_count() != 0:
		item_to_sell = InventoryPlayer.get_item_text(index)
		sellButton.disabled = false			#change to whether you can afford it

func _on_InventoryShop_item_selected(index):
	if InventoryShop.get_item_count() != 0:
		item_to_buy = InventoryShop.get_item_text(index)
		buyButton.disabled = false			#change to whether the shop can afford it
