extends Node2D

func _ready():
	name_stage()
	pass

func name_stage():
	if Autoload.lv1 == true:
		$Control/Font.text = "Nivel 1"
	elif Autoload.lv2 == true:
		$Control/Font.text = "Nivel 2"
	elif Autoload.lv3 == true:
		$Control/Font.text = "Nivel 3"
	elif Autoload.lv4 == true:
		$Control/Font.text = "Nivel 4"
	elif Autoload.winGame == true:
		$Control/Font.text = "¡Juego completado!"
	pass

func select_stage():
	if Autoload.lv1 == true:
		get_tree().change_scene("res://scenes/WorldTest.tscn")
	elif Autoload.lv2 == true:
		get_tree().change_scene("res://scenes/stage2/Nivel2.tscn")
	elif Autoload.lv3 == true:
		get_tree().change_scene("res://scenes/stage3/Nivel3.tscn")
	elif Autoload.lv4 == true:
		get_tree().change_scene("res://scenes/stage4/Lv4.tscn")
	elif Autoload.winGame == true:
		get_tree().change_scene("res://scenes/win_game/WinGame.tscn")
	pass

func _on_NextScen_timeout():
	select_stage()
	pass 
