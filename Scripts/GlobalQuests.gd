extends Node


var quests = [
	{
		"name": "Save a cat from a tree",
		"description": "Lorum epsum",
		"requirements": ["Fly Me to the Moon"],
		"rewards": {
			"money": 1,
			"social": {
				"name": "old lady",
				"increase": 10
			},
			"special": "greenhouse"
		},
		"completed": false,
		"accepted": false
	},
	{
		"name": "Stop the butcher being so grumpy",
		"description": "Lorum epsum",
		"requirements": ["Headache be Gone"],
		"rewards": {
			"money": 0,
			"social": {
				"name": "butcher",
				"increase": 5
			},
			"special": ""
		},
		"completed": false,
		"accepted": false
	},
	{
		"name": "Save a cat from a tree 2",
		"description": "Lorum epsum",
		"requirements": ["Fly Me to the Moon"],
		"rewards": {
			"money": 1,
			"social": {
				"name": "old lady",
				"increase": 10
			},
			"special": "greenhouse"
		},
		"completed": false,
		"accepted": false
	},
	{
		"name": "Stop the butcher being so grumpy 2",
		"description": "Lorum epsum",
		"requirements": ["Headache be Gone"],
		"rewards": {
			"money": 0,
			"social": {
				"name": "butcher",
				"increase": 5
			},
			"special": ""
		},
		"completed": false,
		"accepted": false
	},
	{
		"name": "Help the young couple admit their feelings",
		"description": "Lorum epsum",
		"requirements": ["Tell no lies"],
		"rewards": {
			"money": 1,
			"social": {
				"name": "old lady",
				"increase": 10
			},
			"special": "greenhouse"
		},
		"completed": false,
		"accepted": false
	},
	{
		"name": "Stop the butcher being so grumpy 3",
		"description": "Lorum epsum",
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
		"accepted": false
	}
]

func get_quests():
	return quests

func get_quest_by_name(quest_name):
	for quest in quests:
		if quest["name"] == quest_name:
			return quest

func set_accepted(quest_name):
	get_quest_by_name(quest_name)["accepted"] = true
