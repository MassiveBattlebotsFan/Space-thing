extends StaticBody

export var toggle = -1

func clicked():
	toggle *= -1
	print(toggle)
	if toggle > 0:
		$MeshInstance/Button_anim.play("Button_anim")
	else:
		$MeshInstance/Button_anim.play_backwards("Button_anim")
