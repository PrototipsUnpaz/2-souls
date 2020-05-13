extends KinematicBody2D


var initialPosition

func _ready():
	initialPosition = true
	interpolate_position()
	pass 


func _on_Tween_tween_completed(object, key):
	initialPosition = !initialPosition
	interpolate_position()
	pass

func interpolate_position():
	if initialPosition:
		$Tween.interpolate_property(self, "position", self.position, self.position + Vector2(450,0), 10,Tween.TRANS_LINEAR,Tween.EASE_OUT)
		$AnimatedSprite.play("walkRight")
		$AnimatedSprite.flip_h = false
	else:
		$Tween.interpolate_property(self, "position", self.position, self.position + Vector2(-450, 0), 10,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		$AnimatedSprite.play("walkRight")
		$AnimatedSprite.flip_h = true
	$Tween.start()
	
