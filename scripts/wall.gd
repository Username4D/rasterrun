extends StaticBody3D

func _ready() -> void:
	$MeshInstance3D.mesh.size = self.scale
	$CollisionShape3D.scale = self.scale
	self.scale = Vector3.ONE
