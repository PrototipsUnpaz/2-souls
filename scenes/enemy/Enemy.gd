extends KinematicBody2D

var stun = false
var posEnemy = 0
var spd = 200
var move = Vector2(spd, 0)

func pathfinding():

	if self.position.x <=  72 and self.position.y >= 431:
		move = Vector2(spd, 0)
	if self.position.x >= 570 and self.position.y == 431:
		move = Vector2(0, -spd)
	if self.position.y <= 315 and self.position.x >= 570:
		move = Vector2(-spd, 0)
	if self.position.y <= 315 and self.position.x <= 72:
		move = Vector2(0, spd)
	pass

func _physics_process(delta):
	pathfinding()
	move_and_slide(move)


func _on_Area2D_area_entered(area):
	$Stun.start()
	stun = true
	if stun == true:
		move = Vector2(0,0)
		Autoload.inmortal = true
		Autoload.inmortal2 = true
	pass 


func _on_Stun_timeout():
	stun = false
	Autoload.inmortal = false
	Autoload.inmortal2 = false
	move = Vector2(spd, 0)
	pass # Replace with function body.
