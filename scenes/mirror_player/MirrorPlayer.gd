extends KinematicBody2D

const SPEED = 300
var velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		velocity.x = 0
		velocity.y = 0
		$AnimationSprite.play("Idle")
	if Input.is_action_pressed("ui_left"):
		velocity.x = SPEED
		velocity.y = 0
		$AnimationSprite.play("RunRight")
		$AnimationSprite.flip_h = false
	if Input.is_action_pressed("ui_right"):
		velocity.x = -SPEED
		velocity.y = 0
		$AnimationSprite.play("RunRight")
		$AnimationSprite.flip_h = true
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED
		velocity.x = 0
		$AnimationSprite.play("RunTop")
	if Input.is_action_pressed("ui_down"):
		velocity.y = SPEED
		velocity.x = 0
		$AnimationSprite.play("RunBot")
	move_and_slide(velocity)
	pass
