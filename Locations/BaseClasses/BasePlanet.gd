extends Resource
class_name Planet

@export var Name = "PLANETNAME"

@export var OrbitalDistance = 152000000 #in km
@export var SurfaceGravity = 9.8 #m/s^2
@export var AtmosphericDensity = 1.293 #kg/m^3

@export var DataHere : Data
@export var DataMult = 1.0

@export var UniqueBuildings : Array[Building] #Ideally this should only be unique buildings for this location
var building_array = []

var upgrades = [] #this should auto populate with upgrades that are possible for this location

var orbit # orbit resource

#inherit resources
var resources #need all resources

var ships_here

#Life Support Placeholder

#booleans
@export var is_earth = false #Should determine which base buildings are available
@export var can_land = true
@export var can_breathe = true

func initialize():
	for building in UniqueBuildings:
		print(building)
		var new_building = building.new()
		building_array.append(new_building)
		#This works but fucks up the keying
		#Match names instead of actual resource?
		print(building_array)


func tick():
	pass
