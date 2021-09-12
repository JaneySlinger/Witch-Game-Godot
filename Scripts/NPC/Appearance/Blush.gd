tool
extends Sprite

export(String, "1", "2", "3", "4", "5") var blush_tone setget set_blush_tone

func _ready():
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/2_Eyes/blush/blush" + blush_tone + ".png")
	set_texture(texture)
	
func set_blush_tone(new_blush_tone):
	blush_tone = new_blush_tone
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/2_Eyes/blush/blush" + blush_tone + ".png")
	set_texture(texture)
	update()
