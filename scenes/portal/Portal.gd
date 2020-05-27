extends AnimatedSprite

func win():
	get_tree().change_scene("res://scenes/game_over/GameOver.tscn")
	pass

func _on_Area_area_entered(area):
	get_tree().call_group("players","win")
	pass # Replace with function body.
