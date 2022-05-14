extends StaticBody

export var activeButton = 0

onready var buttonPanel = $Button_Panel
onready var buttons = buttonPanel.get_children()
onready var numberOfButtons = len(buttons)

const rooms = [0, 1, null]

signal room_changed(name)

func _ready():
	print("Number of buttons: " + str(numberOfButtons))
	print(buttons)

func reset_other_buttons(exclude):
	for i in range(numberOfButtons):
		if i != exclude:
			buttons[i].reset()

func _process(_delta):
	for i in range(numberOfButtons):
		if buttons[i].state > 0 and i != activeButton:
			print("Button toggled: " + str(i))
			if rooms[i] != null:
				emit_signal("room_changed", rooms[i])
			activeButton = i
			reset_other_buttons(i)
			break
