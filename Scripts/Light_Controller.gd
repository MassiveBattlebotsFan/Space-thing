extends StaticBody

#export var connectedButton = false

var lightOn := false

"""func _process(_delta):
	if connectedButton:
		if get_parent().state > 0 and not lightOn:
			$Light_On.visible = true
			$Light_Off.visible = false
			lightOn = true
		elif get_parent().state < 0 and lightOn:
			$Light_On.visible = false
			$Light_Off.visible = true
			lightOn = false"""
func _on_power_toggled(state, _name):
	print("recieved sig")
	lightOn = state
	#print("light state: ", lightOn)
	$Light_On.visible = lightOn
	$Light_Off.visible = !lightOn
