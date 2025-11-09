extends Node3D

@export var score = 0

func start():
	$player.speed = 340
	$ui.visible = true

func _ready() -> void:
	$WorldEnvironment.environment.fog_enabled = save_handler.fog_enabled
	$WorldEnvironment.environment.glow_enabled = save_handler.glow_enabled
	if not save_handler.sound_enabled:
		$"../AudioStreamPlayer".queue_free()
	elif not $"../AudioStreamPlayer".playing:
		$"../AudioStreamPlayer".play()

func _process(delta: float) -> void:
	if save_handler.pb < score:
		save_handler.pb = score

func respawn():
	self.get_parent().add_child(load("res://scenes/demo_scene.tscn").instantiate())
	self.queue_free()

func death():
	$ui.visible = false
	if $respawn_menu:
		$respawn_menu.visible = true
