extends Resource
class_name CostCurve

@export_enum("Zero","Linear", "Geometric", "Exponential", "Logarithmic") var CurveForm = 0
@export_enum("ore","alloy","hydrocarbons","fuel") var resource : String

@export var term1 = 1.0
@export var term2 = 0.0

@export var x_offset = 0.0
@export var y_offset = 100.0

func get_cost(starting_value, amount):
	var value = 0.0
	
	for i in range(starting_value,amount + starting_value):
		match CurveForm:
			0:
				value += 0
			1:#Linear
				value += term1*(i - x_offset) + y_offset
			2: #Geometric
				value += pow(i - x_offset,term1) + y_offset
			3: #Exponential
				value += term2*pow(term1,i - x_offset) + y_offset
			4: #logarithmic
				value += 0 #TO DO???
	return round(value)

