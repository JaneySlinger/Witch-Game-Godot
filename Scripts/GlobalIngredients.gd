extends Node

var ingredients = [
	{
		"label": "Blue Mushroom", 
		"item_name": "mushroom_blue_1",
		"cost": 3},
	{
		"label": "Blue Sparkle Mushroom", 
		"item_name": "mushroom_blue_2",
		"cost": 3},
	{
		"label": "Purple Mushroom",
		"item_name": "mushroom_purple_1",
		"cost": 3},
	{
		"label": "Purple Sparkle Mushroom",
		"item_name": "mushroom_purple_2",
		"cost": 3},
	{
		"label": "Red Mushroom",
		"item_name": "mushroom_red_1",
		"cost": 3},
	{
		"label": "Red Sparkle Mushroom",
		"item_name": "mushroom_red_2",
		"cost": 3},
	{
		"label": "Orange Mushroom",
		"item_name": "mushroom_orange_1",
		"cost": 3},
	{
		"label": "Orange Sparkle Mushroom",
		"item_name": "mushroom_orange_2",
		"cost": 3},
	{
		"label": "Apple",
		"item_name": "apple",
		"cost": 1},
	{
		"label": "Carrot",
		"item_name": "carrot",
		"cost": 1}
	]

func get_ingredients():
	return ingredients


func get_ingredient_label(item_name):
	for index in range(ingredients.size()):
		if ingredients[index]["item_name"] == item_name:
			return ingredients[index]["label"]
