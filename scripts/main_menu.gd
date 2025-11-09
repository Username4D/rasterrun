extends Node2D

func _on_button_pressed() -> void:
	self.get_parent().start()
	self.queue_free()
