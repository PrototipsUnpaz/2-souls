extends Node2D


func _ready():
	if Autoload.stickLeft == true:
		$StickDigital.position.x = 149
		$ButtonAttack.position.x = 1220.97
	elif Autoload.stickRight == true:
		$StickDigital.position.x = 1220.97
		$ButtonAttack.position.x = 149
	$StickDigital.modulate = Color(1,1,1,0.4)
	$ButtonAttack.modulate = Color(1,1,1,0.4)
	$CenterContainer.visible = false
	pass
	
func _process(delta):
	if Autoload.count == 2:
		Autoload.count = 0
		$CenterContainer.visible = true
		$NextScene.start()
	if Autoload.dead == true:
		Autoload.dead = false
		$SfxTimer.start()
		$SfxDead.play()
		
	pass 


func _on_NextScene_timeout():
	get_tree().change_scene("res://scenes/stage2/Nivel2.tscn")
	pass # Replace with function body.


func _on_SfxTimer_timeout():
	get_tree().change_scene("res://scenes/game_over/GameOver.tscn")
	
	Autoload.lvl1Dead = true
	pass 
