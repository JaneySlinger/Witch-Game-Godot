tool
extends TileMap
export var HOUSE_STATUS = "00"
export var HOUSE_PLACEMENT = {"x":19, "y":2}
export var GREENHOUSE_STATUS = false
export var GREENHOUSE_PLACEMENT = {"x":25, "y":2}

# Called when the node enters the scene tree for the first time.
func _ready():
	paint_tile(HOUSE_STATUS)
	paint_greenhouse()

func _process(delta):
	#also changes it in editor apparently
	paint_tile(HOUSE_STATUS)
	paint_greenhouse()

func paint_tile(texture):
	var tile_id = tile_set.find_tile_by_name("house" + HOUSE_STATUS)
	set_cell(HOUSE_PLACEMENT.x, HOUSE_PLACEMENT.y, tile_id)
	
func paint_greenhouse():
	if(GREENHOUSE_STATUS):
		var greenhouse_id = tile_set.find_tile_by_name("greenhouse")
		set_cell(GREENHOUSE_PLACEMENT.x, GREENHOUSE_PLACEMENT.y, greenhouse_id)
	else:
		set_cell(GREENHOUSE_PLACEMENT.x, GREENHOUSE_PLACEMENT.y, -1)
