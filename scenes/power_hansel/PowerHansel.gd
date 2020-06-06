extends Area2D

var direction = Vector2()
export var vel = 200
func _ready():
	$Timer.start()
	pass




func _physics_process(delta):
	
	move_local_x(direction.x * vel * delta)
	if direction.y == 1:
		move_local_y(direction.y * vel * delta);

	else:
		move_local_y(direction.y * vel * delta)

	pass

func _on_Timer_timeout():
	queue_free()
	pass 


func _on_PowerArea_area_entered(area):
	if area.name == "EnemyArea":
		$CollisionArea.disabled = true
	pass # Replace with function body.
