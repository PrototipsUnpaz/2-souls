extends Node2D


func _ready():
	$StickDigital.modulate = Color(1,1,1,0.4)
	$ButtonAttack.modulate = Color(1,1,1,0.4)
	$CenterContainer.visible = false
	pass
	
func _process(delta):
	if Autoload.count == 2:
		$CenterContainer.visible = true
		
	if Autoload.dead == true:
		get_tree().change_scene("res://scenes/game_over/GameOver.tscn")
		Autoload.dead = false
		Autoload.lvl2Dead = true
	pass 
