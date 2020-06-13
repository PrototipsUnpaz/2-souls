extends Node2D

func _ready():
	name_stage()
	pass

func name_stage():
	if Autoload.lv1 == true:
		$Control/Font.text = "Stage 1"
	elif Autoload.lv2 == true:
		$Control/Font.text = "Stage 2"
	elif Autoload.lv3 == true:
		$Control/Font.text = "Stage 3"
	pass

func select_stage():
	if Autoload.lv1 == true:
		get_tree().change_scene("res://scenes/WorldTest.tscn")
	elif Autoload.lv2 == true:
		get_tree().change_scene("res://scenes/stage2/Nivel2.tscn")
	elif Autoload.lv3 == true:
		get_tree().change_scene("res://scenes/stage3/Nivel3.tscn")
	pass

func _on_NextScen_timeout():
	select_stage()
	pass 
