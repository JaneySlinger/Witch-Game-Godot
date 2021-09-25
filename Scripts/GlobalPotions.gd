extends Node

var potions = [
	{
		"display_name": "Fly Me to the Moon",
		"description": "A potion that will have you feeling light on your feet. Maybe a little too light...",
		"texture_path": "res://Resources/Textures/Items/potion_blue.png",
		"quests": [
			"Save a cat from a tree",
			"Help the old lady walk"
		],
		"ingredients": [
			"Blue Mushroom",
			"Red Sparkle Mushroom",
			"Orange Mushroom"
		],
		"price": 10
	},
	{
		"display_name": "Despair Squid Repellent",
		"description": "For when you have those down days.",
		"texture_path": "res://Resources/Textures/Items/potion_purple.png",
		"quests": [
			"Cheer the young woman up",
		],
		"ingredients": [
			"Orange Sparkle Mushroom",
			"Purple Sparkle Mushroom",
		],
		"price": 10
	},
	{
		"display_name": "Light in a Bottle",
		"description": "Brighten up the darkest corners.",
		"texture_path": "res://Resources/Textures/Items/potion_green.png",
		"quests": [
			"Light up the village at night",
			"Help the baker walk home safely"
		],
		"ingredients": [
			"Purple Sparkle Mushroom",
			"Red Sparkle Mushroom",
			"Blue Mushroom",
			"Orange Sparkle Mushroom"
		],
		"price": 10
	},
	{
		"display_name": "Headache be Gone",
		"description": "Ease your aches and pains.",
		"texture_path": "res://Resources/Textures/Items/potion_red.png",
		"quests": [
			"Stop the butcher being so grumpy",
			"Cure the little girl's headache",
			"Help the woman with her pain"
		],
		"ingredients": [
			"Blue Sparkle Mushroom",
			"Red Mushroom",
			"Orange Mushroom",
			"Purple Sparkle Mushroom"
		],
		"price": 10
	},
	{
		"display_name": "Tell no lies",
		"description": "Sometimes you need a little help to tell the truth.",
		"texture_path": "res://Resources/Textures/Items/potion_purple.png",
		"quests": [
			"Help the young couple admit their feelings"
		],
		"ingredients": [
			"Purple Sparkle Mushroom"
		],
		"price": 10
	},
	{
		"display_name": "Itching Potion",
		"description": "Warning: This will cause itching. Use with care.",
		"texture_path": "res://Resources/Textures/Items/potion_green.png",
		"quests": [
			"Annoy the candle stick maker"
		],
		"ingredients": [
			"Red Sparkle Mushroom",
			"Red Mushroom",
			"Orange Mushroom",
			"Purple Sparkle Mushroom"
		],
		"price": 10
	},
	{
		"display_name": "Anti-Itching Potion",
		"description": "Cures itching. Not to be confused with the Itching Potion.",
		"texture_path": "res://Resources/Textures/Items/potion_green.png",
		"quests": [
			"Cure the old lady's itching"
		],
		"ingredients": [
			"Red Sparkle Mushroom",
			"Red Mushroom",
			"Orange Mushroom",
			"Purple Mushroom"
		],
		"price": 10
	}
]

func get_potions():
	return potions
	
func get_potion_texture(potion_name):
	for potion in potions:
		if potion["display_name"] == potion_name:
			return potion["texture_path"] 

func get_potion(display_name):
	for potion in potions:
		if potion["display_name"] == display_name:
			return potion
	
