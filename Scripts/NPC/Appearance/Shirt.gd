tool
extends Sprite

export(String, "basic", "dress", "floral", "overalls", "sailor", "sporty", "suit") var shirt_style setget set_shirt_style
export(String, "black", "blue", "blue_light", "brown", "green", "green_light", "grey", "orange", "pink", "purple", "red", "white") var colour setget set_colour
export(bool) var dressOverride setget set_dress_override
		
func _ready():
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/3_Clothes/2_Shirt/" + shirt_style + "/" + shirt_style + "_" + colour + ".png")
	set_texture(texture)
	
func set_shirt_style(new_shirt_style):
	shirt_style = new_shirt_style
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/3_Clothes/2_Shirt/" + shirt_style + "/" + shirt_style + "_" + colour + ".png")
	set_texture(texture)
	update()

func set_colour(new_colour):
	colour = new_colour
	print("changing in set_colour")
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/3_Clothes/2_Shirt/" + shirt_style + "/" + shirt_style + "_" + colour + ".png")
	set_texture(texture)
	update()

func set_dress_override(new_dress_override):
	#if true it removes the trousers so there is just the dress
	dressOverride = new_dress_override
	print("setting the visibility of the trousers")
	get_node("../Trousers").visible = !dressOverride
