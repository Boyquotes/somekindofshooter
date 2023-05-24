extends Area2D

const SPEED = 10

func _physics_process(delta):
	var velocity = Vector2.RIGHT * SPEED
	position += velocity.rotated(rotation)
