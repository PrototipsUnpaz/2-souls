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
	
func _physics_process(delta) -> void: 
	move_local_x(direction.x * speed * delta);
	
	if direction.y == 1:
		move_local_y(direction.y * (speed*2) * delta);
	else: 
		move_local_y(direction.y * speed * delta);
		
