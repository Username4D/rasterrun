extends Node3D

@export var score = 0

func start():
	$player.speed = 340
	$ui.visible = true

func _ready() -> void:
	$WorldEnvironment.environment.fog_enabled = save_handler.fog_enabled
	$WorldEnvironment.environment.glow_enabled = save_handler.glow_enabled
	if not save_handler.sound_enabled:
		$AudioStreamPlayer.queue_free()
	else:
		$AudioStreamPlayer.play()
