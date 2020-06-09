extends AnimatedSprite


func _on_Area_area_entered(area):
	if Autoload.count == 2:
		$AreaPortal.set_deferred("disabled", true)
	
	pass # Replace with function body.
