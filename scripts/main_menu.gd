extends Node2D

func _on_button_pressed() -> void:
	self.get_parent().start()
	self.queue_free()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up" ) or Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		self.get_parent().start()
		self.queue_free()

func _on_settings_pressed() -> void:
	self.get_parent().add_child(load("res://scenes/settings.tscn").instantiate())
	self.queue_free()


func _on_credits_pressed() -> void:
	self.get_parent().add_child(load("res://scenes/credits.tscn").instantiate())
	self.queue_free()
