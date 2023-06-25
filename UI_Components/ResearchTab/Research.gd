extends Control

#@export var terrestrial_data = preload("res://Resources/Data.tres")

var chosen_research_topic = null

var research_increment = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	for N in $MiddlePanel.get_children():
		N.connect("ResearchSignal",new_topic)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func tick():
	if chosen_research_topic:
		var data_array = chosen_research_topic.research_tick(research_increment)
		var spent_data = data_array[0]
		var finished = data_array[1]
#		terrestrial_data.value -= spent_data


func new_topic(research_resource):
	chosen_research_topic = research_resource


func _on_h_slider_value_changed(value):
	research_increment = value
