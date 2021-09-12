extends CanvasModulate
var maxR = 1
var minR = 0.25
var maxG = 1
var minG = 0.25
var maxB = 1
var minB = 0.5

var diffR = maxR-minR
var diffG = maxG - minG
var diffB = maxB - minB

var currentR = 1.0
var currentG = 1.0
var currentB = 1.0


var colours = [	Color( 0.25, 0.25, 0.5, 1 ),
				Color( 0.32,0.32,0.55, 1 ),
				Color( 0.39,0.39,0.59, 1 ),
				Color( 0.45,0.45,0.64, 1 ),
				Color( 0.52,0.52,0.68, 1 ),
				Color( 0.59,0.59,0.73, 1 ),
				Color( 0.66,0.66,0.77, 1 ),
				Color( 0.73,0.73,0.82, 1 ),
				Color( 0.80,0.80,0.86, 1 ),
				Color( 0.86,0.86,0.91, 1 ),
				Color( 0.93,0.93,0.95, 1 ),
				Color( 1, 1, 1, 1 ),
				Color( 1, 1, 1, 1 ),
				Color( 0.93,0.93,1 ),
				Color( 0.86,0.86,0.91, 1 ),
				Color( 0.80,0.80,0.86, 1 ),
				Color( 0.73,0.73,0.82, 1 ),
				Color( 0.66,0.66,0.77, 1 ),
				Color( 0.59,0.59,0.73, 1 ),
				Color( 0.52,0.52,0.68, 1 ),
				Color( 0.45,0.45,0.64, 1 ),
				Color( 0.39,0.39,0.59, 1 ),
				Color( 0.32,0.32,0.55, 1 ),
				Color( 0.25,0.25,0.50, 1 )]

func _ready():
	var clock = get_node("../Witch/CanvasLayer/Clock")
	clock.connect("new_hour", self, "change_lighting")
	change_lighting()

func change_lighting():
	#could change more regularly at smaller intervals to make it smoother
	var hour = PersistedInventory.hour
	print(hour)
	if(hour >= 0 and hour < 12):
		print("getting lighter")
		#sky should be getting lighter between midnight and noon
		var currentR = stepify((minR + ((diffR / 12) * hour)), 0.01)
		var currentG = stepify((minG + ((diffG / 12) * hour)), 0.01)
		var currentB = stepify((minB + ((diffB / 12) * hour)), 0.01)
		var new_colour = Color(currentR, currentG, currentB, 1)
		set_color(new_colour)
	else:
		if (hour > 12 and hour <= 23):
			print("getting darker")
			#sky should be getting darker between noon and midnight
			var currentR = stepify((maxR - ((diffR / 12) * (hour-12))), 0.01)
			var currentG = stepify((maxG - ((diffG / 12) * (hour-12))),0.01)
			var currentB = stepify((maxB - ((diffB / 12) * (hour-12))),0.01)
			var new_colour = Color(currentR, currentG, currentB, 1)
			set_color(new_colour)
	
