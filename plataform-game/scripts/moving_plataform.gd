extends StaticBody3D

var speed = 2.0
var distance = 4.0
var start_pos
var time = 0.0

func _ready():
	start_pos = position

func _physics_process(delta):
	time += delta
	position.x = start_pos.x + sin(time * speed) * distance
	constant_linear_velocity = Vector3(cos(time * speed) * speed * distance, 0, 0)
