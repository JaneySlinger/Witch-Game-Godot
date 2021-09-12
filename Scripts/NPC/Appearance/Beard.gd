tool
extends Sprite

export(String, "black", "blonde", "brown", "brown_light", "copper", "green", "green_light", "grey", "lilac", "navy", "pink", "purple", "red", "turquoise") var beard_colour setget set_beard_colour
		
func _ready():
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/5_Accessories/beard/beard_" + beard_colour + ".png")
	set_texture(texture)

func set_beard_colour(new_beard_colour):
	beard_colour = new_beard_colour
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/5_Accessories/beard/beard_" + beard_colour + ".png")
	set_texture(texture)
	update()
