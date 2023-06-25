extends Node

var earth = preload("res://Locations/Earth.tres")

var planets = [preload("res://Locations/Earth.tres"),\
				]

func _ready():
	pass

func _on_tick():
	for planet in planets:
		planet.tick()
