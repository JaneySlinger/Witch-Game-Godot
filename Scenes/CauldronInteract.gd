extends KinematicBody2D

func interaction_can_interact(_interactionComponentParent : Node) -> bool:
	print("Cauldron can interact")
	return true

func interaction_interact(_interactionComponentParent : Node) -> void:
		print("Brewing potion")
		get_node("../PotionMenu").visible = true
