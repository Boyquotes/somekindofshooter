extends KinematicBody2D

const SPEED = 300
const FRICTION = 100
var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	input_vector = input_vector.normalized()
	
	velocity = velocity.move_toward(input_vector * SPEED, FRICTION)
	
	move_and_slide(velocity)

func _process(delta):
	look_at(get_global_mouse_position())
