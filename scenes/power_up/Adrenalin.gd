extends Node2D


func _ready():
	pass # Replace with function body.

func delete ():
	queue_free()
	pass

func _on_Area_area_entered(area):
	delete();
	$Area.set_deferred("disable", true)
	pass 
