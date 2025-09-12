extends Button

var running: bool = false
var attacking: bool = false

func _ready() -> void:
	toggle_mode = true
	toggled.connect(_on_toggled)

func _on_toggled(toggled_on: bool) -> void:
	running = toggled_on
	
	if running and not attacking:
		$CharacterBody2D/AnimatedSprite2D.play("run")
		$AudioStreamPlayer.play()
	else:
		$CharacterBody2D/AnimatedSprite2D.stop()
		$AudioStreamPlayer.stop()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("touche left"):
		if not attacking:
			_start_attack()
		else:
			_stop_attack()

func _start_attack() -> void:
	attacking = true
	$CharacterBody2D/AnimatedSprite2D.play("attack")
	$AudioStreamPlayer.play()

func _stop_attack() -> void:
	attacking = false
	if running: 
		$CharacterBody2D/AnimatedSprite2D.play("run")
	else:
		$CharacterBody2D/AnimatedSprite2D.stop()
