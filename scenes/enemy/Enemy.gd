extends KinematicBody2D

var stun = false
var initialPosition
var spd = 10
var move = Vector2(spd, 0)

func _physics_process(delta):
	move_and_slide(move)


func _on_Area2D_area_entered(area):
	$Stun.start()
	stun = true
	if stun == true:
		move = Vector2(0,0)
		Autoload.inmortal = true
	pass 


func _on_Stun_timeout():
	stun = false
	Autoload.inmortal = false
	move = Vector2(spd, 0)
	pass # Replace with function body.
