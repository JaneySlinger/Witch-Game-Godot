extends Panel

var quest_name = ""
var current_quest = []

onready var rewardsList = get_node("RewardsList")
onready var moneyIcon = get_node("RewardsGrid/MoneyIcon")
onready var socialIcon = get_node("RewardsGrid/SocialIcon")
onready var specialIcon = get_node("RewardsGrid/SpecialIcon")

onready var moneyTexture = load("res://Resources/Textures/Items/coin.png")
onready var socialTexture = load("res://Resources/Textures/Items/heart.png")
onready var specialTexture = load("res://Resources/Textures/Items/treasure.png")

func setup(name):
	quest_name = name
	populate_fields()
	
func populate_fields():
	get_quest_info()
	print(current_quest)
	get_node("QuestName").bbcode_text = "[center]" + quest_name + "[center]"
	get_node("QuestDescription").text = current_quest["description"]
	set_rewards_list()
	set_requirements()

func set_requirements():
	var requirementsList = get_node("RequirementsList")
	requirementsList.clear()
	for requirement in current_quest["requirements"]:
		var potion_icon = GlobalPotions.get_potion_icon(requirement)
		var potion_texture = load("res://Resources/Textures/Items/" + potion_icon + ".png")
		requirementsList.add_item(requirement, potion_texture, false)
	
func set_rewards_list():
	rewardsList.clear()
	if current_quest["rewards"]["money"] > 0:
		rewardsList.add_item(str(current_quest["rewards"]["money"]), moneyTexture, false)
	if current_quest["rewards"]["social"]["increase"] > 0:
		rewardsList.add_item("The " + current_quest["rewards"]["social"]["name"] + " will be grateful.", socialTexture, false)
	if current_quest["rewards"]["special"] != "":
		rewardsList.add_item(current_quest["rewards"]["special"], specialTexture, false)

func get_quest_info():
	current_quest = GlobalQuests.get_quest_by_name(quest_name)

