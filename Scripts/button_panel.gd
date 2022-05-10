extends MeshInstance

var activeButton = 1

func reset_other_buttons(exclude):
	if exclude != 1:
		$Button.reset()
	if exclude != 2:
		$Button2.reset()
	if exclude != 3:
		$Button3.reset()

func _process(delta):
	if $Button.state > 0 and activeButton != 1:
		reset_other_buttons(1)
		activeButton = 1
	if $Button2.state > 0 and activeButton != 2:
		reset_other_buttons(2)
		activeButton = 2
	if $Button3.state > 0 and activeButton != 3:
		reset_other_buttons(3)
		activeButton = 3
