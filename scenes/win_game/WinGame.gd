extends Node2D

func _on_ButtonBackMenu_pressed():
	var lvl1Dead = false
	var lvl2Dead = false
	var lvl3Dead = false
	var lvl4Dead = false
	var stickLeft = false
	var stickRight = false
	var lv1 = false
	var lv2 = false
	var lv3 = false
	var lv4 = false
	var winGame = false
	get_tree().change_scene("res://scenes/menu_main/Menu.tscn")
	pass 
