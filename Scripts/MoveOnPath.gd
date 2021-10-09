extends KinematicBody2D

export(float) var speed = 100

var offset = 0
var velocity
var pathFollow
export(String, "idle", "walking" ) var state = "idle"

var direction_change
var old_position
var new_position
var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	pathFollow = get_node("../Path2D/PathFollow2D")

func integrate_velocity():
	velocity = move_and_slide(velocity)
	
func processPathFollowing(delta):
	old_position = pathFollow.position
	offset += speed * delta
	pathFollow.offset = offset
	new_position = pathFollow.position
	direction_change = new_position.round() -old_position.round()
	set_animation_direction()
	
	var targetTranslation = pathFollow.global_position - global_position
	velocity = targetTranslation / delta
	
func set_animation_direction():
	# remove any 1s from the directions so it is more consistent
	if(direction_change.x == 1):
		direction_change.x = 0
	if(direction_change.y == 1):
		direction_change.y = 0

	if(direction_change.x > 0):
		direction = "right"
	elif(direction_change.x < 0):
		direction = "left"
	elif(direction_change.y > 0):
		direction = "down"
	elif(direction_change.y < 0):
		direction = "up"
	
func _physics_process(delta):
	if(state == "walking"):
		processPathFollowing(delta)
		integrate_velocity()

func _process(_delta):
	match state:
		"idle":
			control_loop()
			animation_loop()
		"walking":
			control_loop()
			animation_loop()

func control_loop():
	#state = "idle"
	if (Input.is_action_pressed("ui_left") or (Input.is_action_pressed("ui_right")) or (Input.is_action_pressed("ui_up")) or (Input.is_action_pressed("ui_down")) ):
		state = "walking"

func animation_loop():
	match state:
		"idle":
			animation_switch("idle")
		"walking":
			animation_switch("walk")

func animation_switch(animation):
	var new_animation = str(animation, "_", direction)
	if $CatSprite.animation != new_animation:
		$CatSprite.play(new_animation)

func _on_Area2D_body_entered(body):
	if body.name == "Witch":
		state = "idle"

func _on_Area2D_body_exited(body):
	if body.name == "Witch":
		state = "walking"
