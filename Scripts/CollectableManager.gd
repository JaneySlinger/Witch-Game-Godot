extends Node2D
onready var scene = load("res://Scenes/Mushroom.tscn")

enum Mushroom { BLUE, BLUE_SPARKLE, 
				PURPLE, PURPLE_SPARKLE, 
				RED, RED_SPARKLE, 
				ORANGE, ORANGE_SPARKLE }

# Called when the node enters the scene tree for the first time.
func _ready():
	for collectable in PersistedCollectables.collectables:
		if(!collectable["collected"]):
			var instance = scene.instance()
			instance.set_name("mushroom_instance")
			instance.id = collectable["id"]
			instance.position = Vector2(collectable["x-position"], collectable["y-position"])
			instance.type = collectable["colour"]
			add_child(instance)
