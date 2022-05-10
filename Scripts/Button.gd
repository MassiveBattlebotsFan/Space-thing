extends StaticBody

export var state = -1
export var isToggle = true
export var buttonReturnDelay = 0.5
export var isPlayerResettable = true

var locked = false

func reset():
	if state > 0:
		var old_IPR = isPlayerResettable
		isPlayerResettable = true
		clicked()
		isPlayerResettable = old_IPR
	
func clicked():
	if not isPlayerResettable and state > 0:
		print("button not player resettable")
		return
	if locked:
		print("button animation locked")
		return
	locked = true
	state *= -1
	if state > 0:
		$CollisionShape/Button_anim.play("Button_anim")
		if not isToggle:
			yield(get_tree().create_timer(buttonReturnDelay), "timeout")
			$CollisionShape/Button_anim.play_backwards("Button_anim")
			state *= -1
	else:
		$CollisionShape/Button_anim.play_backwards("Button_anim")
	locked = false
	print(state)
	
