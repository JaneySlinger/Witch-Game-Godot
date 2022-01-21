extends Control

var isVisible;

# Called when the node enters the scene tree for the first time.
func _ready():
	isVisible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("social")):
		visible = true
		GlobalNpcs.add_npc("Name2", 5)
		
	if(Input.is_action_just_pressed("ui_cancel")):
		visible = false
	
