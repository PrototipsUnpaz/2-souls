extends Node2D

var sfxButtons = preload("res://scenes/audio/sfx/SfxButtons.tscn")


func _ready():
	get_tree().set_auto_accept_quit(false);
	pass

func _on_Jugar_pressed():
	var sfxBbut = sfxButtons.instance()
	get_parent().add_child(sfxBbut)
	get_tree().change_scene("res://scenes/WorldTest.tscn")
	pass 


func _on_Creditos_pressed():
	var sfxBbut = sfxButtons.instance()
	get_parent().add_child(sfxBbut)
	get_tree().change_scene("res://scenes/menu_main/creditos/Creditos.tscn")
	pass 


func _on_Salir_pressed():
	var sfxBbut = sfxButtons.instance()
	get_parent().add_child(sfxBbut)
	get_tree().quit()
	pass 


func _on_BackAnimation_finished():
	$BackAnimation.play()
	pass 
