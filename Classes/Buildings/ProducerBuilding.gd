extends Building
class_name ProducerBuilding

@export var resources_produced = {
								"ore": 0,
								"alloy" : 0,
								"hydrocarbons" : 0,
								"fuel" : 0,
								"data" : 0,
								}

signal produce_resource

func on_tick():
	for resource_key in resources_produced.keys():
		emit_signal("produce_resource",resource_key,resources_produced[resource_key]*level)
