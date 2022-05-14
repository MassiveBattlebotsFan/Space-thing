extends KinematicBody

const SPEED = 5
const GRAVITY = 2
const SPIN = 0.025

var direction = Vector3()
var velocity = Vector3()

func _physics_process(_delta):
	get_key_input()
	velocity = Vector3(0, velocity.y, 0)
	velocity.z += direction.z * SPEED
	velocity.x += direction.x * SPEED
	velocity.y -= GRAVITY
	velocity = move_and_slide(velocity, Vector3.UP)
	
func get_key_input():
	direction = Vector3()
	if Input.is_action_pressed("move_forward"):
		direction += -transform.basis.z
	if Input.is_action_pressed("move_back"):
		direction -= -transform.basis.z
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	if Input.is_action_just_pressed("toggle_mouse_capture"):
		Input.set_mouse_mode(Input.get_mouse_mode()^0b10) # mouse visible is 0, mouse captured is 2
	if Input.is_action_just_pressed("mouse_click"):
		click_raycast_target()

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == 2:
		rotate_y(-lerp(0, SPIN, event.relative.x/10))
		transform = transform.orthonormalized()

func click_raycast_target():
	if $Player_Camera_Pivot/Player_RayCast.is_colliding():
		$Player_Camera_Pivot/Player_RayCast.get_collider().clicked()
