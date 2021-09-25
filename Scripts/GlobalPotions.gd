extends Node

var potions = [
	{
		"name": "Fly Me to the Moon",
		"display_name": "Fly Me to the Moon",
		"description": "A potion that will have you feeling light on your feet. Maybe a little too light...",
		"icon": "potion_blue",
		"item_id": "potion_blue",
		"texture_path": "res://Resources/Textures/Items/potion_blue.png",
		"quests": [
			"Save a cat from a tree",
			"Help the old lady walk"
		],
		"ingredients": [
			"mushroom_blue_1",
			"mushroom_red_2",
			"mushroom_orange_1"
		],
		"price": 10
	},
	{
		"name": "Despair Squid Repellent",
		"display_name": "Despair Squid Repellent",
		"description": "For when you have those down days.",
		"icon": "potion_purple",
		"item_id": "potion_purple",
		"texture_path": "res://Resources/Textures/Items/potion_purple.png",
		"quests": [
			"Cheer the young woman up",
		],
		"ingredients": [
			"mushroom_orange_2",
			"mushroom_purple_2",
		],
		"price": 10
	},
	{
		"name": "Light in a Bottle",
		"display_name": "Light in a Bottle",
		"description": "Brighten up the darkest corners.",
		"icon": "potion_green",
		"item_id": "potion_green",
		"texture_path": "res://Resources/Textures/Items/potion_green.png",
		"quests": [
			"Light up the village at night",
			"Help the baker walk home safely"
		],
		"ingredients": [
			"mushroom_purple_2",
			"mushroom_red_2",
			"mushroom_blue_1",
			"mushroom_orange_2"
		],
		"price": 10
	},
	{
		"name": "Headache be Gone",
		"display_name": "Headache be Gone",
		"description": "Ease your aches and pains.",
		"icon": "potion_red",
		"item_id": "potion_red",
		"texture_path": "res://Resources/Textures/Items/potion_red.png",
		"quests": [
			"Stop the butcher being so grumpy",
			"Cure the little girl's headache",
			"Help the woman with her pain"
		],
		"ingredients": [
			"mushroom_blue_2",
			"mushroom_red_1",
			"mushroom_orange_1",
			"mushroom_purple_2"
		],
		"price": 10
	},
	{
		"name": "Tell no lies",
		"display_name": "Tell no lies",
		"description": "Sometimes you need a little help to tell the truth.",
		"icon": "potion_purple",
		"item_id": "potion_purple",
		"texture_path": "res://Resources/Textures/Items/potion_purple.png",
		"quests": [
			"Help the young couple admit their feelings"
		],
		"ingredients": [
			"mushroom_purple_2"
		],
		"price": 10
	},
	{
		"name": "Itching Potion",
		"display_name": "Itching Potion",
		"description": "Warning: This will cause itching. Use with care.",
		"icon": "potion_green",
		"item_id": "potion_green",
		"texture_path": "res://Resources/Textures/Items/potion_green.png",
		"quests": [
			"Annoy the candle stick maker"
		],
		"ingredients": [
			"mushroom_red_2",
			"mushroom_red_1",
			"mushroom_orange_1",
			"mushroom_purple_2"
		],
		"price": 10
	},
	{
		"name": "Anti-Itching Potion",
		"display_name": "Anti-Itching Potion",
		"description": "Cures itching. Not to be confused with the Itching Potion.",
		"icon": "potion_green",
		"item_id": "potion_green",
		"texture_path": "res://Resources/Textures/Items/potion_green.png",
		"quests": [
			"Cure the old lady's itching"
		],
		"ingredients": [
			"mushroom_red_2",
			"mushroom_red_1",
			"mushroom_orange_1",
			"mushroom_purple_2"
		],
		"price": 10
	}
]

func get_potions():
	return potions
	
func get_potion_icon(potion_name):
	for potion in potions:
		if potion["name"] == potion_name:
			return potion["icon"] 

func get_potion_price(potion_name):
	for potion in potions:
		if potion["name"] == potion_name:
			return potion["price"]
