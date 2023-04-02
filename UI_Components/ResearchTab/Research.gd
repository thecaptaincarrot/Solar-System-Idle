extends Control

@export var terrestrial_data = preload("res://Resources/Data.tres")

var chosen_research_topic = null

var research_increment = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func tick():
	if chosen_research_topic:
		var spent_data = chosen_research_topic.research_tick(research_increment)
		terrestrial_data -= spent_data
