extends Node2D

func _on_button_pressed() -> void:
	self.get_parent().respawn()
	self.queue_free()


func _process(delta: float) -> void:
	$score.text = "Score: " + var_to_str(self.get_parent().score)
