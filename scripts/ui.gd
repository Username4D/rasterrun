extends Node2D

func _process(delta: float) -> void:
	$score.text = var_to_str(self.get_parent().score)
