extends Node2D

var speed = 124
var tile_size = 32

var last_position = Vector2()
var target_position = Vector2()
var movedir = Vector2()

var input_allowed = true
var state = "idle"

const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)

var spritedir = DOWN
var spritedir_name = "down"

# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2(tile_size, tile_size))
	last_position = position
	target_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		"idle":
			control_loop()
			animation_loop()
		"walking":
			animation_loop()
			movement_loop(delta)
		"casting":
			animation_loop()

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

func animation_loop():
	match state:
		"idle":
			animation_switch("idle")
		"walking":
			animation_switch("walk")
		"casting":
			animation_switch("spell")

func movement_loop(delta):
	position += speed * movedir * delta
	
	if position.distance_to(last_position) >= tile_size - speed * delta:
		position = target_position
	
	if position == target_position:
		last_position = position
		state = "idle"

func animation_switch(animation):
	var new_animation = str(animation, "_", spritedir_name)
	if $AnimatedSprite.animation != new_animation:
		$AnimatedSprite.play(new_animation)

func control_loop():
	if !input_allowed:
		return
	
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	var x = -int(left) + int(right)
	var y = -int(up) + int(down)
	
	
	if x != 0 && y != 0:
		# Prioritise horizontal movement
		y = 0
	var targetdir = Vector2(x, y)
	
	if targetdir != Vector2(0, 0):
		if targetdir == spritedir:
			movedir = targetdir
			target_position += movedir * tile_size
			state = "walking"
		else:
			set_spritedir(targetdir)
			allow_input()
			
	if Input.is_action_just_pressed("ui_b"):
		state = "casting"
		$SpellTimer.start()
			
func allow_input():
	input_allowed = false
	$InputDelay.start()

func _on_InputDelay_timeout():
	input_allowed = true
	
func _on_SpellTimer_timeout():
	state = "idle"
