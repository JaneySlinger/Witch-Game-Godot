tool
extends Sprite

export(String, "black", "blue", "blue_light", "brown", "green", "grey", "orange", "pink", "purple", "red", "white") var colour setget set_colour
		
func _ready():
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/3_Clothes/1_Shoes/shoes_" + colour + ".png")
	set_texture(texture)
	
func set_colour(new_colour):
	colour = new_colour
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/3_Clothes/1_Shoes/shoes_" + colour + ".png")
	set_texture(texture)
	update()
