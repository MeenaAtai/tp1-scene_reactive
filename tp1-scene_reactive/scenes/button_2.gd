extends Button

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$AudioStreamPlayer.play()
		$AnimatedSprite2D.play()
	else:
		$AudioStreamPlayer.stop()
		$AnimatedSprite2D.stop()
