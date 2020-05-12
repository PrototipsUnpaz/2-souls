extends Node2D

var touched = false
signal hit

func _ready():
	
	pass 

func _process(delta):
	if touched == true:
		if Input.is_action_just_released("touch"):
			touched = false
		else:
			
			emit_signal("hit")
	pass

func _on_AttackArea_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("touch") && touched == false:
		touched = true
	pass 
