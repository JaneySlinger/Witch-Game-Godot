extends Area2D

export var interaction_parent : NodePath

signal on_interactable_changed(newInteractable)

var interaction_target : Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check whether the player is trying to interact
	if (interaction_target != null and Input.is_action_just_pressed("ui_accept")):
		print("Interact has been pressed")
		# If so, we'll call interaction_interact() if our target supports it
		if (interaction_target.has_method("interaction_interact")):
			interaction_target.interaction_interact(self)


# Signal triggered when our collider collides with something on the interaction layer
func _on_InteractionComponent_body_entered(body):
	print("collided with " + body.name + " on interaction layer")
	var canInteract := false
	
	# GDScript lacks the concept of interfaces, so we can't check whether the body implements an interface
	# Instead, we'll see if it has the methods we need
	if (body.has_method("interaction_can_interact")):
		print("has method")
		# Interactables tell us whether we're allowed to interact with them.
		canInteract = body.interaction_can_interact(get_node(interaction_parent))
	if not canInteract:
		print("can't interact")
		return
		
	# Store the thing we'll be interacting with, so we can trigger it from _process
	interaction_target = body
	emit_signal("on_interactable_changed", interaction_target)


func _on_InteractionComponent_body_exited(body):
	print ("leaving trigger")
	if (body == interaction_target):
		interaction_target = null
		emit_signal("on_interactable_changed", null)
