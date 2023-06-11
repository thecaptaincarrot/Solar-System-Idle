extends Resource
class_name BasePlanet

@export var name = "PLANETNAME"

@export var orbital_distance = 152000000 #in km
@export var surface_gravity = 9.8 #m/s^2
@export var atmospheric_density = 1.293 #kg/m^3

@export var data_here : Data
@export var data_mult = 1.0

@export var buildings : Array[Building] #both possible and quantity
var building_dict = {}

var upgrades = [] #this should auto populate with upgrades that are possible for this location

var orbit # orbit resource

#inherit resources
var resource #need all resources

var ships_here

#Life Support Placeholder

#booleans
@export var is_earth = false
@export var can_land = true
@export var can_breathe = true

func initialize():
	for building in buildings:
		var new_building = building.duplicate()
		building_dict[new_building] = 0
		#This works but fucks up the keying
		#Match names instead of actual resource?
	print(building_dict)

func tick():
	pass
