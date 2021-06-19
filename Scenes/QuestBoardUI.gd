extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	if(Input.is_action_just_pressed("ui_cancel")):
		visible = false
