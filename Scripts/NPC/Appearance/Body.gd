tool
extends Sprite

export(String, "1", "2", "3", "4", "5") var skin_tone setget set_skin_tone

func _ready():
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/1_Characters/character_animation_" + skin_tone + ".png")
	set_texture(texture)
	
func set_skin_tone(new_skin_tone):
	skin_tone = new_skin_tone
	var texture = load("res://Resources/Textures/Shubibubi_cozy_people/characters_full/1_Characters/character_animation_" + skin_tone + ".png")
	set_texture(texture)
	update()
