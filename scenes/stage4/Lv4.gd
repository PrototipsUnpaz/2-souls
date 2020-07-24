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
	$TextWin.visible = false
	$IconAtq.modulate = Color(1,1,1,0.4)
	$IconSpeed.modulate = Color(1,1,1, 0.4)
	pass
	
func _process(delta):
	if Autoload.count == 2:
		Autoload.count = 0
		$TextWin.visible = true
		$NextScene.start()
	if Autoload.dead == true:
		Autoload.dead = false
		$TimerDeath.start()
		$SfxDeath.play()
	if Autoload.spdUp == true:
		$IconSpeed.modulate = Color(1,1,1,1)
	if Autoload.atqUp == true:
		$IconAtq.modulate = Color(1,1,1,1)
	pass 

func _on_TimerDeath_timeout():
	Autoload.spdUp = false
	Autoload.atqUp = false
	Autoload.lvl4Dead = true
	get_tree().change_scene("res://scenes/game_over/GameOver.tscn")
	pass 

func _on_NextScene_timeout():
	Autoload.spdUp = false
	Autoload.atqUp = false
	Autoload.lv1 = false
	Autoload.lv2 = false
	Autoload.lv3 = false
	Autoload.lv4 = false
	Autoload.winGame = true
	get_tree().change_scene("res://scenes/name_stage/NameStage.tscn")
	pass 
