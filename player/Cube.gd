extends Area2D
var speed = 256 # big number because it's multiplied by delta
var tile_size = 100 # size in pixels of tiles on the grid
var last_position = Vector2() # last idle position
var target_position = Vector2() # desired position to move towards
var last_move := Vector2();
var movedir = Vector2() # move direction
var shouldContinueMovement = true;
var lastFace;
var LEFT := false;
var RIGHT := false;
var UP:= false;
var DOWN := false;
const defines = preload("res://matrix/Defines.gd")
func _ready():
	last_position = position
	target_position = position
	lastFace = $Face.currentFace;
	$Sprite.animation = $Face.getAnimationForState(lastFace);
func _process(delta):
	# MOVEMENT
	if !shouldContinueMovement:
		position = last_position
		target_position = last_position
		shouldContinueMovement = true;
	else:
		position += speed * movedir * delta
		
	if position.distance_to(last_position) >= tile_size: # if we've moved further than one space
		position = target_position # snap the player to the intended position
		var face = $Face.handleInput(UP, DOWN, LEFT, RIGHT);
		$Sprite.animation = $Face.getAnimationForState(face);
	
	# IDLE
	if position == target_position:
		get_movedir();
		last_move = movedir * tile_size;
		last_position = position # record the player's current idle position
		target_position += last_move # if key is pressed, get new target (also shifts to moving state)
	
	
# GET DIRECTION THE PLAYER WANTS TO MOVE
func get_movedir():
	LEFT = Input.is_action_just_pressed("ui_left")
	RIGHT = Input.is_action_just_pressed("ui_right")
	UP = Input.is_action_just_pressed("ui_up")
	DOWN = Input.is_action_just_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT) # if pressing both directions this will return 0
	movedir.y = -int(UP) + int(DOWN)
	
	
	if movedir.x != 0 && movedir.y != 0: # prevent diagonals
		movedir = Vector2.ZERO
	elif movedir.x != 0 || movedir.y != 0:
		$AudioStreamPlayer2D.play();
		lastFace = $Face.getFace();
		
func _on_Wall_area_entered(area):
	shouldContinueMovement = false;


func _on_Spike_area_entered(area):
	if lastFace == defines.Faces.Jump:
		target_position += last_move;
		last_position += last_move;
	else:
		get_tree().change_scene("res://GameOver/GameOver.tscn");

var has_key = false;
func _on_Key_area_entered(area):
	has_key = true;


func _on_Door_area_entered(area):
	if has_key && lastFace == defines.Faces.Key:
		get_tree().change_scene("res://GameOver/GameOver.tscn");
	else:
		shouldContinueMovement = false;