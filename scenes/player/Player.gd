extends KinematicBody2D

var SPEED = 300
var velocity = Vector2(0, 0)
var new_motion_vector = Vector2(0,0)
var pos_stick_angle 
var right = 0
var left = 0
var top = 0
var bot = 0
var idle = 0
var onda_generator = preload ("res://scenes/power_hansel/PowerHansel.tscn")

func generate_power():
	var onda = onda_generator.instance()
	add_child(onda)
	onda.global_position = $PosPower.global_position
#if right == 1:
	#	onda.global_position = $PosPower.global_position
	#if left == 1: 
	#	onda.global_position = $PosPower.global_position - 10


	pass
	
func _ready():
	# Obtengo el nodo llamado StickDigital buscando en el padre (la escena WorldTest en este caso)
	# Si lo encuentra, lo conecto con el mismo (self) para recibir señales
	# en caso de que no lo encuentre, no hará la conección y no habrá movimiento
	var stickDigital = get_parent().get_node_or_null("StickDigital")
	var buttonAttack = get_parent().get_node_or_null("ButtonAttack")
	
	if buttonAttack != null:
		buttonAttack.connect("hit", self, "attack")
	if stickDigital != null:
		stickDigital.connect("stick_motion", self, "get_motion_vector")

		
func adrenalin():
	SPEED = SPEED * 1.15
	pass
	
func attack():
	idle = 0
	top = 0
	right = 0
	left = 0
	bot = 0
	$AnimatedSprite.play("AtkTop")
	generate_power()
	pass
	

# Funcion que se ejecuta al recibir la señal "get_motion"
# este obtiene el vector "dirección" (hacia donde apunta)
func get_motion_vector(motion):
	new_motion_vector = motion
		

func _physics_process(delta):
	pos_stick_angle = rad2deg(  new_motion_vector.angle_to(Vector2(1,0))  )
	print(SPEED)
	#Movimiento derecha
	if pos_stick_angle < 45 and pos_stick_angle >-45:
		velocity = Vector2(SPEED, 0)
		
		right = 1
		top = 0
		left = 0
		bot = 0
		idle = 0
	#Movimiento izquierda
	if pos_stick_angle < -128 and pos_stick_angle > -179 or pos_stick_angle < 179 and pos_stick_angle > 134:
		velocity = Vector2(-SPEED, 0)
		
		left = 1
		right = 0
		top = 0
		bot = 0
		idle = 0
	#Movimiento abajo	
	if pos_stick_angle > -128 and pos_stick_angle < -45:
		velocity = Vector2(0, SPEED)
		bot = 1
		top = 0
		left = 0
		right = 0
		idle = 0
	#Movimiento arriba
	if pos_stick_angle > 45 and pos_stick_angle < 133:
		velocity = Vector2(0, -SPEED)
		top = 1
		left = 0
		right = 0
		bot = 0
		idle = 0
	#Cuando se suelte el stick, se detiene el movimiento
	if new_motion_vector == Vector2(0, 0):
		velocity = Vector2(0, 0)
		idle = 1
		top = 0
		left = 0
		bot = 0
		
	move_and_slide(velocity)
	pass

	if right == 1: 
		$AnimatedSprite.play("RunRight")
		$AnimatedSprite.flip_h = false
	if left == 1:
		$AnimatedSprite.play("RunRight")
		$AnimatedSprite.flip_h = true
	if bot == 1:
		$AnimatedSprite.play("RunBot")
	if top == 1:
		$AnimatedSprite.play("RunTop")
	if idle == 1: 
		$AnimatedSprite.play("Idle")
		
		
	
	
	
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
	$Area.set_deferred("disable", true)
	pass 
