extends Node3D

@onready var last = self.get_child(0)

var mi_one = [preload("res://scenes/floors/-1/0.tscn"), preload("res://scenes/floors/-1/1.tscn"), preload("res://scenes/floors/-1/2.tscn"), preload("res://scenes/floors/-1/3.tscn"), preload("res://scenes/floors/-1/4.tscn"), preload("res://scenes/floors/-1/5.tscn"), preload("res://scenes/floors/-1/6.tscn")]
var zero = [preload("res://scenes/floors/0/0.tscn"), preload("res://scenes/floors/0/1.tscn"), preload("res://scenes/floors/0/2.tscn"), preload("res://scenes/floors/0/3.tscn"), preload("res://scenes/floors/0/4.tscn"), preload("res://scenes/floors/0/5.tscn"), preload("res://scenes/floors/0/6.tscn"), preload("res://scenes/floors/0/7.tscn"), preload("res://scenes/floors/0/8.tscn")]
var one = [preload("res://scenes/floors/1/0.tscn"), preload("res://scenes/floors/1/1.tscn"), preload("res://scenes/floors/1/2.tscn"), preload("res://scenes/floors/1/3.tscn"), preload("res://scenes/floors/1/4.tscn"), preload("res://scenes/floors/1/5.tscn"), preload("res://scenes/floors/1/6.tscn")]

var rng = RandomNumberGenerator.new()

var current_index = 0

func _ready() -> void:
	rng.randomize()
	await spawn_new(false)
	await spawn_new(false)
	await spawn_new(false)
	
func spawn_new(anim = true):
	var possible = [mi_one, zero, one]
	for i in self.get_children():
		if round(last.position+ Vector3(last.next.x * -1, 0, last.next.y).rotated(Vector3 (0,01,0), last.rotation.y) * 11 + Vector3(11, 0, 0).rotated(Vector3 (0,01,0), last.rotation.y - 0.5 * PI * last.next.x)) == round(i.real_pos):
			print("no_left")
			possible.erase(mi_one)
		if round(last.position+ Vector3(last.next.x * -1, 0, last.next.y).rotated(Vector3 (0,01,0), last.rotation.y) * 11 + Vector3(-11, 0, 0).rotated(Vector3 (0,01,0), last.rotation.y - 0.5 * PI * last.next.x)) == round(i.real_pos):
			print("no_right")
			possible.erase(one)
		if round(last.position+ Vector3(last.next.x * -1, 0, last.next.y).rotated(Vector3 (0,01,0), last.rotation.y) * 11 + Vector3(0, 00, 11).rotated(Vector3 (0,01,0), last.rotation.y- 0.5 * PI * last.next.x)) == round(i.real_pos):
			print("no_front")
			possible.erase(zero)
		if i.index < current_index - 4:
			i.despawn()
	
	var next_arr
	if len(possible) != 0:
		next_arr = possible[rng.randi_range(0, len(possible) - 1)]
	else:
		print("no_route")
	
	var new
	
	if next_arr:
		new = next_arr[rng.randi_range(0, len(next_arr) - 1)].instantiate()
		new.position = last.position + Vector3(last.next.x * -1, 0, last.next.y).rotated(Vector3 (0,01,0), last.rotation.y) * 11
		new.rotation_degrees.y = roundi(last.rotation_degrees.y) + -90 * last.next.x 
		self.add_child(new)
		last = new
		new.index = current_index
		if anim:
			new.spawn()
	current_index += 1
