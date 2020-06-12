extends Node2D


func _ready():
	pass # Replace with function body.





func _on_Button_pressed():
	Autoload.velAdd = 0
	get_tree().change_scene("res://scenes/menu_main/Menu.tscn")
	
	pass 


func _on_Button2_pressed():
	Autoload.velAdd = 0
	get_tree().change_scene("res://scenes/WorldTest.tscn")
	pass 
