extends Control

#@export var terrestrial_data = preload("res://Resources/Data.tres")
const TOPICCONTAINER = preload("res://UI_Components/ResearchTab/research_option.tscn")

var researching = []

var research_increment = 1.0

var data_per_day = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	#Load research topics
	var research_topics = []
	#1. load research from research folder
	var path = "res://Research/"
	var research_dir = DirAccess.open(path)
	if research_dir:
		research_dir.list_dir_begin()
		var filename = research_dir.get_next()
		while filename != "":
			if research_dir.current_is_dir():
				print("Foudn Directory")
			else:
				var potential_research = load(path+filename)
				if potential_research is ResearchTopic:
					research_topics.append(potential_research)
					print(filename)
			filename = research_dir.get_next()
	#Get topics from Planets
	for planet in PlanetHandler.get_planets():
		for topic in planet.get_research():
			research_topics.append(topic)
	
	
	for topic in research_topics:
		var new_option = TOPICCONTAINER.instantiate()
		
		new_option.research_resource = topic
		
		new_option.connect("AddTopic",add_topic)
		new_option.connect("RemoveTopic",remove_topic)
		new_option.connect("TopicFinished",topic_finished)
		
		new_option.research_overview = self
		
		$ResearchContainer.add_child(new_option)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func tick():
	pass
	for handler in researching:
		handler.tick(data_per_day)


func add_topic(new_option):
	if len(researching) < GlobalStats.max_research:
		researching.append(new_option)
		new_option.activate()
		#
	else:
		pass


func remove_topic(option):
	researching.erase(option)
	option.deactivate()


func topic_finished(option):
	researching.erase(option)
	#send option to archive?


func _on_h_slider_value_changed(value):
	data_per_day = value
