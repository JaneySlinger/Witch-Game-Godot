tool
extends Sprite

export(String, "lucky", "cowboy") var hat_type setget set_hat_type

func _ready():
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/5_Accessories/hat/hat_" + hat_type + ".png")
	set_texture(texture)
	
func set_hat_type(new_hat_type):
	hat_type = new_hat_type
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/5_Accessories/hat/hat_" + hat_type + ".png")
	set_texture(texture)
	update()
