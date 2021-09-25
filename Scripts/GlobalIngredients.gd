extends Node

var ingredients = [
	{
		"display_name": "Blue Mushroom", 
		"texture_path": "res://Resources/Textures/Items/mushroom_blue_1.png",
		"price": 3},
	{
		"display_name": "Blue Sparkle Mushroom", 
		"texture_path": "res://Resources/Textures/Items/mushroom_blue_2.png",
		"price": 3},
	{
		"display_name": "Purple Mushroom",
		"texture_path": "res://Resources/Textures/Items/mushroom_purple_1.png",
		"price": 3},
	{
		"display_name": "Purple Sparkle Mushroom",
		"texture_path": "res://Resources/Textures/Items/mushroom_purple_2.png",
		"price": 3},
	{
		"display_name": "Red Mushroom",
		"texture_path": "res://Resources/Textures/Items/mushroom_red_1.png",
		"price": 3},
	{
		"display_name": "Red Sparkle Mushroom",
		"texture_path": "res://Resources/Textures/Items/mushroom_red_2.png",
		"price": 3},
	{
		"display_name": "Orange Mushroom",
		"texture_path": "res://Resources/Textures/Items/mushroom_orange_1.png",
		"price": 3},
	{
		"display_name": "Orange Sparkle Mushroom",
		"texture_path": "res://Resources/Textures/Items/mushroom_orange_2.png",
		"price": 3},
	{
		"display_name": "Apple",
		"texture_path": "res://Resources/Textures/Items/apple.png",
		"price": 1},
	{
		"display_name": "Carrot",
		"texture_path": "res://Resources/Textures/Items/carrot.png",
		"price": 1},
	{
		"display_name": "Banana",
		"texture_path": "res://Resources/Textures/Items/banana.png",
		"price": 1},
	{
		"display_name": "Berries",
		"texture_path": "res://Resources/Textures/Items/berries.png",
		"price": 1},
	{
		"display_name": "Bulb",
		"texture_path": "res://Resources/Textures/Items/bulb.png",
		"price": 1},
	{
		"display_name": "Chilli",
		"texture_path": "res://Resources/Textures/Items/chilli.png",
		"price": 1},
	{
		"display_name": "Chocolate",
		"texture_path": "res://Resources/Textures/Items/chocolate.png",
		"price": 1},
	{
		"display_name": "Corn",
		"texture_path": "res://Resources/Textures/Items/corn.png",
		"price": 1},
	{
		"display_name": "Cotton",
		"texture_path": "res://Resources/Textures/Items/cotton.png",
		"price": 1},
	{
		"display_name": "Egg",
		"texture_path": "res://Resources/Textures/Items/egg.png",
		"price": 1},
	{
		"display_name": "Eggplant",
		"texture_path": "res://Resources/Textures/Items/eggplant.png",
		"price": 1},
	{
		"display_name": "Feather",
		"texture_path": "res://Resources/Textures/Items/feather.png",
		"price": 1},
	{
		"display_name": "Fish Bone",
		"texture_path": "res://Resources/Textures/Items/fish_bone.png",
		"price": 1},
	{
		"display_name": "Garlic",
		"texture_path": "res://Resources/Textures/Items/garlic.png",
		"price": 1},
	{
		"display_name": "Herb 1",
		"texture_path": "res://Resources/Textures/Items/herb1.png",
		"price": 1},
	{
		"display_name": "Herb 2",
		"texture_path": "res://Resources/Textures/Items/herb2.png",
		"price": 1},
	{
		"display_name": "Herb 3",
		"texture_path": "res://Resources/Textures/Items/herb3.png",
		"price": 1},
	{
		"display_name": "Honey",
		"texture_path": "res://Resources/Textures/Items/honey.png",
		"price": 1},
	{
		"display_name": "Lemon",
		"texture_path": "res://Resources/Textures/Items/lemon.png",
		"price": 1},
	{
		"display_name": "Milk",
		"texture_path": "res://Resources/Textures/Items/milk.png",
		"price": 1},
	{
		"display_name": "Mortar",
		"texture_path": "res://Resources/Textures/Items/mortar.png",
		"price": 1},
	{
		"display_name": "Pear",
		"texture_path": "res://Resources/Textures/Items/pear.png",
		"price": 1},
	{
		"display_name": "Plant",
		"texture_path": "res://Resources/Textures/Items/plant1.png",
		"price": 1},
	{
		"display_name": "Root",
		"texture_path": "res://Resources/Textures/Items/root.png",
		"price": 1},
	{
		"display_name": "Salt",
		"texture_path": "res://Resources/Textures/Items/salt.png",
		"price": 1},
	{
		"display_name": "Strawberry",
		"texture_path": "res://Resources/Textures/Items/strawberry.png",
		"price": 1},
	{
		"display_name": "Tomato",
		"texture_path": "res://Resources/Textures/Items/tomato.png",
		"price": 1},
	{
		"display_name": "Worm",
		"texture_path": "res://Resources/Textures/Items/worm.png",
		"price": 1},
	]

func get_ingredients():
	return ingredients
	
func get_ingredient(display_name):
	for index in range(ingredients.size()):
		if ingredients[index]["display_name"] == display_name:
			return ingredients[index]
