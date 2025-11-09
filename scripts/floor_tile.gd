extends Node3D



func _on_player_detection_body_exited(body: Node3D) -> void:
	
	if body.is_in_group("player"):
		$player_detection.queue_free()
		$Timer.start()
		while $Timer.time_left != 0:
			$spike.position.y = 0.75 - ease_in_out_quint($Timer.time_left)
			await get_tree().process_frame
	
			
func ease_in_out_quint(x):
	return 16 * x * x * x * x * x if x < 0.5 else 1 - pow(-2 * x + 2, 5) / 2
