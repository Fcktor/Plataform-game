extends StaticBody3D

var is_falling = false
var fall_timer = 0.0
var stand_timer = 0.0
var player = null

func _ready():
	await get_tree().process_frame
	player = get_tree().root.find_child("Player", true, false)

func _physics_process(delta):
	if not is_falling and player:
		var pp = player.global_position
		var mp = global_position
		var dx = abs(pp.x - mp.x)
		var dz = abs(pp.z - mp.z)
		var dy = pp.y - mp.y
		if dx < 1.4 and dz < 1.4 and dy > 0.2 and dy < 1.8:
			stand_timer += delta
			if stand_timer >= 1.5:
				is_falling = true
		else:
			stand_timer = 0.0

	if is_falling:
		fall_timer += delta
		position.y -= 5.0 * delta
		if fall_timer > 2.0:
			queue_free()
