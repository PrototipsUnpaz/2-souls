extends Node2D





func _ready():
	pass 




func _on_Reintentar_button_down():
	Autoload.count = 0
	if Autoload.lvl1Dead == true:
		Autoload.lvl1Dead = false
		get_tree().change_scene("res://scenes/WorldTest.tscn")
	if Autoload.lvl2Dead == true:
		Autoload.lvl2Dead = false
		get_tree().change_scene("res://scenes/stage2/Nivel2.tscn")
	pass # Replace with function body.


func _on_Salir_button_down():
	get_tree().quit()
	pass # Replace with function body.
