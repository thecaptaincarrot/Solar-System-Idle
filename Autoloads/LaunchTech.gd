extends Node

var max_stages = 1
var exhaust_velocty = 2000 #m/s
var stage_mass = 1000 #kg
var fuel_per_stage = 100000 #Volume based on a fuel density of 1
							#Higher density fuels can fit more
							#Should these be resources instead? 
							#To allow for different sizes?
							#More efficient alloy wise to have one big stage in general
var fuel_density = 1.0	#Higher density = more fuel per stage = better efficiency

