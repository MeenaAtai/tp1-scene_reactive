extends Button

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$CharacterBody2D/AnimatedSprite2D.play()
		$AudioStreamPlayer.play()
	else:
		$CharacterBody2D/AnimatedSprite2D.stop()
		$AudioStreamPlayer.stop()
 
