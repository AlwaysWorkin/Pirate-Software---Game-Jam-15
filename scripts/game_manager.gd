extends Node
const PLAYERINV = preload("res://inventory/playerinv.tres")

var vase_broken = false
var window_shade_frame = 0
var inventory: Inv = PLAYERINV
#All items picked up

func collect(item: InvItem):
	inventory.insert(item)
