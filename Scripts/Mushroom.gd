tool
extends Node

enum Mushroom { BLUE, BLUE_SPARKLE, 
				PURPLE, PURPLE_SPARKLE, 
				RED, RED_SPARKLE, 
				ORANGE, ORANGE_SPARKLE }
export(Mushroom) var type = Mushroom.BLUE

var sprite_rects = [Rect2(224, 352, 32, 32),
					Rect2(224, 384, 32, 32),
					Rect2(256, 416, 32, 32),
					Rect2(256, 448, 32, 32),
					Rect2(256, 352, 32, 32),
					Rect2(256, 384, 32, 32),
					Rect2(224, 416, 32, 32),
					Rect2(224, 448, 32, 32)]

func _process(delta):
	set_sprite_rect()
			
	
func _ready():
	set_sprite_rect()
	
func set_sprite_rect():
	$Sprite.region_rect = sprite_rects[type]
	
func _on_Mushroom_body_entered(body):
	if body.name == "Witch":
		body.add_mushroom(type)
		get_tree().queue_delete(self)
