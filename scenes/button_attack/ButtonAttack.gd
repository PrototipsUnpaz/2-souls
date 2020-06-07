extends Node2D

var touched = false
signal hit
var cdSignal = true 

func _process(delta):
	if touched == true:
		if cdSignal == true:
			$Timer.start()
			cdSignal = false
			emit_signal("hit")
	pass

func _on_AttackArea_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			touched = true
			$AnimatedSprite.play("pressed")
			modulate = Color (1,1,1,0.6)
		else: 
			touched = false
			$AnimatedSprite.play("idle")
			modulate = Color (1,1,1,0.4)
		
	pass 


func _on_Timer_timeout():
	cdSignal = true
	pass 
