extends Node3D

@export var score = 0

func start():
	$player.speed = 340
	$ui.visible = true
