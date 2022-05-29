extends StaticBody

export var state := false
export var isToggle := true
export var buttonReturnDelay := 0.5
export var isPlayerResettable := true
export var startButtonPressed := false

var locked := false

signal button_state_toggled(state, buttonName)
signal register_button(buttonName)

onready var anim = $Button_Collider/Button_Anim

func _ready():
	if startButtonPressed:
		state = true
		anim.play("Button_anim", -1, 1000)
	emit_signal("register_button", name)

func reset():
	if state:
		var old_IPR = isPlayerResettable
		isPlayerResettable = true
		clicked()
		isPlayerResettable = old_IPR

func clicked():
	if not isPlayerResettable and state:
		print("button not player resettable")
		return
	if locked:
		print("button animation locked")
		return
	locked = true
	toggle_button_state()
	if state:
		anim.play("Button_anim")
		if not isToggle:
			yield(get_tree().create_timer(buttonReturnDelay), "timeout")
			toggle_button_state()
			anim.play_backwards("Button_anim")
	else:
		anim.play_backwards("Button_anim")
	locked = false
	print("Button with name "+get_name()+" state:"+str(state))

func toggle_button_state():
	state = !state
	print("sent sig")
	emit_signal("button_state_toggled", state, name)
