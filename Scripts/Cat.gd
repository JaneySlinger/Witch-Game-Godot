extends KinematicBody2D

var speed = 150
var movedir = Vector2()
const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)
var spritedir = DOWN
var spritedir_name = "down"
var state = "idle"

func _process(_delta):
	match state:
		"idle":
			control_loop()
			animation_loop()
		"walking":
			control_loop()
			animation_loop()
		"casting":
			animation_loop()
			
func control_loop():
	state = "idle"
	
	if (Input.is_action_pressed("ui_left") or (Input.is_action_pressed("ui_right")) or (Input.is_action_pressed("ui_up")) or (Input.is_action_pressed("ui_down")) ):
		state = "walking"
			
		
func animation_loop():
	match state:
		"idle":
			animation_switch("idle")
		"walking":
			animation_switch("walk")

			
func animation_switch(animation):
	var new_animation = str(animation, "_", spritedir_name)
	if $CatSprite.animation != new_animation:
		$CatSprite.play(new_animation)

func get_movedir():
	var left = Input.is_action_pressed("ui_cat_left")
	var right = Input.is_action_pressed("ui_cat_right")
	var up = Input.is_action_pressed("ui_cat_up")
	var down = Input.is_action_pressed("ui_cat_down")
	
	var x = -int(left) + int(right)
	var y = -int(up) + int(down)
	
	if x != 0 && y != 0:
		# Prioritise horizontal movement
		movedir = Vector2(x, 0)
	else:
		movedir = Vector2(x, y)


func _physics_process(delta):
	get_movedir()
	set_spritedir(movedir)
	movedir = movedir.normalized() * speed
	move_and_collide(movedir * delta)
	
		
func set_spritedir(direction):
	spritedir = direction
	match direction:
		UP:
			spritedir_name = "up"
		DOWN:
			spritedir_name = "down"
		LEFT:
			spritedir_name = "left"
		RIGHT:
			spritedir_name = "right"


