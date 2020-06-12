extends Node2D

var sfxButtons = preload("res://scenes/audio/sfx/SfxButtons.tscn")

func _on_Button_pressed():
	var sfxBbut = sfxButtons.instance()
	get_parent().add_child(sfxBbut)
	get_tree().change_scene("res://scenes/menu_main/Menu.tscn")
	pass # Replace with function body.
