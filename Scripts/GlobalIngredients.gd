extends Node

var ingredients = [
	{
		"label": "Blue Mushroom", 
		"display_name": "Blue Mushroom", 
		"item_name": "mushroom_blue_1",
		"item_id": "mushroom_blue_1",
		"price": 3},
	{
		"label": "Blue Sparkle Mushroom", 
		"display_name": "Blue Sparkle Mushroom", 
		"item_name": "mushroom_blue_2",
		"item_id": "mushroom_blue_2",
		"price": 3},
	{
		"label": "Purple Mushroom",
		"display_name": "Purple Mushroom",
		"item_name": "mushroom_purple_1",
		"item_id": "mushroom_purple_1",
		"price": 3},
	{
		"label": "Purple Sparkle Mushroom",
		"display_name": "Purple Sparkle Mushroom",
		"item_name": "mushroom_purple_2",
		"item_id": "mushroom_purple_2",
		"price": 3},
	{
		"label": "Red Mushroom",
		"display_name": "Red Mushroom",
		"item_name": "mushroom_red_1",
		"item_id": "mushroom_red_1",
		"price": 3},
	{
		"label": "Red Sparkle Mushroom",
		"display_name": "Red Sparkle Mushroom",
		"item_name": "mushroom_red_2",
		"item_id": "mushroom_red_2",
		"price": 3},
	{
		"label": "Orange Mushroom",
		"display_name": "Orange Mushroom",
		"item_name": "mushroom_orange_1",
		"item_id": "mushroom_orange_1",
		"price": 3},
	{
		"label": "Orange Sparkle Mushroom",
		"display_name": "Orange Sparkle Mushroom",
		"item_name": "mushroom_orange_2",
		"item_id": "mushroom_orange_2",
		"price": 3},
	{
		"label": "Apple",
		"display_name": "Apple",
		"item_name": "apple",
		"item_id": "apple",
		"price": 1},
	{
		"label": "Carrot",
		"display_name": "Carrot",
		"item_name": "carrot",
		"item_id": "carrot",
		"price": 1},
	{
		"label": "Banana",
		"display_name": "Banana",
		"item_name": "banana",
		"item_id": "banana",
		"price": 1},
	{
		"label": "Berries",
		"display_name": "Berries",
		"item_name": "berries",
		"item_id": "berries",
		"price": 1},
	{
		"label": "Bulb",
		"display_name": "Bulb",
		"item_name": "bulb",
		"item_id": "bulb",
		"price": 1},
	{
		"label": "Chilli",
		"display_name": "Chilli",
		"item_name": "chilli",
		"item_id": "chilli",
		"price": 1},
	{
		"label": "Chocolate",
		"display_name": "Chocolate",
		"item_name": "chocolate",
		"item_id": "chocolate",
		"price": 1},
	{
		"label": "Corn",
		"display_name": "Corn",
		"item_name": "corn",
		"item_id": "corn",
		"price": 1},
	{
		"label": "Cotton",
		"display_name": "Cotton",
		"item_name": "cotton",
		"item_id": "cotton",
		"price": 1},
	{
		"label": "Egg",
		"display_name": "Egg",
		"item_name": "egg",
		"item_id": "egg",
		"price": 1},
	{
		"label": "Eggplant",
		"display_name": "Eggplant",
		"item_name": "eggplant",
		"item_id": "eggplant",
		"price": 1},
	{
		"label": "Feather",
		"display_name": "Feather",
		"item_name": "feather",
		"item_id": "feather",
		"price": 1},
	{
		"label": "Fish Bone",
		"display_name": "Fish Bone",
		"item_name": "fish_bone",
		"item_id": "fish_bone",
		"price": 1},
	{
		"label": "Garlic",
		"display_name": "Garlic",
		"item_name": "garlic",
		"item_id": "garlic",
		"price": 1},
	{
		"label": "Herb 1",
		"display_name": "Herb 1",
		"item_name": "herb1",
		"item_id": "herb1",
		"price": 1},
	{
		"label": "Herb 2",
		"display_name": "Herb 2",
		"item_name": "herb2",
		"item_id": "herb2",
		"price": 1},
	{
		"label": "Herb 3",
		"display_name": "Herb 3",
		"item_name": "herb3",
		"item_id": "herb3",
		"price": 1},
	{
		"label": "Honey",
		"display_name": "Honey",
		"item_name": "honey",
		"item_id": "honey",
		"price": 1},
	{
		"label": "Lemon",
		"display_name": "Lemon",
		"item_name": "lemon",
		"item_id": "lemon",
		"price": 1},
	{
		"label": "Milk",
		"display_name": "Milk",
		"item_name": "milk",
		"item_id": "milk",
		"price": 1},
	{
		"label": "Mortar",
		"display_name": "Mortar",
		"item_name": "mortar",
		"item_id": "mortar",
		"price": 1},
	{
		"label": "Pear",
		"display_name": "Pear",
		"item_name": "pear",
		"item_id": "pear",
		"price": 1},
	{
		"label": "Plant",
		"display_name": "Plant",
		"item_name": "plant1",
		"item_id": "plant1",
		"price": 1},
	{
		"label": "Root",
		"display_name": "Root",
		"item_name": "root",
		"item_id": "root",
		"price": 1},
	{
		"label": "Salt",
		"display_name": "Salt",
		"item_name": "salt",
		"item_id": "salt",
		"price": 1},
	{
		"label": "Strawberry",
		"display_name": "Strawberry",
		"item_name": "strawberry",
		"item_id": "strawberry",
		"price": 1},
	{
		"label": "Tomato",
		"display_name": "Tomato",
		"item_name": "tomato",
		"item_id": "tomato",
		"price": 1},
	{
		"label": "Worm",
		"display_name": "Worm",
		"item_name": "worm",
		"item_id": "worm",
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
