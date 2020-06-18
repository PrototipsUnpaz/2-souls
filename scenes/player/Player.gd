extends KinematicBody2D

var SPEED = 200
var velocity = Vector2(0, 0)
var new_motion_vector = Vector2(0,0)
var pos_stick_angle 
onready var ondaPos = $Pivot/Default
onready var ondaUp = $Pivot/PosUp
onready var ondaDown = $Pivot/PosDown
onready var ondaRight = $Pivot/PosRight
onready var ondaLeft = $Pivot/PosLeft
var lastPosPower = 0
var ondaDirection = Vector2()
var onda_generator = preload ("res://scenes/power_hansel/PowerHansel.tscn")
var sfx_power = preload ("res://scenes/audio/sfx/SfxPowerUp.tscn")
var sfxPowerAtqDefault = preload ("res://scenes/audio/sfx/SfxPowerAtq.tscn")
signal power_up_atq

func generate_onda(ondaIstanceDefault_l, direction_x = ondaDirection.x, direction_y = 0):
	if direction_x and direction_y:
		 direction_x = $Pivot.scale.x
	var onda = onda_generator.instance()
	self.get_parent().add_child(onda)
	onda.global_position = self.ondaPos.global_position
	onda.direction = Vector2(direction_x, direction_y)
	pass
	
func _ready():
	lastPosPower = 1
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
	SPEED = SPEED + 100
	var sfx_powerup = sfx_power.instance()
	self.get_parent().add_child(sfx_powerup)
	pass

func attack():
	generate_onda(onda_generator,ondaDirection.x, ondaDirection.y)
	pass
# Funcion que se ejecuta al recibir la señal "get_motion"
# este obtiene el vector "dirección" (hacia donde apunta)
func get_motion_vector(motion):
	new_motion_vector = motion
		

func _physics_process(delta):
	pos_stick_angle = rad2deg(  new_motion_vector.angle_to(Vector2(1,0))  )
	
	#Guia de ultima posicion de poder "lastPosPower"
	#1 = derecha
	#2 = izq
	#3 = abajo
	#4 = top
	
	#Movimiento derecha
	if  (pos_stick_angle < 45 and pos_stick_angle > 0 or pos_stick_angle < 0 and pos_stick_angle > -45):
		ondaPos.global_position = ondaRight.global_position
		velocity = Vector2(SPEED, 0)
		ondaDirection = Vector2(1, 0)
		lastPosPower = 1
		$AnimatedSprite.play("RunRight")
		$AnimatedSprite.flip_h = false
	
	#Movimiento izquierda
	if (pos_stick_angle < -128 and pos_stick_angle > -179 or pos_stick_angle < 179 and pos_stick_angle > 134):
		ondaPos.global_position = ondaLeft.global_position
		velocity = Vector2(-SPEED, 0)
		ondaDirection = Vector2(-1, 0)
		$AnimatedSprite.play("RunRight")
		$AnimatedSprite.flip_h = true
		lastPosPower = 2
		
		#Movimiento abajo	
	if (pos_stick_angle > -128 and pos_stick_angle < -45):
		ondaPos.global_position = ondaDown.global_position
		velocity = Vector2(0, SPEED)
		ondaDirection = Vector2(0, 1)
		$AnimatedSprite.play("RunBot")
		lastPosPower = 3
	#Movimiento arriba
	if (pos_stick_angle > 45 and pos_stick_angle < 133):
		ondaPos.global_position = ondaUp.global_position
		velocity = Vector2(0, -SPEED)
		ondaDirection = Vector2(0, -1)
		$AnimatedSprite.play("RunTop")
		lastPosPower = 4
		
	#Cuando se suelte el stick, se detiene el movimiento
	if new_motion_vector == Vector2(0, 0):
		
		velocity = Vector2(0, 0)
		$AnimatedSprite.play("Idle")
		if lastPosPower == 3:
			ondaDirection = Vector2(0, 1)
			ondaPos.global_position = ondaDown.global_position
		elif lastPosPower == 2:
			ondaDirection = Vector2(-1, 0)
			ondaPos.global_position = ondaLeft.global_position
		elif lastPosPower == 1:
			ondaPos.global_position = ondaRight.global_position
			ondaDirection = Vector2(1, 0)
		elif lastPosPower == 4:
			ondaDirection = Vector2(0, -1)
			ondaPos.global_position = ondaUp.global_position
	move_and_slide(velocity)
	
	pass
	
func _on_Area2D_area_entered(area):
	if area.name == "AreaPortal":
		if Autoload.count < 2:
			Autoload.count += 1
	if area.name == "EnemyArea" or area.name == "AreaEnemy2":
		deletePlayer()
		Autoload.dead = true
	if area.name == "AtqArea":
		
		var sfxPowerAtq = sfxPowerAtqDefault.instance()
		self.get_parent().add_child(sfxPowerAtq)
	pass 


func deletePlayer():
	queue_free()
	pass

func _on_Area_area_exited(area):
	if area.name == "AreaPortal":
		Autoload.count = 0
		Autoload.win = false
	pass 
	

