extends Sprite2D
@onready var animation_player = $AnimationPlayer

@export var item: InvItem

func _input(event):
	# Check if the left mouse button was clicked
	if event.is_action_pressed("click"):
		if is_pixel_opaque(get_local_mouse_position()):
			animation_player.play("pickup")

func pickup():
	GameManager.collect(item)
	queue_free()
