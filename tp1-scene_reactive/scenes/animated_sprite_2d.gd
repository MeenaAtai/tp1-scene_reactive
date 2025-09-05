extends AnimatedSprite2D

# attaché à un AnimatedSprite2D
func _ready():
	$AnimatedSprite2D.play("run")
