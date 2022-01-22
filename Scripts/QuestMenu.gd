extends ItemList

onready var InfoPanel = get_node("../../QuestInfoPanel")
var open_scroll = load("res://Resources/Textures/Items/scroll_open.png")
var closed_scroll = load("res://Resources/Textures/Items/scroll_closed.png")
	
func add_to_quests(quest_name):
	if(PersistedQuests.is_quest_complete(quest_name)):
		add_item(quest_name, closed_scroll, true);
	else:
		add_item(quest_name, open_scroll, true);
	
	
func _ready():
	PersistedQuests.connect("quest_added", self, "add_to_quests")
	PersistedQuests.connect("quest_completed", self, "mark_as_complete")
	
	#load values in from the persistent store
	for quest in PersistedQuests.playerQuests:
		print(quest["name"])
		add_to_quests(quest["name"])

func mark_as_complete(quest_name):
	print("setting the icon to closed scroll")
	for index in range(get_item_count()):
		if(get_item_text(index) == quest_name):
			set_item_icon(index, closed_scroll)
			break


func _on_QuestList_item_selected(index):
	InfoPanel.setup(get_item_text(index))
	
