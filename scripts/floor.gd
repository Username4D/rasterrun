extends Node3D

@export var next = Vector2(0,1)
@export var index = 0

func _ready() -> void:
	$exit.rotation_degrees.y = next.x * 90 - 180
	$next_floor.position.x = 11 * next.y
	$next_floor.position.z = -11 * next.x
	if not $wall.visible:
		$wall.queue_free() 

func _on_exit_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		self.get_parent().spawn_new()
		$exit.queue_free()

func ease_in_out_quint(x):
	return 16 * x * x * x * x * x if x < 0.5 else 1 - pow(-2 * x + 2, 5) / 2

func spawn():
	$Timer.start()
	while $Timer.time_left != 0:
		self.position.y = 0.5 - 10 * ease_in_out_quint($Timer.time_left / 2) * 2
		self.scale = Vector3(1,1,1) - ease_in_out_quint($Timer.time_left / 2) * Vector3(.99,.99,.99)
		await get_tree().process_frame
		
	self.position.y = 0.5

func despawn():
	self.index += 100
	$Timer.start()
	while $Timer.time_left != 0:
		self.position.y = -19.5 + 10 * ease_in_out_quint($Timer.time_left / 2) * 2
		self.scale = Vector3(0.01,0.01,0.01) + ease_in_out_quint($Timer.time_left / 2) * Vector3(.99,.99,.99)
		await get_tree().process_frame
	self.queue_free()
