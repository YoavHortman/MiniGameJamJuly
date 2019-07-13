extends Control

func _on_Retry_pressed() -> void:
	get_tree().change_scene("res://matrix/matrix.tscn");

func _on_Quit_pressed() -> void:
	get_tree().quit();