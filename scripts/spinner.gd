extends AnimatableBody3D

func _physics_process(delta: float) -> void:
	self.rotation_degrees.y =  90 * (4 - $Timer.time_left)
