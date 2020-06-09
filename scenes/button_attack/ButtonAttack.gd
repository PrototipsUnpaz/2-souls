extends Node2D

signal hit
var cdSignal = true 

func _on_AttackArea_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch && cdSignal == true:
		if event.is_pressed():
			$Timer.start()
			cdSignal = false
			emit_signal("hit")
			$AnimatedSprite.play("pressed")
			modulate = Color (1,1,1,0.6)
		else: 
			$AnimatedSprite.play("idle")
			modulate = Color (1,1,1,0.4)
	pass 


func _on_Timer_timeout():
	cdSignal = true
	$AnimatedSprite.play("idle")
	modulate = Color (1,1,1,0.4)
	pass 
