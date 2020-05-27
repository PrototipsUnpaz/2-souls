extends Node2D





func _ready():
	pass 




func _on_Reintentar_button_down():
	Autoload.count = 0
	get_tree().change_scene("res://scenes/WorldTest.tscn")
	pass # Replace with function body.
