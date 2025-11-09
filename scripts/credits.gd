extends Node2D



func _on_settings_pressed() -> void:
	self.get_parent().add_child(load("res://scenes/main_menu.tscn").instantiate())
	self.queue_free()
