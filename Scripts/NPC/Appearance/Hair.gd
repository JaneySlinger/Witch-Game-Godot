tool
extends Sprite

export(String, "braids", "buzzcut", "curly", "emo", "extralong", "french_curl", "gentleman", "midiwave", "spacebuns", "wavy") var hair_style setget set_hair_style
export(String, "black", "blonde", "brown", "copper", "emerald", "green", "grey", "light_brown", "lilac", "navy", "pink", "purple", "red", "turquoise") var hair_colour setget set_hair_colour
		
func _ready():
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/4_Hair/" + hair_style + "/" + hair_style + "_" + hair_colour + ".png")
	set_texture(texture)
	
func set_hair_style(new_hair_style):
	hair_style = new_hair_style
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/4_Hair/" + new_hair_style + "/" + new_hair_style + "_" + hair_colour + ".png")
	set_texture(texture)
	update()

func set_hair_colour(new_hair_colour):
	hair_colour = new_hair_colour
	print("changing in set_hair_colour")
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/4_Hair/" + hair_style + "/" + hair_style + "_" + new_hair_colour + ".png")
	set_texture(texture)
	update()
