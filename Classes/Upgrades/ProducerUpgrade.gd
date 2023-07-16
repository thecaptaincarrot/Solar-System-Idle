extends Upgrade
class_name ProducerUpgrade

@export var buildings_affected : Array[ProducerBuilding]

@export var resources_produced = {
								"ore": 0,
								"alloy" : 0,
								"hydrocarbons" : 0,
								"fuel" : 0,
								"data" : 0,
								}

