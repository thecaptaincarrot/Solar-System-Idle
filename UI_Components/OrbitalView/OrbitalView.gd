extends Control

const SATELLITE = preload("res://UI_Components/OrbitalView/satellite.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	RocketsInSpace.RocketLaunch.connect(new_rocket_launched)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_open():
	pass


func new_rocket_launched(RocketResource):
	var new_satellite = SATELLITE.instantiate()
	
	new_satellite.offset.x = randi_range(128, 256)
	
	$ColorRect/Earth.add_child(new_satellite)
