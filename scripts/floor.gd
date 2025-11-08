extends Node3D

@export var next = Vector2(0,1)

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
