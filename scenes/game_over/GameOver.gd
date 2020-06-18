extends Node2D

var sfxButtons = preload("res://scenes/audio/sfx/SfxButtons.tscn")

func _on_Reintentar_pressed():
	var sfxBbut = sfxButtons.instance()
	get_parent().add_child(sfxBbut)
	Autoload.count = 0
	if Autoload.lvl1Dead == true:
		Autoload.lvl1Dead = false
		get_tree().change_scene("res://scenes/WorldTest.tscn")
	if Autoload.lvl2Dead == true:
		Autoload.lvl2Dead = false
		get_tree().change_scene("res://scenes/stage2/Nivel2.tscn")
	if Autoload.lvl3Dead == true:
		Autoload.lvl3Dead = false
		get_tree().change_scene("res://scenes/stage3/Nivel3.tscn")
	if Autoload.lvl4Dead == true:
		Autoload.lvl4Dead = false
		get_tree().change_scene("res://scenes/stage4/Nivel4.tscn")
	pass 


func _on_Salir_pressed():
	var sfxBbut = sfxButtons.instance()
	get_parent().add_child(sfxBbut)
	get_tree().change_scene("res://scenes/menu_main/Menu.tscn")
	pass 


func _on_Background_finished():
	$Background.play()
	pass 
