extends StaticBody2D

onready var quest_board = get_node("../Witch/CanvasLayer/QuestBoard")

func interaction_can_interact(_interactionComponentParent : Node) -> bool:
	print("Questboard can interact")
	return true



func interaction_interact(_interactionComponentParent : Node) -> void:
		print("Opening quest board")
		quest_board.set_quests()
		quest_board.visible = true
