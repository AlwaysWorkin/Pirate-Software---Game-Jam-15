extends Sprite2D

func _ready():
	if !GameManager.vase_broken:
		hide()

