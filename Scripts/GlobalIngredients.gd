extends Node

var ingredients = [
	{
		"label": "Blue Mushroom", 
		"item_name": "mushroom_blue_1"},
	{
		"label": "Blue Sparkle Mushroom", 
		"item_name": "mushroom_blue_2"},
	{
		"label": "Purple Mushroom",
		"item_name": "mushroom_purple_1"},
	{
		"label": "Purple Sparkle Mushroom",
		"item_name": "mushroom_purple_2"},
	{
		"label": "Red Mushroom",
		"item_name": "mushroom_red_1"},
	{
		"label": "Red Sparkle Mushroom",
		"item_name": "mushroom_red_2"},
	{
		"label": "Orange Mushroom",
		"item_name": "mushroom_orange_1"},
	{
		"label": "Orange Sparkle Mushroom",
		"item_name": "mushroom_orange_2"}
	]

func get_ingredients():
	return ingredients


func get_ingredient_label(item_name):
	for index in range(ingredients.size()):
		if ingredients[index]["item_name"] == item_name:
			return ingredients[index]["label"]
