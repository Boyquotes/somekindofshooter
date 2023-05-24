extends Position2D

onready var firerate_timer = get_parent().get_node("WeaponFirerate")
onready var firerate_gauge = get_parent().get_parent().get_node("HUD/FirerateGauge")

const bullet_scene = preload("res://scenes/PlayerBullet.tscn")

var firerate = 0.3

func _process(delta):
	firerate_gauge.max_value = firerate
	firerate_gauge.value = firerate_timer.time_left
	
	if Input.is_action_pressed("shoot"):
		print(firerate_timer.time_left)
		if firerate_timer.time_left == 0:
			var bullet = bullet_scene.instance()
			bullet.position = global_position
			bullet.rotation = get_parent().rotation
			get_tree().get_root().add_child(bullet)
			
			firerate_timer.wait_time = firerate
			firerate_timer.start()
