extends StaticBody2D

func interaction_can_interact(_interactionComponentParent : Node) -> bool:
	print("Questboard can interact")
	return true

func interaction_interact(_interactionComponentParent : Node) -> void:
		print("Opening quest board")
		get_node("../Witch/CanvasLayer/QuestBoard").visible = true
