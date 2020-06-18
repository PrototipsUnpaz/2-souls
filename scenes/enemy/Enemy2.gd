extends Node2D

var stun = false
var ida = false
var ida2 = false
var ida3 = false
export (Vector2) var posicion1
export (Vector2) var posicion2
export (Vector2) var posicion3
export (Vector2) var posicion4

export (int) var velocidad

var posicionDestino

func _ready():
	velocidad = 200
	$AnimEnemy2.play()
	posicionDestino = posicion1
	mover()

func mover():
	var tiempo = position.distance_to(posicionDestino) / velocidad
	$Tween2.interpolate_property(self, "position", position, posicionDestino, tiempo, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween2.start()
	pass


func stun():
	stun = true
	$Tween2.stop_all()
	$AreaEnemy2/CollisionEnemy2.set_deferred("disabled", true)
	pass
	
func _on_Stun2_timeout():
	stun = false
	$AreaEnemy2/CollisionEnemy2.set_deferred("disabled", false)
	mover()
	pass # Replace with function body.

func _on_Tween2_tween_completed(object, key):
	if posicionDestino.x == posicion1.x && posicionDestino.y == posicion1.y: 
		posicionDestino = posicion2
		ida2 = true
	elif (posicionDestino.x == posicion2.x && posicionDestino.y == posicion2.y) && ida2 == true:
		posicionDestino = posicion3
		ida = true
		ida2 = false
	elif (posicionDestino.x == posicion3.x && posicionDestino.y == posicion3.y) && ida == true:
		posicionDestino = posicion4
		ida = false
		ida3 = true
	elif (posicionDestino.x == posicion4.x && posicionDestino.y == posicion4.y) && ida3 == true:
		posicionDestino = posicion3
		ida3 = false
	elif posicionDestino.x == posicion3.x && posicionDestino.y == posicion3.y:
		posicionDestino = posicion2
	elif posicionDestino.x == posicion2.x && posicionDestino.y == posicion2.y:
		posicionDestino = posicion1
	mover()
	pass 


func _on_AreaEnemy2_area_entered(area):
	if (area.name == "PowerRed" or area.name == "PowerHansel") and stun == false:
		stun()
		$Stun2.start()
	pass 
