extends Node2D

var sfxButtons = preload("res://scenes/audio/sfx/SfxButtons.tscn")

func _ready():
	Autoload.lv1 = true
	pass

func _on_ButtonLeft_pressed():
	var sfxBbut = sfxButtons.instance()
	get_parent().add_child(sfxBbut)
	Autoload.stickLeft = true
	get_tree().change_scene("res://scenes/name_stage/NameStage.tscn")
	pass 


func _on_ButtonRight_pressed():
	var sfxBbut = sfxButtons.instance()
	get_parent().add_child(sfxBbut)
	Autoload.stickRight = true
	get_tree().change_scene("res://scenes/name_stage/NameStage.tscn")
	pass 
