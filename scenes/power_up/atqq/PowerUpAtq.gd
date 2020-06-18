extends Node2D

func _ready():
	$AnimatedSprite.play()
	pass
	
func _on_AtqArea_area_entered(area):
	if area.name == "AreaBlue" or area.name == "AreaRed":
		get_tree().call_group("players", "power_atq")
		queue_free()
	pass 
