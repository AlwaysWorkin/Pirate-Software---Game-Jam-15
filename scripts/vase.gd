extends Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var game_manager = GameManager

func break_vase():
	game_manager.vase_broken = true
	animation_player.play("breaking")
