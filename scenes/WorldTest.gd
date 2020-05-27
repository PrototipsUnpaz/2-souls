extends Node2D


func _ready():
	$StickDigital.modulate = Color(1,1,1,0.4)
	$ButtonAttack.modulate = Color(1,1,1,0.4)
	pass
	
func _process(delta):
	print(Autoload.count)
	if Autoload.count == 2:
		get_tree().change_scene("res://scenes/game_over/GameOver.tscn")
		
	if Autoload.dead == true:
		get_tree().change_scene("res://scenes/game_over/GameOver.tscn")
		Autoload.dead = false
	pass 

