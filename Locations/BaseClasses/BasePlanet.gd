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
var money_pertick = 0.0
#local resource
var ore = LocalResource.new()
var ore_pertick = 0.0
var alloy = LocalResource.new()
var alloy_pertick = 0.0
var volatiles = LocalResource.new()
var volatiles_pertick = 0.0
var fuel = LocalResource.new()
var fuel_pertick = 0.0

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
	
	add_pertick(resource_lower, amount)


func add_pertick(resource_key, value):
	if get(resource_key + "_pertick") == null:
		return
	set(resource_key + "_pertick", get(resource_key + "_pertick") + value)


func tick():
	money_pertick = 0.0
	ore_pertick = 0.0
	alloy_pertick = 0.0
	volatiles_pertick = 0.0
	fuel_pertick = 0.0
	
	var converters = []
	for building in Buildings:
		building.on_tick()
		if building is ConverterBuilding:
			converters.append(building)
	
	#Converters
	#1. Collect a list of all resources that are being converted
	#2. Compare resources individually against the current stock
	#3. get list of constrained resources, and then use that to create list of constrained/unconstrained converts
	#4. Unconstrained converters can go ahead
	#5. for constrained converters, go one at a time figuring out how many of each can be turned on
	#6. for constrained facilities, activate only the number that are allocated
	var coverted_resource = {}
	for converter in converters:
		for resource_key in converter.input_resources.keys():
			if !coverted_resource.keys().has(resource_key):
				coverted_resource[resource_key] = converter.input_resources[resource_key] * converter.level
			else:
				coverted_resource[resource_key] += converter.input_resources[resource_key] * converter.level
	
	var contrained_resources = []
	var constrained_converters = []
	for resource_key in coverted_resource.keys():
		if coverted_resource[resource_key] > get_resource_value(resource_key):
			contrained_resources.append(resource_key)
			for converter in converters:
				if converter.input_resources[resource_key] != 0 and !constrained_converters.has(converter):
					constrained_converters.append(converter)
	
	#Activate unconstrained converters
	var used_resources = {}
	for converter in converters:
		if !constrained_converters.has(converter):
			for key in converter.input_resources:
				if !used_resources.keys().has(key):
					used_resources[key] = converter.input_resources[key] * converter.get_level()
				else:
					used_resources[key] += converter.input_resources[key] * converter.get_level()
				get(key).spend(converter.input_resources[key] * converter.get_level())
				
				add_pertick(key, -converter.input_resources[key] * converter.get_level())
			for key in converter.output_resources:
				building_production(key, converter.output_resources[key] * converter.get_level())
	
	#Activate constrained converters
	var allowed_converters = {}
	var activating_converters = true
	while activating_converters:
		activating_converters = false
		for converter in constrained_converters:
			if !allowed_converters.keys().has(converter):
				allowed_converters[converter] = 0
			var can_add = true
			for key in converter.input_resources.keys():
				if !used_resources.keys().has(key):
					used_resources[key] = 0
				if  get_resource_value(key) < converter.input_resources[key] + used_resources[key]:
					can_add = false
			if can_add and allowed_converters[converter] < converter.get_level():
				allowed_converters[converter] += 1
				activating_converters = true
				for key in converter.input_resources.keys():
					used_resources[key] += converter.input_resources[key]
	
	for converter in allowed_converters.keys():
		for key in converter.input_resources:
			get(key).spend(converter.input_resources[key] * allowed_converters[converter])
			add_pertick(key, -converter.input_resources[key] * allowed_converters[converter])
		for key in converter.output_resources:
			building_production(key, converter.output_resources[key] * allowed_converters[converter])
	


func build_request(building, quantity):
	
	#See if all costs are satisfied
	var cost_satisfied = false
	for curve in building.cost_curves:
		var resource = curve.resource
		var cost = curve.get_cost(building.level,quantity)
		if get(resource).value < cost:
			return false
	
	for curve in building.cost_curves:
		var resource = curve.resource
		var cost = curve.get_cost(building.level,quantity)
		get(resource).spend(cost)
	
	building.build(quantity)
	return true


func get_pertick(resource):
	return get(resource + "_pertick")


func get_resource_value(resource_name):
	return get(resource_name.to_lower()).value
