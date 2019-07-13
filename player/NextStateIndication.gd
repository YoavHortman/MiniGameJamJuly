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
	$Up.animation = face.getAnimationForState(face.getNextUp())
	$Down.animation = face.getAnimationForState(face.getNextDown())
	$Left.animation = face.getAnimationForState(face.getNextLeft())
	$Right.animation = face.getAnimationForState(face.getNextRight())
	pass # Replace with function body.
