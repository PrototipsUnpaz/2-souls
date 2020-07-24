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
	$IconSpeed.modulate = Color(1,1,1, 0.4)
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
	if Autoload.spdUp == true:
		$IconSpeed.modulate = Color(1,1,1,1)
	pass 


func _on_NextScene_timeout():
	Autoload.lv1 = false
	Autoload.lv2 = true
	Autoload.spdUp = false
	get_tree().change_scene("res://scenes/name_stage/NameStage.tscn")
	pass 


func _on_SfxTimer_timeout():
	get_tree().change_scene("res://scenes/game_over/GameOver.tscn")
	Autoload.spdUp = false
	Autoload.lvl1Dead = true
	pass 
