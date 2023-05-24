extends Area2D

const SPEED = 10

func _physics_process(delta):
	var velocity = Vector2.RIGHT * SPEED
	position += velocity.rotated(rotation)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
