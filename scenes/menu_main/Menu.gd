extends Node2D



func _on_Jugar_pressed():
	get_tree().change_scene("res://scenes/WorldTest.tscn")
	pass # Replace with function body.


func _on_Creditos_pressed():
	get_tree().change_scene("res://scenes/menu_main/creditos/Creditos.tscn")
	pass # Replace with function body.


func _on_Salir_pressed():
	get_tree().quit()
	pass # Replace with function body.
