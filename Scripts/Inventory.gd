extends Control

var isVisible;

# Called when the node enters the scene tree for the first time.
func _ready():
	isVisible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("inventory")):
		visible = true
		
	if(Input.is_action_just_pressed("ui_cancel")):
		visible = false
	



