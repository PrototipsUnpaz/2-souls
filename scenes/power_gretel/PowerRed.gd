extends Area2D

var direction = Vector2()
export var vel = 200
func _ready():
	$Timer.start()
	$AnimatedSprite.flip_h = true
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
	pass # Replace with function body.


func _on_PowerRed_area_entered(area):
	pass
