extends AnimatedSprite2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var open_window_sound = $OpenWindowSound
@onready var close_window_sound = $CloseWindowSound
@onready var game_manager = GameManager
@onready var vase = $"../vase"

var mouseInWindow = false

func _ready():
	frame = game_manager.window_shade_frame
	# Enable mouse input for this AnimatedSprite
	set_process_input(true)

func _input(event):
	# Check if the left mouse button was clicked
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Check if the click occurred on the sprite
		if mouseInWindow:
			if !game_manager.vase_broken:
				vase.break_vase()
			# Advance the frame
			advance_frame()

func _on_area_2d_mouse_entered():
	mouseInWindow = true

func _on_area_2d_mouse_exited():
	mouseInWindow = false

func advance_frame():
	var frame_count = sprite_frames.get_frame_count(animation)  # Get the total frame count for the current animation
	if frame >= (frame_count-1):  # If we've reached the last frame, loop back to the first
		frame = 0
	else :
		frame += 1  # Advance to the next frame
	
	game_manager.window_shade_frame = frame
	
	if frame % 2 == 0:
		collision_shape_2d.scale = Vector2(2, 1)  # Scale the collision shape
		open_window_sound.play()
	else:
		collision_shape_2d.scale = Vector2(1, 1)  # Reset the scale of the collision shape
		close_window_sound.play()
