extends Node

var quests = [
	{
		"name": "Save a cat from a tree",
		"requester": "Old Lady",
		"description": "Oh no! My poor cat Tabby is stuck up a tree. Please can somebody help her? Who knows how long she's been up there since I put this on the town board? If only I had a way to fly up there and get her, but that would be, well, magic.",
		"requirements": ["Fly Me to the Moon"],
		"rewards": {
			"money": 1,
			"social": {
				"name": "Old Lady",
				"increase": 10
			},
			"special": "Greenhouse"
		},
		"completed": false,
		"accepted": false,
		"dialogue_to_claim": true
	},
	{
		"name": "Stop the butcher being so grumpy",
		"requester": "Butcher",
		"description": "I've got the worst headache and it's making me grumpier than usual. None of my normal remedies have worked so if anyone else has anything to try I would be grateful. I'm sure my husband would be grateful for me to stop moaning so much as well!",
		"requirements": ["Headache be Gone"],
		"rewards": {
			"money": 0,
			"social": {
				"name": "Butcher",
				"increase": 5
			},
			"special": ""
		},
		"completed": false,
		"accepted": false,
		"dialogue_to_claim": false
	},
	{
		"name": "Save a cat from a tree 2",
		"requester": "Old Lady",
		"description": "Lorum epsum qtyway",
		"requirements": ["Fly Me to the Moon"],
		"rewards": {
			"money": 1,
			"social": {
				"name": "Old Lady",
				"increase": 10
			},
			"special": "Greenhouse"
		},
		"completed": false,
		"accepted": false,
		"dialogue_to_claim": false
	},
	{
		"name": "Stop the butcher being so grumpy 2",
		"requester": "Butcher",
		"description": "Lorum epsum qtwq",
		"requirements": ["Headache be Gone"],
		"rewards": {
			"money": 0,
			"social": {
				"name": "Butcher",
				"increase": 5
			},
			"special": ""
		},
		"completed": false,
		"accepted": false,
		"dialogue_to_claim": false
	},
	{
		"name": "Help the young couple admit their feelings",
		"requester": "Greengrocer",
		"description": "I've had a crush on the Candlestick Maker for a while, but I don't want to make a move until I know he feels the same. Does anyone have a way to help us be honest with each other?",
		"requirements": ["Tell no lies"],
		"rewards": {
			"money": 10,
			"social": {
				"name": "Greengrocer",
				"increase": 10
			},
			"special": ""
		},
		"completed": false,
		"accepted": false,
		"dialogue_to_claim": false
	},
	{
		"name": "Help the farmer with their itch",
		"requester": "Farmer",
		"description": "Lorum epsum ragrag",
		"requirements": ["Anti-Itching Potion"],
		"rewards": {
			"money": 0,
			"social": {
				"name": "",
				"increase": 0
			},
			"special": "House Upgrade"
		},
		"completed": false,
		"accepted": false,
		"dialogue_to_claim": true
	}
]

func get_quests():
	return quests

func get_quest_by_name(quest_name):
	for quest in quests:
		if quest["name"] == quest_name:
			return quest

#func set_accepted(quest_name):
#	get_quest_by_name(quest_name)["accepted"] = true
	
#func are_requirements_met(quest_name):
#	var quest = get_quest_by_name(quest_name)
#	print("Requirements are: " + String(quest["requirements"]))
#	var result = PersistedInventory.allItemsInInventory("playerInv", quest["requirements"])
#	print("Requirements met: " + String(result))
#	return result

#func complete_quest(quest_name):
#	if(are_requirements_met(quest_name)):
#		var quest = get_quest_by_name(quest_name)
#		print("setting " + quest_name + " to completed")
#		print("quest is completed before set: " + String(quest["completed"]))
#		get_quest_by_name(quest_name)["completed"] = true
#		print("quest is completed: " + String(quest["completed"]))
#		PersistedQuests.complete_quest(quest_name)
#		submit_items(quest)
#		process_rewards(quest)
#	else:
#		print("Requirements aren't met for this quest.")

#func submit_items(quest):
#	for requirement in quest["requirements"]:
#		PersistedInventory.remove_item("playerInv", requirement)

#func process_rewards(quest):
#	print("reward money is: " + String(quest["rewards"]["money"]))
#	if quest["rewards"]["money"] != 0:
#		PersistedInventory.playerMoney += quest["rewards"]["money"]
#		print(PersistedInventory.playerMoney)
#	if quest["rewards"]["social"]["increase"] != 0:
#		#TODO: process the social increase
#		pass
#	if quest["rewards"]["special"] != "":
#		#TODO: process the special reward
#		pass

#func is_quest_complete(quest_name):
#	return get_quest_by_name(quest_name)["completed"]
