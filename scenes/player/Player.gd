extends KinematicBody2D

var SPEED = 300
var velocity = Vector2()
var new_motion_vector = Vector2(0,0)
var pos_stick_angle

func _ready():
	# Obtengo el nodo llamado StickDigital buscando en el padre (la escena WorldTest en este caso)
	# Si lo encuentra, lo conecto con el mismo (self) para recibir señales
	# en caso de que no lo encuentre, no hará la conección y no habrá movimiento
	var stickDigital = get_parent().get_node_or_null("StickDigital")
	if stickDigital != null:
		stickDigital.connect("stick_motion", self, "get_motion_vector")
		
func adrenalin():
	SPEED = SPEED * 1.15
	pass

# Funcion que se ejecuta al recibir la señal "get_motion"
# este obtiene el vector "dirección" (hacia donde apunta)
func get_motion_vector(motion):
	new_motion_vector = motion
		

func _physics_process(delta):
	
	pos_stick_angle = rad2deg(  new_motion_vector.angle_to(Vector2(1,0))  )
	
	#Movimiento derecha
	if pos_stick_angle < 45 and pos_stick_angle >-45:
		velocity = Vector2(SPEED,0)
		$AnimatedSprite.play("RunRight")
		$AnimatedSprite.flip_h = false
	#Movimiento izquierda
	if pos_stick_angle < -128 and pos_stick_angle > -179 or pos_stick_angle < 179 and pos_stick_angle > 134:
		velocity = Vector2(-SPEED, 0)
		$AnimatedSprite.play("RunRight")
		$AnimatedSprite.flip_h = true
		
	#Movimiento abajo	
	if pos_stick_angle > -128 and pos_stick_angle < -45:
		velocity = Vector2(0, SPEED)
		$AnimatedSprite.play("RunBot")
		
	
	#Movimiento arriba
	if pos_stick_angle > 45 and pos_stick_angle < 133:
		velocity = Vector2(0, -SPEED)
		$AnimatedSprite.play("RunTop")
		
	#Cuando se suelte el stick, se detiene el movimiento
	if pos_stick_angle == 0:
		velocity = Vector2(0, 0)
		$AnimatedSprite.play("Idle")
		
	move_and_slide(velocity)
	pass

	
	
	
	
	#if Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		#velocity.x = 0
		#velocity.y = 0
		
	#if Input.is_action_pressed("ui_left"):
		#velocity.x = -SPEED
		#velocity.y = 0
		
	#if Input.is_action_pressed("ui_right"):
		#velocity.x = SPEED
		#velocity.y = 0
		
	#if Input.is_action_pressed("ui_up"):
		#velocity.y = -SPEED
		#velocity.x = 0
		
	#if Input.is_action_pressed("ui_down"):
		#velocity.y = SPEED
		#velocity.x = 0

func _on_Area2D_area_entered(area):
	adrenalin();
	print (SPEED)
	$Area.set_deferred("disable", true)
	pass 
