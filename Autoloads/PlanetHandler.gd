extends Node

var earth = preload("res://Locations/Earth/Earth.tres")

var planets = [preload("res://Locations/Earth/Earth.tres"),\
				]

func _ready():
	for planet in planets:
		planet.initialize()

func _on_tick():
	for planet in planets:
		planet.tick()

func get_planets():
	return planets
