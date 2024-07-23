extends Node2D
@onready var broken_vase = $windowbackground/broken_vase
@onready var vase = $windowbackground/vase

func _ready():
	if GameManager.vase_broken:
		vase.hide()
		broken_vase.show()
		print("broken")
	else:
		vase.show()
		broken_vase.hide()
		print("unbroken")
