extends ItemList

var potionTextures = load("res://Resources/Textures/scaled_potions.png")
var bluePotionTexture = load("res://Resources/Textures/blue_potion.png") 
var mushroomTexture = load("res://Resources/Textures/Aurora Tileset.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Working")
	
	add_item("Blue mushroom  ", bluePotionTexture, true)
	add_item("Orange mushroom  ", bluePotionTexture, true)
	add_item("Blue mushroom  ", bluePotionTexture, true)
	add_item("Orange mushroom  ", bluePotionTexture, true)
	add_item("Blue mushroom  ", bluePotionTexture, true)
	add_item("Orange mushroom  ", bluePotionTexture, true)
	add_item("Blue mushroom  ", bluePotionTexture, true)
	add_item("Orange mushroom  ", bluePotionTexture, true)
	add_item("Blue mushroom  ", bluePotionTexture, true)
	add_item("Orange mushroom  ", bluePotionTexture, true)
	add_item("Blue mushroom  ", bluePotionTexture, true)
	add_item("Orange mushroom  ", bluePotionTexture, true)

