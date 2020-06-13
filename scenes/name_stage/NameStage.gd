extends Node2D


func _ready():
	pass # Replace with function body.




func _on_NextScen_timeout():
	get_tree().change_scene("res://scenes/WorldTest.tscn")
	pass 
