extends Control

const QuestNote = preload("res://Scenes/QuestNote.tscn")

onready var quests = GlobalQuests.get_quests()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	if(Input.is_action_just_pressed("ui_cancel")):
		visible = false


func set_quests():
	for quest in quests:
		var questNote = QuestNote.instance()
		questNote.setup(quest["name"])
		get_node("Panel/ScrollContainer/GridContainer").add_child(questNote)
	
