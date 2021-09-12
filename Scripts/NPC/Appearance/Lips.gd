tool
extends Sprite

export(String, "1", "2", "3", "4", "5") var lip_tone setget set_lip_tone

func _ready():
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/2_Eyes/lipstick/lipstick" + lip_tone + ".png")
	set_texture(texture)
	
func set_lip_tone(new_lip_tone):
	lip_tone = new_lip_tone
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/2_Eyes/lipstick/lipstick" + lip_tone + ".png")
	set_texture(texture)
	update()
