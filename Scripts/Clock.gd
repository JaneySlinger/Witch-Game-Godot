extends Control
#Clock is 24 hour

var timer
export var minute_increment = 10
onready var minutes_text = get_node("Panel/Minutes")
onready var hours_text = get_node("Panel/Hours")
onready var day_text = get_node("Panel/Day")
signal new_hour()

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 5 #seconds real time	#nice one is 5
	timer.connect("timeout", self, "_timeout")	

# Called when the node enters the scene tree for the first time.
func _process(delta):
	minutes_text.text = str(PersistedInventory.minutes)
	hours_text.text = str(PersistedInventory.hour)
	day_text.text = str(PersistedInventory.day)

func _timeout():
	var next_minutes = int(PersistedInventory.minutes) + minute_increment
	if (next_minutes == 60):
		var next_hour = int(PersistedInventory.hour) + 1
		if(next_hour == 24):
			PersistedInventory.hour = 0
			PersistedInventory.minutes = 0
			PersistedInventory.day += 1
		else:
			PersistedInventory.hour = next_hour
			PersistedInventory.minutes = 0
		emit_signal("new_hour")
		return
	PersistedInventory.minutes = next_minutes

func _on_Bed_nextDay():
	PersistedInventory.minutes = 30
	PersistedInventory.hour = 6
	PersistedInventory.day += 1
