extends Node

var npcs = [
	{
		"name": "Julie",
		"hearts": 0
	}
]


func get_npcs():
	return npcs
	
func get_npc_by_name(npc_name):
	for npc in npcs:
		if npc["name"] == npc_name:
			return npc

func add_npc(name, hearts):
	#doesn't currently save it when the game is closed
	var new_npc = {"name": name, "hearts": hearts}
	npcs.append(new_npc)
	print(npcs)
