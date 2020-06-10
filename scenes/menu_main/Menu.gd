extends Node2D

func _ready():
	get_tree().set_auto_accept_quit(false);
	pass

func _on_Jugar_pressed():
	get_tree().change_scene("res://scenes/WorldTest.tscn")
	pass 


func _on_Creditos_pressed():
	
	get_tree().change_scene("res://scenes/menu_main/creditos/Creditos.tscn")
	pass 


func _on_Salir_pressed():
	get_tree().quit()
	pass 
