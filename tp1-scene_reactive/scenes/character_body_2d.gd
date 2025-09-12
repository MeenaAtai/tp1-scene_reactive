extends CharacterBody2D

@onready var _animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var _button: Button = $"../Button"

func _ready() -> void:
	# Connecter le bouton au personnage
	_button.toggled.connect(_on_button_toggled)

func _on_button_toggled(pressed: bool) -> void:
	if pressed:
		_animated_sprite.play("run")   # animation quand bouton activé
	else:
		_animated_sprite.stop()        # arrête quand bouton désactivé
	pass
