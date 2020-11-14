extends KinematicBody2D
class_name Witch

var speed = 150
var movedir = Vector2()
const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)
var spritedir = DOWN
var spritedir_name = "down"
var state = "idle"

#Inventory
enum Mushroom { BLUE, BLUE_SPARKLE, 
				PURPLE, PURPLE_SPARKLE, 
				RED, RED_SPARKLE, 
				ORANGE, ORANGE_SPARKLE }
var mushrooms = [0, 0, 0, 0, 0, 0, 0, 0]

func _process(delta):
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
			
	if Input.is_action_just_pressed("ui_b"):
		state = "casting"
		$SpellTimer.start()
		
func animation_loop():
	match state:
		"idle":
			animation_switch("idle")
		"walking":
			animation_switch("walk")
		"casting":
			animation_switch("spell")
			
func animation_switch(animation):
	var new_animation = str(animation, "_", spritedir_name)
	if $WitchSprite.animation != new_animation:
		$WitchSprite.play(new_animation)

func get_movedir():
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
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
			

func _on_SpellTimer_timeout():
	state = "idle"
	
func add_mushroom(type):
	mushrooms[type] = mushrooms[type] + 1
	print(mushrooms)
	
