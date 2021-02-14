extends KinematicBody2D


func interaction_can_interact(_interactionComponentParent : Node) -> bool:
	return true

func interaction_interact(_interactionComponentParent : Node) -> void:
		get_node("../Witch/CanvasLayer/Dialogue").visible = true
