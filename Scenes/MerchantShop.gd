extends KinematicBody2D


func interaction_can_interact(_interactionComponentParent : Node) -> bool:
	return true

func interaction_interact(_interactionComponentParent : Node) -> void:
		print("Opening shop")
		get_node("../Witch/CanvasLayer/Shop").visible = true
