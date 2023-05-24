extends Position2D

const bullet_scene = preload("res://scenes/PlayerBullet.tscn")

func _process(delta):
	if Input.is_action_pressed("shoot"):
		var bullet = bullet_scene.instance()
		bullet.position = global_position
		bullet.rotation = get_parent().rotation
		get_tree().get_root().add_child(bullet)
