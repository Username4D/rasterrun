extends Node

var pb = 0
var shaders_enabled = true
var glow_enabled = true
var fog_enabled = true
var sound_enabled = false

func _ready() -> void:
	var file = FileAccess.open("user://save.dat", FileAccess.READ)
	if file != null:
		var content = file.get_var()
		pb = content["pb"]
		shaders_enabled = content["shaders_enabled"]
		glow_enabled = content["glow_enabled"]
		fog_enabled = content["fog_enabled"]
		sound_enabled = content["sound_enabled"]

func save():
	var content = {"pb": pb, "shaders_enabled": shaders_enabled, "glow_enabled": glow_enabled, "fog_enabled": fog_enabled, "sound_enabled": sound_enabled}
	FileAccess.open("user://save.dat", FileAccess.WRITE).store_var(content)
