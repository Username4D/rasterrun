extends Node2D

func _ready() -> void:
	$shaders.button_pressed = save_handler.shaders_enabled
	$fog.button_pressed = save_handler.fog_enabled
	$glow.button_pressed = save_handler.glow_enabled

func update():
	save_handler.shaders_enabled = $shaders.button_pressed
	save_handler.fog_enabled = $fog.button_pressed
	save_handler.glow_enabled = $glow.button_pressed
	save_handler.save()


func _on_settings_pressed() -> void:
	self.get_parent().add_child(load("res://scenes/main_menu.tscn").instantiate())
	self.queue_free()
