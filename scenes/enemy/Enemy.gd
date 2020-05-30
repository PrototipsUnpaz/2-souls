extends KinematicBody2D

var stun = false
var posEnemy = 0
var spd = 200
var move = Vector2(spd, 0)

func pos_assign():

	if self.position.x <=  72 and self.position.y >= 431:
		
		posEnemy = 1
	if self.position.x >= 570 and self.position.y == 431:
		
		posEnemy = 2
	if self.position.y <= 315 and self.position.x >= 570:
		
		posEnemy = 3
	if self.position.y <= 315 and self.position.x <= 72:
		
		posEnemy = 4	
	
	pass

func pathfinding():
	if posEnemy == 0:
		move = Vector2(0,0)
	if posEnemy == 1:
		move = Vector2(spd, 0)
	if posEnemy == 2:
		move = Vector2(0, -spd)
	if posEnemy == 3:
		move = Vector2(-spd, 0)
	if posEnemy == 4:
		move = Vector2(0, spd)
	pass

func _physics_process(delta):
	
	pos_assign()
	pathfinding()
	move_and_slide(move)


func _on_Area2D_area_entered(area):
	$Stun.start()
	stun = true
	if stun == true:
		posEnemy = 0
		Autoload.inmortal = true
		Autoload.inmortal2 = true
	pass 


func _on_Stun_timeout():
	stun = false
	Autoload.inmortal = false
	Autoload.inmortal2 = false
	posEnemy = 1
	pass # Replace with function body.
