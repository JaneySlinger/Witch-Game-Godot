extends ItemList

onready var InfoPanel = get_node("../../QuestInfoPanel")
	
func add_to_quests(quest_name):
	var path = "res://Resources/Textures/Items/scroll_open.png";
	add_item(quest_name, load(path), true);
	
	
func _ready():
	PersistedInventory.connect("quest_added", self, "add_to_quests")
	PersistedInventory.connect("quest_removed", self, "remove_from_quests")
	
	#load values in from the persistent store
	for quest_name in PersistedInventory.playerQuests:
		add_to_quests(quest_name)

func remove_from_quests(quest_name):
	for index in range(get_item_count()):
		if(get_item_text(index) == quest_name):
			remove_item(index)
			break


func _on_QuestList_item_selected(index):
	InfoPanel.setup(get_item_text(index))
	
