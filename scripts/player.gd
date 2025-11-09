extends CharacterBody3D

var movement_direction = Vector3(0,0,1)
@export var speed = 0
var movement_rotation = 0
var input_disabled = false

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
	print($Camera3D.global_position.y)
	if not input_disabled:
		velocity = movement_direction * speed * delta
	else:
		velocity.x = move_toward(velocity.x , 0, delta * 4)
		velocity.z = move_toward(velocity.z , 0, delta * 4)
	velocity.y = clamp(velocity.y - 0.2, -30, 3)
	self.move_and_slide()
	
	if position.y <= 0.98:
		save_handler.save()
		print("too_low")
		input_disabled = true
		$Camera3D.global_position.y = 6.6 + 1
		self.get_parent().death()

	
func _on_front_body_entered(body: Node3D) -> void:
	if body.is_in_group("collidable"):
		print(body.name)
		self.speed = 0
		save_handler.save()
		self.get_parent().death()


func _on_front_area_entered(area: Area3D) -> void:
	if area.is_in_group("collidable"):
		print(area.name)
		self.speed = 0
		save_handler.save()
		self.get_parent().death()
