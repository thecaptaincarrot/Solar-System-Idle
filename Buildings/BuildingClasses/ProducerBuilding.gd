extends Building
class_name ProducerBuilding

@export var resources_produced = {}

signal produce_resource

func on_tick():
	for resource_key in resources_produced.keys():
		emit_signal("produce_resource",resource_key,resources_produced[resources_produced]*level)
