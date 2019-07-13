extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Face_onMovementHappened():
	var face = get_node("../Face")
	$Up.modulate = face.getColorForInt(face.getNextUp())
	$Down.modulate = face.getColorForInt(face.getNextDown())
	$Left.modulate = face.getColorForInt(face.getNextLeft())
	$Right.modulate = face.getColorForInt(face.getNextRight())
	pass # Replace with function body.
