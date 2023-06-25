extends Resource
class_name Planet

@export var Name = "PLANETNAME"

@export var OrbitalDistance = 152000000 #in km
@export var SurfaceGravity = 9.8 #m/s^2
@export var AtmosphericDensity = 1.293 #kg/m^3

#@export var DataHere : Data
@export var DataMult = 1.0

@export var mine : Building
@export var Buildings : Array[Building] #Ideally this should only be unique buildings for this location

var upgrades = [] #this should auto populate with upgrades that are possible for this location

var orbit # orbit resource

#resources
#Global Resources
var money = preload("res://Resources/Money.tres")
#local resource
var ore = LocalResource.new()
var alloy = LocalResource.new()
var volatiles = LocalResource.new()
var fuel = LocalResource.new()

var ships_here

#Life Support Placeholder

#booleans
@export var is_earth = false #Should determine which base buildings are available
@export var can_land = true

func initialize():
	for building in Buildings:
		if building is ProducerBuilding:
			building.produce_resource.connect(building_production)


func building_production(resource_key, amount):
	var resource_lower = resource_key.to_lower()
	get(resource_lower).add_value(amount)


func tick():
	for building in Buildings:
		building.on_tick()


func get_resource_value(resource_name):
	return get(resource_name.to_lower()).value
