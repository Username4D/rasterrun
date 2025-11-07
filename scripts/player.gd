extends CharacterBody3D

var movement_direction = Vector3(0,0,1)
var speed = 280
var movement_rotation = 0

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_up"):
		movement_rotation = -90
		movement_direction = Vector3(0,0,1)
	elif Input.is_action_just_pressed("ui_right"):
		movement_rotation = -180
		movement_direction = Vector3(-1,0,0)
	elif Input.is_action_just_pressed("ui_down"):
		movement_rotation = 90
		movement_direction = Vector3(0,0,-1)
	elif Input.is_action_just_pressed("ui_left"):
		movement_rotation = 0
		movement_direction = Vector3(1,0,0)
	
	$front.rotation_degrees.y = movement_rotation + 90
func _physics_process(delta: float) -> void:
	velocity = movement_direction * speed * delta
	self.move_and_slide()


func _on_front_body_entered(body: Node3D) -> void:
	if body.is_in_group("collidable"):
		self.speed = 0
