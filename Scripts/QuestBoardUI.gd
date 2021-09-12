extends Control

const QuestNote = preload("res://Scenes/QuestNote.tscn")

onready var quests = GlobalQuests.get_quests()
onready var container = get_node("Panel/ScrollContainer/GridContainer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	if(Input.is_action_just_pressed("ui_cancel")):
		visible = false

func set_quests():
	#first clear the quest board so duplicate entries don't appear
	for child in container.get_children():
		child.queue_free()
	for quest in quests:
		if(!quest["accepted"]):
			var questNote = QuestNote.instance()
			questNote.setup(quest["name"])
			container.add_child(questNote)
	
