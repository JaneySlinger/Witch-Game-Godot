extends Node

var ingredients = [
	{
		"label": "Blue Mushroom", 
		"display_name": "Blue Mushroom", 
		"item_name": "mushroom_blue_1",
		"item_id": "mushroom_blue_1",
		"texture_path": "res://Resources/Textures/Items/mushroom_blue_1.png",
		"price": 3},
	{
		"label": "Blue Sparkle Mushroom", 
		"display_name": "Blue Sparkle Mushroom", 
		"item_name": "mushroom_blue_2",
		"item_id": "mushroom_blue_2",
		"texture_path": "res://Resources/Textures/Items/mushroom_blue_2.png",
		"price": 3},
	{
		"label": "Purple Mushroom",
		"display_name": "Purple Mushroom",
		"item_name": "mushroom_purple_1",
		"item_id": "mushroom_purple_1",
		"texture_path": "res://Resources/Textures/Items/mushroom_purple_1.png",
		"price": 3},
	{
		"label": "Purple Sparkle Mushroom",
		"display_name": "Purple Sparkle Mushroom",
		"item_name": "mushroom_purple_2",
		"item_id": "mushroom_purple_2",
		"texture_path": "res://Resources/Textures/Items/mushroom_purple_2.png",
		"price": 3},
	{
		"label": "Red Mushroom",
		"display_name": "Red Mushroom",
		"item_name": "mushroom_red_1",
		"item_id": "mushroom_red_1",
		"texture_path": "res://Resources/Textures/Items/mushroom_red_1.png",
		"price": 3},
	{
		"label": "Red Sparkle Mushroom",
		"display_name": "Red Sparkle Mushroom",
		"item_name": "mushroom_red_2",
		"item_id": "mushroom_red_2",
		"texture_path": "res://Resources/Textures/Items/mushroom_red_2.png",
		"price": 3},
	{
		"label": "Orange Mushroom",
		"display_name": "Orange Mushroom",
		"item_name": "mushroom_orange_1",
		"item_id": "mushroom_orange_1",
		"texture_path": "res://Resources/Textures/Items/mushroom_orange_1.png",
		"price": 3},
	{
		"label": "Orange Sparkle Mushroom",
		"display_name": "Orange Sparkle Mushroom",
		"item_name": "mushroom_orange_2",
		"item_id": "mushroom_orange_2",
		"texture_path": "res://Resources/Textures/Items/mushroom_orange_2.png",
		"price": 3},
	{
		"label": "Apple",
		"display_name": "Apple",
		"item_name": "apple",
		"item_id": "apple",
		"texture_path": "res://Resources/Textures/Items/apple.png",
		"price": 1},
	{
		"label": "Carrot",
		"display_name": "Carrot",
		"item_name": "carrot",
		"item_id": "carrot",
		"texture_path": "res://Resources/Textures/Items/carrot.png",
		"price": 1},
	{
		"label": "Banana",
		"display_name": "Banana",
		"item_name": "banana",
		"item_id": "banana",
		"texture_path": "res://Resources/Textures/Items/banana.png",
		"price": 1},
	{
		"label": "Berries",
		"display_name": "Berries",
		"item_name": "berries",
		"item_id": "berries",
		"texture_path": "res://Resources/Textures/Items/berries.png",
		"price": 1},
	{
		"label": "Bulb",
		"display_name": "Bulb",
		"item_name": "bulb",
		"item_id": "bulb",
		"texture_path": "res://Resources/Textures/Items/bulb.png",
		"price": 1},
	{
		"label": "Chilli",
		"display_name": "Chilli",
		"item_name": "chilli",
		"item_id": "chilli",
		"texture_path": "res://Resources/Textures/Items/chilli.png",
		"price": 1},
	{
		"label": "Chocolate",
		"display_name": "Chocolate",
		"item_name": "chocolate",
		"item_id": "chocolate",
		"texture_path": "res://Resources/Textures/Items/chocolate.png",
		"price": 1},
	{
		"label": "Corn",
		"display_name": "Corn",
		"item_name": "corn",
		"item_id": "corn",
		"texture_path": "res://Resources/Textures/Items/corn.png",
		"price": 1},
	{
		"label": "Cotton",
		"display_name": "Cotton",
		"item_name": "cotton",
		"item_id": "cotton",
		"texture_path": "res://Resources/Textures/Items/cotton.png",
		"price": 1},
	{
		"label": "Egg",
		"display_name": "Egg",
		"item_name": "egg",
		"item_id": "egg",
		"texture_path": "res://Resources/Textures/Items/egg.png",
		"price": 1},
	{
		"label": "Eggplant",
		"display_name": "Eggplant",
		"item_name": "eggplant",
		"item_id": "eggplant",
		"texture_path": "res://Resources/Textures/Items/eggplant.png",
		"price": 1},
	{
		"label": "Feather",
		"display_name": "Feather",
		"item_name": "feather",
		"item_id": "feather",
		"texture_path": "res://Resources/Textures/Items/feather.png",
		"price": 1},
	{
		"label": "Fish Bone",
		"display_name": "Fish Bone",
		"item_name": "fish_bone",
		"item_id": "fish_bone",
		"texture_path": "res://Resources/Textures/Items/fish_bone.png",
		"price": 1},
	{
		"label": "Garlic",
		"display_name": "Garlic",
		"item_name": "garlic",
		"item_id": "garlic",
		"texture_path": "res://Resources/Textures/Items/garlic.png",
		"price": 1},
	{
		"label": "Herb 1",
		"display_name": "Herb 1",
		"item_name": "herb1",
		"item_id": "herb1",
		"texture_path": "res://Resources/Textures/Items/herb1.png",
		"price": 1},
	{
		"label": "Herb 2",
		"display_name": "Herb 2",
		"item_name": "herb2",
		"item_id": "herb2",
		"texture_path": "res://Resources/Textures/Items/herb2.png",
		"price": 1},
	{
		"label": "Herb 3",
		"display_name": "Herb 3",
		"item_name": "herb3",
		"item_id": "herb3",
		"texture_path": "res://Resources/Textures/Items/herb3.png",
		"price": 1},
	{
		"label": "Honey",
		"display_name": "Honey",
		"item_name": "honey",
		"item_id": "honey",
		"texture_path": "res://Resources/Textures/Items/honey.png",
		"price": 1},
	{
		"label": "Lemon",
		"display_name": "Lemon",
		"item_name": "lemon",
		"item_id": "lemon",
		"texture_path": "res://Resources/Textures/Items/lemon.png",
		"price": 1},
	{
		"label": "Milk",
		"display_name": "Milk",
		"item_name": "milk",
		"item_id": "milk",
		"texture_path": "res://Resources/Textures/Items/milk.png",
		"price": 1},
	{
		"label": "Mortar",
		"display_name": "Mortar",
		"item_name": "mortar",
		"item_id": "mortar",
		"texture_path": "res://Resources/Textures/Items/mortar.png",
		"price": 1},
	{
		"label": "Pear",
		"display_name": "Pear",
		"item_name": "pear",
		"item_id": "pear",
		"texture_path": "res://Resources/Textures/Items/pear.png",
		"price": 1},
	{
		"label": "Plant",
		"display_name": "Plant",
		"item_name": "plant1",
		"item_id": "plant1",
		"texture_path": "res://Resources/Textures/Items/plant1.png",
		"price": 1},
	{
		"label": "Root",
		"display_name": "Root",
		"item_name": "root",
		"item_id": "root",
		"texture_path": "res://Resources/Textures/Items/root.png",
		"price": 1},
	{
		"label": "Salt",
		"display_name": "Salt",
		"item_name": "salt",
		"item_id": "salt",
		"texture_path": "res://Resources/Textures/Items/salt.png",
		"price": 1},
	{
		"label": "Strawberry",
		"display_name": "Strawberry",
		"item_name": "strawberry",
		"item_id": "strawberry",
		"texture_path": "res://Resources/Textures/Items/strawberry.png",
		"price": 1},
	{
		"label": "Tomato",
		"display_name": "Tomato",
		"item_name": "tomato",
		"item_id": "tomato",
		"texture_path": "res://Resources/Textures/Items/tomato.png",
		"price": 1},
	{
		"label": "Worm",
		"display_name": "Worm",
		"item_name": "worm",
		"item_id": "worm",
		"texture_path": "res://Resources/Textures/Items/worm.png",
		"price": 1},
	]

func get_ingredients():
	return ingredients

func get_ingredient_name(label):
	for index in range(ingredients.size()):
		if ingredients[index]["label"] == label:
			return ingredients[index]["item_name"]

func get_ingredient_label(item_name):
	for index in range(ingredients.size()):
		if ingredients[index]["item_name"] == item_name:
			return ingredients[index]["label"]
			
func get_ingredient_price(item_name):
	for index in range(ingredients.size()):
		if ingredients[index]["item_name"] == item_name:
			return ingredients[index]["price"]

func get_ingredient(display_name):
	for index in range(ingredients.size()):
		if ingredients[index]["display_name"] == display_name:
			return ingredients[index]
