extends Control

var quest_name = ""
var current_quest = []

func setup(name):
	quest_name = name
	populate_fields()
	
func populate_fields():
	get_quest_info()
	print(current_quest)
	get_node("Panel/NameLabel").bbcode_text = "[center]" + quest_name + "[center]"
	set_rewards()
	set_requirements()

func set_rewards():
	if current_quest["rewards"]["money"] == 0:
		get_node("Panel/RewardsGrid/MoneyIcon").texture = load("res://Resources/Textures/Items/coin_greyed.png")
	if current_quest["rewards"]["social"]["increase"] == 0:
		get_node("Panel/RewardsGrid/SocialIcon").texture = load("res://Resources/Textures/Items/heart_greyed.png")
	if current_quest["rewards"]["special"] == "":
		get_node("Panel/RewardsGrid/SpecialIcon").texture = load("res://Resources/Textures/Items/treasure_greyed.png")
		
func set_requirements():
	var grid = get_node("Panel/RequirementsGrid")
	for requirement in current_quest["requirements"]:
		var potion_texture_path = GlobalPotions.get_potion_texture(requirement)
		var textureRect = TextureRect.new()
		textureRect.texture = load(potion_texture_path)
		grid.add_child(textureRect)
	
func get_quest_info():
	current_quest = GlobalQuests.get_quest_by_name(quest_name)


func _on_Accept_pressed():
	print (quest_name)
	PersistedInventory.add_quest(quest_name)
	GlobalQuests.set_accepted(quest_name)
	queue_free()	#delete the node so the quest disappears from the board
