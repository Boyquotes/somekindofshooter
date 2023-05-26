extends KinematicBody2D

const SPEED = 500
const FRICTION = 0.01
var velocity = 0

var old_rotation = 0
var status

#clamp turn speed with sharp turns

func _physics_process(delta):
	var distance_to_mouse = position.distance_to(get_global_mouse_position())
	
	if Input.is_action_pressed("forward"):
		velocity = lerp(velocity, SPEED, FRICTION * 10)
		if distance_to_mouse < 100:
			velocity = lerp(velocity, 0, FRICTION * 10)
		if distance_to_mouse < 10:
			velocity = 0
			
		old_rotation = rotation
		status = "moving"
	else:
		velocity = lerp(velocity, 0, FRICTION)
	
	if Input.is_action_pressed("shoot"):
		status = "shooting"
	
	if status == "shooting":
		move_and_slide(Vector2(velocity, 0).rotated(old_rotation))
	else:
		move_and_slide(Vector2(velocity, 0).rotated(rotation))


func _process(delta):
	if Input.is_action_pressed("forward") or Input.is_action_pressed("shoot"):
		look_at(get_global_mouse_position())
