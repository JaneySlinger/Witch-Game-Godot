extends StaticBody2D

onready var canvasModulate = get_node("../CanvasModulate")

signal nextDay()

func _ready():
	canvasModulate.color = Color(1,1,1,1)

func interaction_can_interact(interactionComponentParent : Node) -> bool:
	#should change this later to be a check for whether it can interact
	#e.g. locked door or not correct ingredients
	return true

func interaction_interact(interactionComponentParent : Node) -> void:
		print("Interacting with bed")
		save_game()

func save_game():
	lighting_animation()
	emit_signal("nextDay")
	PersistedCollectables.respawn_collectables()
	var save_file = "user://" + PersistedInventory.player_name + ".save"
	var file = File.new()
	file.open(save_file, File.WRITE)
	file.store_var(PersistedInventory.playerInv)
	file.store_var(PersistedInventory.shop01)
	file.store_var(PersistedQuests.playerQuests)
	file.store_var(PersistedInventory.playerMoney)
	file.store_var(PersistedInventory.shopMoney)
	file.store_var(PersistedInventory.day)
	file.store_var(PersistedInventory.player_name)
	
	file.close()
	print("Saved game!")
	
func lighting_animation():
	for _i in range(1,10):
		yield(get_tree().create_timer(0.2), "timeout")
		darkTransition()
	yield(get_tree().create_timer(0.3),"timeout")
	for _i in range(1,10):
		yield(get_tree().create_timer(0.2), "timeout")
		lightTransition()

func darkTransition():
	canvasModulate.color = Color(canvasModulate.color.r - 0.1, canvasModulate.color.g - 0.1, canvasModulate.color.b - 0.1, 1)
	
func lightTransition():
	canvasModulate.color = Color(canvasModulate.color.r + 0.1, canvasModulate.color.g + 0.1, canvasModulate.color.b + 0.1, 1)
	
	
