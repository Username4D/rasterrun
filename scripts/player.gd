extends CharacterBody3D

var movement_direction = Vector3(0,0,1)
var speed = 280

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_up"):
		movement_direction = Vector3(0,0,1)
	elif Input.is_action_just_pressed("ui_right"):
		movement_direction = Vector3(-1,0,0)
	elif Input.is_action_just_pressed("ui_down"):
		movement_direction = Vector3(0,0,-1)
	elif Input.is_action_just_pressed("ui_left"):
		movement_direction = Vector3(1,0,0)

func _physics_process(delta: float) -> void:
	velocity = movement_direction * speed * delta
	self.move_and_slide()
