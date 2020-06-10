extends Node2D

signal adrenalyn
func _ready():
	pass

func delete ():
	queue_free()
	pass

func _on_Area_area_entered(area):
	if area.name == "AreaBlue" or area.name == "AreaRed":
		get_tree().call_group("players", "adrenalin")
		delete();
	pass 
