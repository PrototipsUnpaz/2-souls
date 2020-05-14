extends Node2D

var direction = Vector2()
const speed = 100
func _ready():
	$Timer.start()
	$AnimatedSprite.flip_h = true
	pass



func _on_Timer_timeout():
	queue_free()
	pass 


func _on_PowerArea_body_entered(body):
	queue_free()
	pass 
	
func  _process(delta): 
	direction = Vector2(speed, 0)* delta;


func _on_PowergArea_area_entered(area):
	pass # Replace with function body.
