extends StaticBody3D

func _ready() -> void:
	$MeshInstance3D.mesh.size = self.scale
	$CollisionShape3D.scale = self.scale
	self.scale = Vector3.ONE
	if save_handler.shaders_enabled == false:
		$MeshInstance3D.get_surface_override_material(0).next_pass = null
