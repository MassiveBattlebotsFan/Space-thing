extends Spatial

export var options : Dictionary = {"isAnd":false, "isOr":false, "isNand":false, "isToggle":false}

var output_power := false
var input_power = {}

signal update_power_state(power, wireName)

func _on_power_toggled(_state, buttonName):
	if buttonName in input_power.keys():
		input_power[buttonName] = !input_power[buttonName]
	if options.isAnd:
		output_power = true
		for value in input_power.values():
			if not value:
				output_power = false
				break
	elif options.isOr:
		output_power = false
		for value in input_power.values():
			if value:
				output_power = true
				break
	elif options.isNand:
		output_power = false
		for value in input_power.values():
			if not value:
				output_power = true
				break
	elif options.isToggle:
		output_power = !output_power
	else:
		output_power = true
	emit_signal("update_power_state", output_power, name)

func _on_button_register(buttonName):
	input_power[buttonName] = false
