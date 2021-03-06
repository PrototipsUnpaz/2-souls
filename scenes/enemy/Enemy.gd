extends Node2D

var stun = false

export (Vector2) var posicion1
export (Vector2) var posicion2
export (Vector2) var posicion3
export (Vector2) var posicion4

export (int) var velocidad

var posicionDestino

func _ready():
	velocidad = 200
	posicionDestino = posicion1
	mover()

func mover():
	$AnimatedSprite.play("idle")
	var tiempo = position.distance_to(posicionDestino) / velocidad
	$Tween.interpolate_property(self, "position", position, posicionDestino, tiempo, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	pass

func _on_Tween_tween_completed(object, key):
	# si es posicion 1
	if posicionDestino.x == posicion1.x && posicionDestino.y == posicion1.y: 
		posicionDestino = posicion2
	# si es posicion 2
	elif posicionDestino.x == posicion2.x && posicionDestino.y == posicion2.y:
		posicionDestino = posicion3
	elif posicionDestino.x == posicion3.x && posicionDestino.y == posicion3.y:
		posicionDestino = posicion4
	elif posicionDestino.x == posicion4.x && posicionDestino.y == posicion4.y:
		posicionDestino = posicion1
	mover()
	pass

func stun():
	stun = true
	$Tween.stop_all()
	$EnemyArea/CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite.play("stun_enemy")
	pass
	
func _on_Area2D_area_entered(area):
	
	if (area.name == "PowerRed" or area.name == "PowerHansel") and stun == false:
		stun()
		$Stun.start()
	pass # Replace with function body.

func _on_Stun_timeout():
	stun = false
	$EnemyArea/CollisionShape2D.set_deferred("disabled", false)
	mover()
	pass # Replace with function body.
