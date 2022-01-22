extends Node
var playerQuests = []

signal quest_added(quest_name)
signal quest_completed(quest_name)

func add_quest(quest_name):
	playerQuests.append(GlobalQuests.get_quest_by_name(quest_name))
	print (playerQuests)
	emit_signal("quest_added", quest_name)
	
func complete_quest(quest_name):
	if(are_requirements_met(quest_name)):
		var quest = get_quest_by_name(quest_name)
		print("setting " + quest_name + " to completed")
		print("quest is completed before set: " + String(quest["completed"]))
		get_quest_by_name(quest_name)["completed"] = true
		print("quest is completed: " + String(quest["completed"]))
		submit_items(quest)
		process_rewards(quest)
	else:
		print("Requirements aren't met for this quest.")
	print("player quests are ")
	print(playerQuests)
	#mark the quest with the completed icon in the quest menu
	emit_signal("quest_completed", quest_name)

func get_quest_by_name(quest_name):
	for quest in playerQuests:
		if quest["name"] == quest_name:
			return quest

func are_requirements_met(quest_name):
	var quest = get_quest_by_name(quest_name)
	print("Requirements are: " + String(quest["requirements"]))
	var result = PersistedInventory.allItemsInInventory("playerInv", quest["requirements"])
	print("Requirements met: " + String(result))
	return result

func submit_items(quest):
	for requirement in quest["requirements"]:
		PersistedInventory.remove_item("playerInv", requirement)

func process_rewards(quest):
	print("reward money is: " + String(quest["rewards"]["money"]))
	if quest["rewards"]["money"] != 0:
		PersistedInventory.playerMoney += quest["rewards"]["money"]
		print(PersistedInventory.playerMoney)
	if quest["rewards"]["social"]["increase"] != 0:
		#TODO: process the social increase
		pass
	if quest["rewards"]["special"] != "":
		#TODO: process the special reward
		pass

func set_accepted(quest_name):
	get_quest_by_name(quest_name)["accepted"] = true
	
func is_quest_complete(quest_name):
	return get_quest_by_name(quest_name)["completed"]
