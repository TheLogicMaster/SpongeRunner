extends Area

const SPEED = 1.2

func _process(delta):
	global_rotate(Vector3.UP, delta * SPEED)

func _ready():
	connect("body_entered", self, "on_body_entered")

func on_body_entered(_body):
	$"../../Player".win()
