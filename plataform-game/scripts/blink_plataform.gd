extends StaticBody3D

var visible_time = 2.0
var hidden_time = 1.5
var timer = 0.0
var is_blinking_visible = true

func _physics_process(delta):
	timer += delta
	if is_blinking_visible and timer >= visible_time:
		is_blinking_visible = false
		timer = 0.0
		$MeshInstance3D.visible = false
		$CollisionShape3D.disabled = true
	elif not is_blinking_visible and timer >= hidden_time:
		is_blinking_visible = true
		timer = 0.0
		$MeshInstance3D.visible = true
		$CollisionShape3D.disabled = false
