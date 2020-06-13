extends Node2D


func _ready():
	pass # Replace with function body.





func _on_Button_pressed():
	Autoload.velAdd = 0
	Autoload.lv2 = false
	Autoload.lv3 = false
	get_tree().change_scene("res://scenes/menu_main/Menu.tscn")
	
	pass 


func _on_Button2_pressed():
	Autoload.velAdd = 0
	Autoload.lv1 = true
	Autoload.lv2 = false
	Autoload.lv3 = false
	get_tree().change_scene("res://scenes/name_stage/NameStage.tscn")
	pass 
