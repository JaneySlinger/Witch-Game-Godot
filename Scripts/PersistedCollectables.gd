extends Node

enum Mushroom { BLUE, BLUE_SPARKLE, 
				PURPLE, PURPLE_SPARKLE, 
				RED, RED_SPARKLE, 
				ORANGE, ORANGE_SPARKLE }
				
var collectables = [
	{
		"x-position": 191,
		"y-position": 334,
		"colour": Mushroom.ORANGE,
		"collected": false,
		"id": 0
	},
	{
		"x-position": 442,
		"y-position": 279,
		"colour": Mushroom.BLUE,
		"collected": false,
		"id": 1
	},
	{
		"x-position": 110,
		"y-position": 158,
		"colour": Mushroom.ORANGE_SPARKLE,
		"collected": false,
		"id": 2
	},
	{
		"x-position": 869,
		"y-position": 292,
		"colour": Mushroom.RED_SPARKLE,
		"collected": false,
		"id": 3
	},
	{
		"x-position": 497,
		"y-position": 508,
		"colour": Mushroom.PURPLE_SPARKLE,
		"collected": false,
		"id": 4
	},
	{
		"x-position": 2258,
		"y-position": 510,
		"colour": Mushroom.PURPLE,
		"collected": false,
		"id": 5
	}
]

func set_collected(id, value):
	collectables[id]["collected"] = value

func respawn_collectables():
	for collectable in collectables:
		collectable["collected"] = false
