extends Node

var ingredients = [
	{
		"label": "Blue Mushroom", 
		"item_name": "mushroom_blue_1",
		"price": 3},
	{
		"label": "Blue Sparkle Mushroom", 
		"item_name": "mushroom_blue_2",
		"price": 3},
	{
		"label": "Purple Mushroom",
		"item_name": "mushroom_purple_1",
		"price": 3},
	{
		"label": "Purple Sparkle Mushroom",
		"item_name": "mushroom_purple_2",
		"price": 3},
	{
		"label": "Red Mushroom",
		"item_name": "mushroom_red_1",
		"price": 3},
	{
		"label": "Red Sparkle Mushroom",
		"item_name": "mushroom_red_2",
		"price": 3},
	{
		"label": "Orange Mushroom",
		"item_name": "mushroom_orange_1",
		"price": 3},
	{
		"label": "Orange Sparkle Mushroom",
		"item_name": "mushroom_orange_2",
		"price": 3},
	{
		"label": "Apple",
		"item_name": "apple",
		"price": 1},
	{
		"label": "Carrot",
		"item_name": "carrot",
		"price": 1},
	{
		"label": "Banana",
		"item_name": "banana",
		"price": 1},
	{
		"label": "Berries",
		"item_name": "berries",
		"price": 1},
	{
		"label": "Bulb",
		"item_name": "bulb",
		"price": 1},
	{
		"label": "Chilli",
		"item_name": "chilli",
		"price": 1},
	{
		"label": "Chocolate",
		"item_name": "chocolate",
		"price": 1},
	{
		"label": "Corn",
		"item_name": "corn",
		"price": 1},
	{
		"label": "Cotton",
		"item_name": "cotton",
		"price": 1},
	{
		"label": "Egg",
		"item_name": "egg",
		"price": 1},
	{
		"label": "Eggplant",
		"item_name": "eggplant",
		"price": 1},
	{
		"label": "Feather",
		"item_name": "feather",
		"price": 1},
	{
		"label": "Fish Bone",
		"item_name": "fish_bone",
		"price": 1},
	{
		"label": "Garlic",
		"item_name": "garlic",
		"price": 1},
	{
		"label": "Herb 1",
		"item_name": "herb1",
		"price": 1},
	{
		"label": "Herb 2",
		"item_name": "herb2",
		"price": 1},
	{
		"label": "Herb 3",
		"item_name": "herb3",
		"price": 1},
	{
		"label": "Honey",
		"item_name": "honey",
		"price": 1},
	{
		"label": "Lemon",
		"item_name": "lemon",
		"price": 1},
	{
		"label": "Milk",
		"item_name": "milk",
		"price": 1},
	{
		"label": "Mortar",
		"item_name": "mortar",
		"price": 1},
	{
		"label": "Pear",
		"item_name": "pear",
		"price": 1},
	{
		"label": "Plant",
		"item_name": "plant1",
		"price": 1},
	{
		"label": "Root",
		"item_name": "root",
		"price": 1},
	{
		"label": "Salt",
		"item_name": "salt",
		"price": 1},
	{
		"label": "Strawberry",
		"item_name": "strawberry",
		"price": 1},
	{
		"label": "Tomato",
		"item_name": "tomato",
		"price": 1},
	{
		"label": "Worm",
		"item_name": "worm",
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
