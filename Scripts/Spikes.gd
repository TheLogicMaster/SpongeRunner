extends Area

func _ready():
	connect("body_entered", self, "on_body_entered")

func on_body_entered(_body):
	$"../../Player".die()
