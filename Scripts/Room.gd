extends Spatial

func hide():
	for object in $Objects.get_children():
		object.visible = false
		object.collision_layer = 0
		object.collision_mask = 0
	for button in $Buttons.get_children():
		button.visible = false
		button.collision_layer = 0
		button.collision_mask = 0

func show():
	for object in $Objects.get_children():
		object.visible = true
		object.collision_layer = 1
		object.collision_mask = 1
	for button in $Buttons.get_children():
		button.visible = true
		button.collision_layer = 3
		button.collision_mask = 1
