extends Button

var running: bool = false
var jumping: bool = false

func _ready() -> void:
	toggle_mode = true
	toggled.connect(_on_toggled)

func _on_toggled(toggled_on: bool) -> void:
	running = toggled_on
	
	if running and not jumping:
		$CharacterBody2D/AnimatedSprite2D.play("run")
		$AudioStreamPlayer.play()
	else:
		$CharacterBody2D/AnimatedSprite2D.stop()
		$AudioStreamPlayer.stop()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("touche right"):
		if not jumping:
			_start_attack()
		else:
			_stop_attack()

func _start_attack() -> void:
	jumping = true
	$CharacterBody2D/AnimatedSprite2D.play("jump")
	$AudioStreamPlayer.play()

func _stop_attack() -> void:
	jumping = false
	if running:
		$CharacterBody2D/AnimatedSprite2D.play("run")
	else:
		$CharacterBody2D/AnimatedSprite2D.stop()
