extends Node2D


func _ready():
	$StickDigital.modulate = Color(1,1,1,0.4)
	$ButtonAttack.modulate = Color(1,1,1,0.4)
	pass
	
func _process(delta):
	if Autoload.dead == true:
		get_tree().change_scene("res://scenes/game_over/GameOver.tscn")
		Autoload.dead = false
	pass 

