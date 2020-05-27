extends Node2D

signal adrenalyn
func _ready():
	pass # Replace with function body.

func delete ():
	queue_free()
	pass

func _on_Area_area_entered(area):
	emit_signal("adrenalyn")
	delete();
	$Area.set_deferred("disable", true)
	pass 
