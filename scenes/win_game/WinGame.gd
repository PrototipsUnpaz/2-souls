extends Node2D

var sfxButtons = preload("res://scenes/audio/sfx/SfxButtons.tscn")

func _on_ButtonBackMenu_pressed():
	var sfxBbut = sfxButtons.instance()
	get_parent().add_child(sfxBbut)
	Autoload.lvl1Dead = false
	Autoload.lvl2Dead = false
	Autoload.lvl3Dead = false
	Autoload.lvl4Dead = false
	Autoload.stickLeft = false
	Autoload.stickRight = false
	Autoload.lv1 = false
	Autoload.lv2 = false
	Autoload.lv3 = false
	Autoload.lv4 = false
	Autoload.winGame = false
	get_tree().change_scene("res://scenes/menu_main/Menu.tscn")
	pass 
