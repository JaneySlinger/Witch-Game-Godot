tool
extends Sprite

export(String, "black", "blue", "green", "purple", "red") var colour setget set_colour

func _ready():
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/5_Accessories/glasses/glasses_" + colour + ".png")
	set_texture(texture)
	
func set_colour(new_colour):
	colour = new_colour
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/5_Accessories/glasses/glasses_" + colour + ".png")
	set_texture(texture)
	update()
