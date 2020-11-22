extends Control

onready var potionList = get_node("Panel/PotionList")
onready var potionIconDisplay = get_node("Panel2/PotionIcon")
onready var potionNameLabel = get_node("Panel2/PotionName")
onready var potionInfoLabel = get_node("Panel2/PotionInfo")
onready var questList = get_node("Panel2/QuestsRequiring")
onready var brewButton = get_node("Panel2/BrewButton")

onready var potions = GlobalPotions.get_potions() 

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
	potionNameLabel.text = potions[index]["name"]
	potionInfoLabel.text = potions[index]["description"]
	var texture = load("res://Resources/Textures/Items/" + potions[index]["icon"] + ".png")
	potionIconDisplay.texture = texture
	setQuests(index, texture)
	setIngredientTextures(index)
	brewButton.icon = texture
	brewButton.disabled = !canBrewPotion(index)
	
func setQuests(index, texture):
	questList.clear()
	var quests = potions[index]["quests"]
	for quest in range(quests.size()):
		questList.add_item(quests[quest], texture, false)
		
func setIngredientTextures(index):
	var potion_ingredients = potions[index]["ingredients"]
	for potion_ingredient in range(potion_ingredients.size()):
		if(potion_ingredient < 5):
			var textureRect = get_node("Panel2/GridContainer/Ingredient" + String(potion_ingredient + 1))
			textureRect.texture = load("res://Resources/Textures/Items/" + potion_ingredients[potion_ingredient] + ".png")
	
func canBrewPotion(index):
	#stubbed out 
	return true
	
	
	
	
	
	
	
	
	

	
	
