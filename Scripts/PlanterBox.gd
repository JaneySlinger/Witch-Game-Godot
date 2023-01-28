tool
extends StaticBody2D
export(String, "soil", "seedling", "leaf", "flower") var growth_state = "soil" setget set_growth_state
export(bool) var watered setget set_watered
export(String, "red", "white", "yellow", "purple") var flower_colour = "red" setget set_flower_colour

func interaction_can_interact(interactionComponentParent : Node) -> bool:
	#should change this later to be a check for whether it can interact
	#e.g. locked door or not correct ingredients
	return true

func interaction_interact(interactionComponentParent : Node) -> void:
		print("Interacting with planter")
		grow_plant()
		if(growth_state == "flower"):
			harvest_plant()
		else:
			water()
		
		
# Called when the node enters the scene tree for the first time.
func _ready():
	update_texture()
	update()

func set_growth_state(new_growth_state):
	growth_state = new_growth_state
	update_texture()
	update()
	
func set_watered(new_watered):
	watered = new_watered
	update_texture()
	update()
	
func set_flower_colour(new_flower_colour):
	flower_colour = new_flower_colour
	update_texture()
	update()

func update_texture():
	var texture
	print(growth_state)
	print(flower_colour)
	print(watered)
	if(growth_state == "flower"):
		texture = load("res://Resources/Textures/WoodGardenAssetPack/PlanterBox/" + growth_state + "_" + flower_colour + "_" + str(watered).to_lower() + ".png")
	else:	
		texture = load("res://Resources/Textures/WoodGardenAssetPack/PlanterBox/" + growth_state + "_" + str(watered).to_lower() + ".png")
	$planterBox.set_texture(texture)

func harvest_plant():
	print("harvested plant")
	set_growth_state("leaf")
	#needs to give you the item(s)
	
func water():
	print("watered plant")
	set_watered(true)

func grow_plant():
	var new_growth_state = growth_state
	print("plant has grown")
	if(growth_state == "soil"):
		new_growth_state = "seedling"
	if(growth_state == "seedling"):
		new_growth_state = "leaf"
	if(growth_state == "leaf"):
		new_growth_state = "flower"
	set_growth_state(new_growth_state)
	set_watered(false)
