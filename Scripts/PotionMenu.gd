extends Control

onready var potionList = get_node("Panel/PotionList")
onready var potionIconDisplay = get_node("Panel2/PotionIcon")
onready var potionNameLabel = get_node("Panel2/PotionName")
onready var potionInfoLabel = get_node("Panel2/PotionInfo")
onready var questList = get_node("Panel2/QuestsRequiring")
onready var brewButton = get_node("Panel2/BrewButton")
onready var greyShader = preload("res://Shaders/half_transparent.gdshader")

onready var potions = GlobalPotions.get_potions() 

var currentPotionName
var currentPotionIconRef
var currentPotionIngredients
var currentPotionPrice = 5
var currentPotionTexturePath

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("ui_cancel")):
		visible = false

func _ready():
	brewButton.disabled = true
	for potion in potions:
		potionList.add_item(potion["display_name"], load(potion["texture_path"]))
	_on_PotionList_item_selected(0)

func _on_PotionList_item_selected(index):
	var potion = GlobalPotions.get_potion(potions[index]["display_name"]) 
	currentPotionName = potion["display_name"]
	potionNameLabel.text = potion["display_name"]
	potionInfoLabel.text = potion["description"]
	var texture = load(potion["texture_path"])
	potionIconDisplay.texture = texture
	setQuests(index, texture)
	setIngredientTextures(potion)
	brewButton.icon = texture
	brewButton.disabled = !canBrewPotion()
	
func setQuests(index, texture):
	questList.clear()
	var quests = potions[index]["quests"]
	for quest in range(quests.size()):
		questList.add_item(quests[quest], texture, false)
		
func setIngredientTextures(potion):
	clearIngredientTextures()
	currentPotionIngredients = potion["ingredients"]
	for index in range(currentPotionIngredients.size()):
		if(index < 5):
			var textureRect = get_node("Panel2/GridContainer/Ingredient" + String(index + 1))
			var ingredient = GlobalIngredients.get_ingredient(currentPotionIngredients[index])
			if(PersistedInventory.isItemInInventory("playerInv", currentPotionIngredients[index])):
				textureRect.material = null
			else:
				#don't have item so use shader to grey it out
				textureRect.material = ShaderMaterial.new()
				textureRect.material.shader = greyShader
			textureRect.texture = load(ingredient["texture_path"])	#display name
			

func clearIngredientTextures():
	for index in range(5):
		get_node("Panel2/GridContainer/Ingredient" + String(index + 1)).texture = null
	
func canBrewPotion():
	return PersistedInventory.allItemsInInventory("playerInv", currentPotionIngredients)
	
func _on_BrewButton_pressed():
	#loop through and remove ingredients from the inventory
	if(canBrewPotion()):
		for ingredient_display_name in currentPotionIngredients:
			PersistedInventory.remove_item("playerInv", ingredient_display_name)
		PersistedInventory.add_item("playerInv", currentPotionName)
