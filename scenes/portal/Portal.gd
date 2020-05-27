extends AnimatedSprite


func _on_Area_area_entered(area):
	if Autoload.win == false:
		Autoload.win = true
	pass # Replace with function body.
