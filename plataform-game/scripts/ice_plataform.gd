extends StaticBody3D

var player = null

func _ready():
	await get_tree().process_frame
	player = get_tree().root.find_child("Player", true, false)

func _physics_process(delta):
	if player:
		var pp = player.global_position
		var mp = global_position
		var dx = abs(pp.x - mp.x)
		var dz = abs(pp.z - mp.z)
		var dy = pp.y - mp.y
		if dx < 1.4 and dz < 1.4 and dy > 0.2 and dy < 1.8:
			player.on_ice = true
