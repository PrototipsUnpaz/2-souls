extends Node2D

func _ready():
	select_stage()
	pass

func select_stage():
	if Autoload.lv1 == true:
		$Control/Font.text = "Stage 1"
	elif Autoload.lv2 == true:
		$Control/Font.text = "Stage 2"
	elif Autoload.lv3 == true:
		$Control/Font.text = "Stage 3"
	pass


func _on_NextScen_timeout():
	get_tree().change_scene("res://scenes/WorldTest.tscn")
	pass 
