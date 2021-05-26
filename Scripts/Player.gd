extends KinematicBody

const SPEED = 5
const GRAVITY = -20
const JUMP_SPEED = 9
const CAMERA_LAG = 2
const CAMERA_START_POS = 3

signal death
signal win

var vel = Vector3()
var running = false

func _ready():
	$AnimationPlayer.get_animation("Run").set_loop(true)
	$AnimationPlayer.play("Run")

func _process(_delta):
	$"../Camera".look_at(global_transform.origin, Vector3.UP)
	if $"../Camera".global_transform.origin.x + CAMERA_LAG < global_transform.origin.x:
		$"../Camera".global_transform.origin.x = global_transform.origin.x - CAMERA_LAG
	
	$"../GUI/Score".text = "Score: " + str(round(global_transform.origin.x))
	
	if Input.is_action_just_pressed("jump")  and is_on_floor():
		vel.y = JUMP_SPEED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not running:
		return
	
	vel.x = SPEED
	vel.y += GRAVITY * delta
	vel.z = 0
	vel = move_and_slide(vel, Vector3.UP)
	
	if transform.origin.y < -3:
		die()

func die():
	running = false
	emit_signal("death")

func win():
	running = false
	emit_signal("win")

func on_game_start():
	global_transform.origin = Vector3(0, 0, 0)
	$"../Camera".global_transform.origin.x = CAMERA_START_POS
	$"../StartTimer".start()

func on_running_start():
	running = true
