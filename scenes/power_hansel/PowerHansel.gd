extends Area2D

var direction = Vector2()
const speed = 100
func _ready():
	$Timer.start()
	pass



func _on_Timer_timeout():
	queue_free()
	pass 


func _on_PowerArea_body_entered(body):
	queue_free()
	pass 
	
func  _process(delta): 
	direction = Vector2(speed, 0)* delta;

