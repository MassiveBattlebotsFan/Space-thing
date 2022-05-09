extends Spatial

const MAX_UP_ANGLE = 60
const MAX_DOWN_ANGLE = 60

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == 2:
		rotate_x(-lerp(0, get_parent().SPIN, event.relative.y/10))
		rotation.x = clamp(rotation.x, deg2rad(-MAX_DOWN_ANGLE), deg2rad(MAX_UP_ANGLE))
