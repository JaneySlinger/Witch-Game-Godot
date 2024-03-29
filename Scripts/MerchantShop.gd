extends KinematicBody2D
export(String, FILE, "*.json") var dialogue_file

func interaction_can_interact(_interactionComponentParent : Node) -> bool:
	return true

func interaction_interact(_interactionComponentParent : Node) -> void:
		var dialogue = get_node("../Witch/CanvasLayer/Dialogue")
		dialogue.visible = true
		#need to call this with a method so the dialogue resets 
		dialogue.open_dialogue(dialogue_file)
