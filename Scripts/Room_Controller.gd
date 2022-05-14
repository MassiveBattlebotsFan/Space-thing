extends Spatial

onready var currentRoom = get_child(0)
onready var rooms = get_children()

func _ready():
	for child in get_children():
		child.hide()
	currentRoom.show()

func switch_main_room(name):
	currentRoom.hide()
	currentRoom = get_child(name) #placeholder
	currentRoom.show()
	pass


func _on_Elevator_room_changed(name):
	switch_main_room(name) #placeholder
