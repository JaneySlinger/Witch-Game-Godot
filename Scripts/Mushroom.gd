tool
extends Node

enum Mushroom { BLUE, BLUE_SPARKLE, 
				PURPLE, PURPLE_SPARKLE, 
				RED, RED_SPARKLE, 
				ORANGE, ORANGE_SPARKLE }
export(Mushroom) var type = Mushroom.BLUE

onready var itemList = get_node("../Inventory/ItemList")

var sprite_rects = [Rect2(224, 352, 32, 32),
					Rect2(224, 384, 32, 32),
					Rect2(256, 416, 32, 32),
					Rect2(256, 448, 32, 32),
					Rect2(256, 352, 32, 32),
					Rect2(256, 384, 32, 32),
					Rect2(224, 416, 32, 32),
					Rect2(224, 448, 32, 32)]

var properties = [
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

func _process(delta):
	#also changes it in editor apparently
	set_sprite_rect()
			
func _ready():
	set_sprite_rect()
	
func set_sprite_rect():
	$Sprite.region_rect = sprite_rects[type]
	
func _on_Mushroom_body_entered(body):
	if body.name == "Witch":
		itemList.add_to_inventory(properties[type]["label"], properties[type]["item_name"])
		get_tree().queue_delete(self)
