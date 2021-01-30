extends Control

onready var potionList = get_node("Panel/PotionList")
onready var potionIconDisplay = get_node("Panel2/PotionIcon")
onready var potionNameLabel = get_node("Panel2/PotionName")
onready var potionInfoLabel = get_node("Panel2/PotionInfo")
onready var questList = get_node("Panel2/QuestsRequiring")
onready var brewButton = get_node("Panel2/BrewButton")

onready var potions = GlobalPotions.get_potions() 

var currentPotionName
var currentPotionIconRef
var currentPotionIngredients
var currentPotionPrice = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("ui_cancel")):
		visible = false

func _ready():
	brewButton.disabled = true
	for potion in range(potions.size()):
		potionList.add_item(potions[potion]["name"], load("res://Resources/Textures/Items/" + potions[potion]["icon"] + ".png"))
	_on_PotionList_item_selected(0)

func _on_PotionList_item_selected(index):
	#save the name and icon value so it can be added to inventory later
	currentPotionName = potions[index]["name"]
	currentPotionIconRef = potions[index]["icon"]
	potionNameLabel.text = currentPotionName
	potionInfoLabel.text = potions[index]["description"]
	var texture = load("res://Resources/Textures/Items/" + currentPotionIconRef + ".png")
	potionIconDisplay.texture = texture
	setQuests(index, texture)
	setIngredientTextures(index)
	brewButton.icon = texture
	brewButton.disabled = !canBrewPotion()
	
func setQuests(index, texture):
	questList.clear()
	var quests = potions[index]["quests"]
	for quest in range(quests.size()):
		questList.add_item(quests[quest], texture, false)
		
func setIngredientTextures(index):
	clearIngredientTextures()
	currentPotionIngredients = potions[index]["ingredients"]
	for potion_ingredient in range(currentPotionIngredients.size()):
		if(potion_ingredient < 5):
			var textureRect = get_node("Panel2/GridContainer/Ingredient" + String(potion_ingredient + 1))
			textureRect.texture = load("res://Resources/Textures/Items/" + currentPotionIngredients[potion_ingredient] + ".png")

func clearIngredientTextures():
	for index in range(5):
		get_node("Panel2/GridContainer/Ingredient" + String(index + 1)).texture = null
	
func canBrewPotion():
	return PersistedInventory.allItemsInInventory("playerInv", currentPotionIngredients)
	

func _on_BrewButton_pressed():
	#loop through and remove ingredients from the inventory
	if(canBrewPotion()):
		for ingredient_name in currentPotionIngredients:
			#get the item index in the globalIngredients file to get the label
			PersistedInventory.remove_item("playerInv", GlobalIngredients.get_ingredient_label(ingredient_name), ingredient_name)
		PersistedInventory.add_item("playerInv", currentPotionName, currentPotionIconRef, currentPotionPrice)
	
	
	
	
	
	
	
	
	
