extends Global_Resource

@export var LobbyOfficeResource : Building

func initialize():
	value = 100000.0


func get_base_per_tick():
	per_tick = LobbyOfficeResource.get_level() * 1
	
	per_tick += RocketsInSpace.get_money_per_day()
	
	return per_tick
