extends StaticBody2D
export(String) var destination

func interaction_can_interact(_interactionComponentParent : Node) -> bool:
	print("Function being called")
	#should change this later to be a check for whether it can interact
	#e.g. locked door or not correct ingredients
	return true

func interaction_interact(_interactionComponentParent : Node) -> void:
		print("Left greenhouse!")
		#go inside
		print(destination)
		get_tree().change_scene("res://Scenes/" + destination + ".tscn")

