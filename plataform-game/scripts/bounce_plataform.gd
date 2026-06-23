extends StaticBody3D

var bounce_force = 20.0
var player = null
var can_bounce = true

func _ready():
	await get_tree().process_frame
	player = get_tree().root.find_child("Player", true, false)

func _physics_process(_delta):
	if player:
		var pp = player.global_position
		var mp = global_position
		var dx = abs(pp.x - mp.x)
		var dz = abs(pp.z - mp.z)
		var dy = pp.y - mp.y
		var on_platform = dx < 1.4 and dz < 1.4 and dy > 0.2 and dy < 1.8
		if on_platform and can_bounce:
			player.velocity.y = bounce_force
			can_bounce = false
		elif not on_platform:
			can_bounce = true
