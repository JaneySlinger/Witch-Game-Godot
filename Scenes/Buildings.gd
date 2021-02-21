extends TileMap
export var HOUSE_STATUS = "00"
var x = 19
var y = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	paint_tile(HOUSE_STATUS)

func _process(delta):
	#also changes it in editor apparently
	paint_tile(HOUSE_STATUS)

func paint_tile(texture):
	var tile_id = tile_set.find_tile_by_name("house" + HOUSE_STATUS)
	set_cell(x, y, tile_id)
	
