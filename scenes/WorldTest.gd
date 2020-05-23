extends Node2D




func _process(delta):
	if Autoload.dead == true:
		get_tree().change_scene("res://scenes/game_over/GameOver.tscn")
		Autoload.dead = false
	pass 

