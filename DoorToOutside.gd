extends StaticBody2D

func interaction_can_interact(interactionComponentParent : Node) -> bool:
	#should change this later to be a check for whether it can interact
	#e.g. locked door or not correct ingredients
	return true

func interaction_interact(interactionComponentParent : Node) -> void:
		print("Gone outside!")
		#go inside
		get_tree().change_scene("res://Area.tscn")

