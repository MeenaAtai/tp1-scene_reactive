extends Button

var _button_pressed: bool = false
var _attacking: bool = false

func _ready() -> void:
	toggle_mode = true
	toggled.connect(_on_toggled)

func _on_toggled(toggled_on: bool) -> void:
	_button_pressed = toggled_on
	
	if toggled_on and not _attacking:
		$CharacterBody2D/AnimatedSprite2D.play("run")
		$AudioStreamPlayer.play()
	else:
		$CharacterBody2D/AnimatedSprite2D.stop()
		$AudioStreamPlayer.stop()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right"):
		if not _attacking:
			_start_attack()
		else:
			_stop_attack()

func _start_attack() -> void:
	_attacking = true
	$CharacterBody2D/AnimatedSprite2D.play("right")
	$AudioStreamPlayer.play()

func _stop_attack() -> void:
	_attacking = false
	if _button_pressed:
		$CharacterBody2D/AnimatedSprite2D.play("run")
	else:
		$CharacterBody2D/AnimatedSprite2D.stop()
