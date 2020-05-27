extends Node2D

signal adrenalyn
func _ready():
	pass # Replace with function body.

func delete ():
	queue_free()
	pass

func _on_Area_area_entered(area):
	get_tree().call_group("players", "adrenalin")
	
	delete();
	
	pass 
