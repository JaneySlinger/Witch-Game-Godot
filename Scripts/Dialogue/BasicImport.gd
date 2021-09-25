extends Node

var superMega = true
var lotsOfStuff = true
var playerName = "Steve"

# `export` our variables and quick documentation about them on hover
var variables = [
	'superMega',
	'lotsOfStuff',
	'playerName',
]
var varTooltips = [
	'Demo variable',
	'How many things? Too many things!',
	'Our player name!'
]

#====> FUNCTIONS
func give_item(item_name):
	print("giving item " + item_name)
	PersistedInventory.add_item("playerInv", "Strawberry", "strawberry", 1, "res://Resources/Textures/Items/strawberry.png")
	pass

func accept_quest(quest_name):
	print("accepting quest " + quest_name)
	PersistedInventory.add_quest(quest_name)
	GlobalQuests.set_accepted(quest_name)
	
func are_quest_requirements_met(quest_name):
	return GlobalQuests.are_requirements_met(quest_name)

func complete_quest(quest_name):
	GlobalQuests.complete_quest(quest_name)

# `export` our functions and documentation about them! 
var functions = [
	'give_item("item_name")',
	'accept_quest("quest_name")',
	'are_quest_requirements_met("quest_name")'
]

var functionDocs = [
	'Give the player an item!',
	'Accept a quest from the person you are talking to',
	'Check if the player has the required items'
]
