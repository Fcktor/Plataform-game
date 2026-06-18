extends CharacterBody3D

const SPEED = 6.0
const JUMP_VELOCITY = 8.0
const GRAVITY = 20.0

var on_ice = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var dir = Vector3.ZERO
	if Input.is_action_pressed("ui_right"): dir.x += 1
	if Input.is_action_pressed("ui_left"):  dir.x -= 1
	if Input.is_action_pressed("ui_up"):    dir.z -= 1
	if Input.is_action_pressed("ui_down"):  dir.z += 1

	if on_ice:
		velocity.x = lerp(velocity.x, dir.x * SPEED, 0.02)
		velocity.z = lerp(velocity.z, dir.z * SPEED, 0.02)
	else:
		velocity.x = dir.x * SPEED
		velocity.z = dir.z * SPEED

	on_ice = false
	move_and_slide()
