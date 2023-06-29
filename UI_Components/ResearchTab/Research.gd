extends Control

#@export var terrestrial_data = preload("res://Resources/Data.tres")

var researching = []

var research_increment = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	for N in $ResearchContainer.get_children():
		N.connect("AddTopic",add_topic)
		N.connect("RemoveTopic",remove_topic)
		N.connect("TopicFinished",topic_finished)
		
		N.research_overview = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func tick():
	pass
	for handler in researching:
		handler.tick()


func add_topic(new_option):
	if len(researching) < GlobalStats.max_research:
		researching.append(new_option)
		new_option.activate()
		#
	else:
		pass


func remove_topic(option):
	researching.erase(option)
	option.dectivate()


func topic_finished(option):
	researching.erase(option)
	#send option to archive?s
