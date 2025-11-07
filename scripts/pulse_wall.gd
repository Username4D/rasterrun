extends AnimatableBody3D

@export var offset = 0.0
@onready var original_pos = self.position.y

func ease_in_out_cubic(x):
	if x <= 1:
		return 4 *x * x * x if x < .5 else 1 - pow(-2 * x + 2, 3 ) / 2
	else:
		return 1 - 4 *(x-1) * (x-1) * (x-1) if x-1 < .5 else pow(-2 * (x-1) + 2, 3 ) / 2
func _process(delta: float) -> void:
	self.position.y = original_pos - ease_in_out_cubic( 2 - $move_timer.time_left / 2 ) * 2


func _ready() -> void:
	$move_timer.stop()
	await get_tree().create_timer(offset).timeout
	$move_timer.start()
