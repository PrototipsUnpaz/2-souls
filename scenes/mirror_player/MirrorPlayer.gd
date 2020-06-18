extends KinematicBody2D

var SPEED = 200
var velocity = Vector2()
var new_motion_vector = Vector2(0,0)
var pos_stick_angle
onready var onda2Pos = $Pivot/PosPower
onready var ondaUp = $Pivot/PosUp
onready var ondaDown = $Pivot/PosDown
onready var ondaRight = $Pivot/PosRight
onready var ondaLeft = $Pivot/PosLeft

var lastPosPower = 0
var onda2Direction = Vector2()
var	bot = 0
var onda_generator2 = preload ("res://scenes/power_gretel/PowerGretel.tscn")

func _ready():
	lastPosPower = 2
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
	pass

func generate_power(ondaIstanceDefault_l, direction_x = onda2Direction.x, direction_y = 0):
	if direction_x and direction_y:
		 direction_x = $Pivot.scale.x
	var onda2 = onda_generator2.instance()
	self.get_parent().add_child(onda2)
	onda2.global_position = self.onda2Pos.global_position
	onda2.direction = Vector2(direction_x, direction_y)
	pass


func attack():
	generate_power(onda_generator2,onda2Direction.x, onda2Direction.y)
	pass

func get_motion_vector(motion):
	new_motion_vector = motion

func _physics_process(delta):
	
	pos_stick_angle = rad2deg(  new_motion_vector.angle_to(Vector2(1,0))  )
	
	#Guia de ultima posicion de poder "lastPosPower"
	#1 = derecha
	#2 = izq
	#3 = abajo
	#4 = top
	
	#Movimiento izquierda
	if (pos_stick_angle < 45 and pos_stick_angle > 0 or pos_stick_angle < 0 and pos_stick_angle > -45):
		onda2Pos.global_position = ondaLeft.global_position
		velocity = Vector2(-SPEED,0)
		$AnimationSprite.play("RunRight")
		$AnimationSprite.flip_h = true
		onda2Direction = Vector2(-1, 0)
		lastPosPower = 2
	#Movimiento derecha
	if pos_stick_angle < -128 and pos_stick_angle > -179 or pos_stick_angle < 179 and pos_stick_angle > 134:
		onda2Pos.global_position = ondaRight.global_position
		velocity = Vector2(SPEED, 0)
		$AnimationSprite.play("RunRight")
		$AnimationSprite.flip_h = false
		onda2Direction = Vector2(1, 0)
		lastPosPower = 1
	#Movimiento abajo	
	if pos_stick_angle > -128 and pos_stick_angle < -45:
		onda2Pos.global_position = ondaDown.global_position
		velocity = Vector2(0, SPEED)
		$AnimationSprite.play("RunBot")
		onda2Direction = Vector2(0, 1)
		lastPosPower = 3
	#Movimiento arriba
	if pos_stick_angle > 45 and pos_stick_angle < 133:
		onda2Pos.global_position = ondaUp.global_position
		velocity = Vector2(0, -SPEED)
		$AnimationSprite.play("RunTop")
		onda2Direction = Vector2(0, -1)
		lastPosPower = 4
	#Cuando se suelte el stick, se detiene el movimiento
	if pos_stick_angle == 0:
		onda2Pos.global_position = ondaLeft.global_position
		velocity = Vector2(0, 0)
		$AnimationSprite.play("Idle")
		
		if lastPosPower == 3:
			onda2Direction = Vector2(0, 1)
			onda2Pos.global_position = ondaDown.global_position
		elif lastPosPower == 2:
			onda2Direction = Vector2(-1, 0)
			onda2Pos.global_position = ondaLeft.global_position
		elif lastPosPower == 1:
			onda2Pos.global_position = ondaRight.global_position
			onda2Direction = Vector2(1, 0)
		elif lastPosPower == 4:
			onda2Direction = Vector2(0, -1)
			onda2Pos.global_position = ondaUp.global_position
		
	move_and_slide(velocity)
	pass
	
func deletePlayer():
	queue_free()
	pass

func _on_Area_area_entered(area):
	if area.name == "AreaPortal":
		if Autoload.count < 2:
			Autoload.count += 1
	if area.name == "EnemyArea" or area.name == "AreaEnemy2":
		deletePlayer()
		Autoload.dead = true
	pass 

func _on_Area_area_exited(area):
	if area.name == "AreaPortal":
		Autoload.win = false
		Autoload.count = 0
	pass 
