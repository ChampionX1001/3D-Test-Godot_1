class_name AoE_marker

extends Decal

func _init(x:float, z:float, rad:float) -> void:
	texture_albedo = preload("res://images/AoE_Marker.png")
	normal_fade = 0.5
	
	size.x = rad*2
	size.y = 100
	size.z = rad*2
	
	position.x = x
	position.y = 0
	position.z = z
	
	visible = true
	
	print("marking")

func update_pos(x:float, z:float):
	position.x = x
	position.y = 0
	position.z = z
	
func delete() -> void:
	queue_free() 
