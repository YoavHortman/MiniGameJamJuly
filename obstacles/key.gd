extends Area2D

func canEnter(state):
	if visible:
		var player = get_node("../Cube")
		player.onKeyPickup()
		visible = false
	return true;
