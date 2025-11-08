extends Node3D

@onready var last = self.get_child(0)

var mi_one = [preload("res://scenes/floors/-1/0.tscn")]
var zero = [preload("res://scenes/floors/0/0.tscn")]
var one = [preload("res://scenes/floors/1/0.tscn")]

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	
func spawn_new():
	var possible = [mi_one, zero, one]
	for i in self.get_children():
		if round(last.position+ Vector3(last.next.x * -1, 0, last.next.y).rotated(Vector3 (0,01,0), last.rotation.y) * 11 + Vector3(11, 0, 0).rotated(Vector3 (0,01,0), last.rotation.y - 0.5 * PI * last.next.x)) == round(i.position):
			print("no_left")
			possible.erase(mi_one)
		if round(last.position+ Vector3(last.next.x * -1, 0, last.next.y).rotated(Vector3 (0,01,0), last.rotation.y) * 11 + Vector3(-11, 0, 0).rotated(Vector3 (0,01,0), last.rotation.y - 0.5 * PI * last.next.x)) == round(i.position):
			print("no_right")
			possible.erase(one)
		if round(last.position+ Vector3(last.next.x * -1, 0, last.next.y).rotated(Vector3 (0,01,0), last.rotation.y) * 11 + Vector3(0, 00, 11).rotated(Vector3 (0,01,0), last.rotation.y- 0.5 * PI * last.next.x)) == round(i.position):
			print("no_front")
			possible.erase(zero)
	
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

func _process(delta: float) -> void:
	$MeshInstance3D.position = round(last.position+ Vector3(last.next.x * -1, 0, last.next.y).rotated(Vector3 (0,01,0), last.rotation.y) * 11)
	$MeshInstance3D.rotation.y =  last.rotation.y - 0.5 * PI * last.next.x
