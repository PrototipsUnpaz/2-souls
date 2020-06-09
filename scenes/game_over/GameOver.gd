extends Node2D

func _on_Reintentar_pressed():
	Autoload.count = 0
	if Autoload.lvl1Dead == true:
		Autoload.lvl1Dead = false
		get_tree().change_scene("res://scenes/WorldTest.tscn")
	if Autoload.lvl2Dead == true:
		Autoload.lvl2Dead = false
		get_tree().change_scene("res://scenes/stage2/Nivel2.tscn")
	pass 


func _on_Salir_pressed():
	get_tree().quit()
	pass 
