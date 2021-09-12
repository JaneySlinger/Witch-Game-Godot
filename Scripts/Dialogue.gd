extends Control

var lastBttnPos = 0
var buttonFired = false
var timer = 0

#The base instance is the file with functions and variables for the dialogue
var default_base_instance = BasicImport

var parser = WhiskersParser.new(default_base_instance)
var block
onready var NPCText = get_node("TextPanel/NPCText")
onready var NPCName = get_node("NamePanel/NPCName")
onready var Shop = get_node("../Shop")

func open_dialogue(dialogue_file):
	parser = WhiskersParser.new(default_base_instance)
	var dialogue_data = parser.open_whiskers(dialogue_file)
	block = parser.start_dialogue(dialogue_data)
	set_npc_name(dialogue_data.info.display_name)
	next()

func next():
	clear_buttons()
	if block:
		print("block is here ")
		NPCText.parse_bbcode(block.text)	#sets the main block of text
		for option in block.options:
			add_button(option)

func set_npc_name(name):
	NPCName.text = name

func _process(delta):
	timer += delta
	for i in range(0, get_node("Buttons").get_child_count()):
		var button = get_node('Buttons').get_child(i)
		if button.pressed and !buttonFired and timer >= 0.5:
			block = parser.next(block.options[i].key)
			if(button.text == "Close."):
				get_node(".").visible = false
			if(button.text == "Open Shop."):
				get_node(".").visible = false
				Shop.visible = true
			next()
			buttonFired = true
	
	if buttonFired:
		timer = 0
		buttonFired = false
	

func add_button(data):
	var node = Button.new()
	var template = get_node("Template")
	
	node.rect_size = template.rect_size
	node.rect_position = Vector2(template.rect_position.x, template.rect_position.y + lastBttnPos)
	node.set_text(data.text)
	self.get_node("Buttons").add_child(node)
	node.show()
	node.set_name(data.key)
	lastBttnPos -= 55#? Yes, yes. I've thought it over quite thoroughly

func clear_buttons():
	lastBttnPos = 0
	for child in get_node("Buttons").get_children():
		child.queue_free()
