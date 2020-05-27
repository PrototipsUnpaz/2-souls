extends Node2D

var touched = false
signal hit
var cd_signal = true
func _ready():
	
	
	pass 

func _process(delta):

	if touched == true:
		if Input.is_action_just_released("touch"):
			touched = false
			$AnimatedSprite.play("idle")
			modulate = Color (1,1,1,0.4)
		if cd_signal == true:
			$Timer.start()
			cd_signal = false
			emit_signal("hit")
	pass

func _on_AttackArea_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("touch") && touched == false:
		touched = true
		$AnimatedSprite.play("pressed")
		modulate = Color (1,1,1,0.6)
	pass 


func _on_Timer_timeout():
	cd_signal = true
	pass 
