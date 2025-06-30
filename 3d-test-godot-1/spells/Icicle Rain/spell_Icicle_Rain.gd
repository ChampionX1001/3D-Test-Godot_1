extends Node3D

@export var numOfIcicles := 25
@export var duration := 2.0
@export var radius := 5
@export var dist := 15

func _on_proto_controller_spell_icicle_rain(dir: float) -> void:
	icicle_rain(dir)

func icicle_rain(dir: float):
	position = $"../ProtoController".position
	
	var delay = duration / numOfIcicles  # total 3 seconds spread across all icicles
	
	var tempdir = 90 - dir
	var posX = position.x - (dist * cos(deg_to_rad(tempdir)))
	var posZ = position.z - (dist * sin(deg_to_rad(tempdir)))
	
	var ray = RayCast3D.new()
	$"../ProtoController/Head".add_child(ray)
	ray.target_position = Vector3(0, 0, -1 * dist)
	
	var marker = AoE_marker.new(posX, posZ, radius)
	add_sibling(marker)
	
	while not Input.is_action_pressed("spell_confirm"):
		
		if ray.is_colliding():
			posX = ray.get_collision_point().x
			posZ = ray.get_collision_point().z
		else:
			tempdir = 90 - $"../ProtoController".rotation_degrees.y
			posX = $"../ProtoController".position.x - (dist * cos(deg_to_rad(tempdir))) 
			#make it ray.rotation_degrees.y to test
			posZ = $"../ProtoController".position.z - (dist * sin(deg_to_rad(tempdir)))	
		
		marker.update_pos(posX, posZ)
		
		await get_tree().process_frame
	
	marker.delete()
	
	for i in range(numOfIcicles):
		var randPosX = randf_range(posX-radius, posX+radius)
		var randPosZ = randf_range(posZ-radius, posZ+radius)
		var posY = float(position.y + 10)
		
		
		add_sibling(Icicle.new(randPosX, posY, randPosZ))
		
		await get_tree().create_timer(delay).timeout


func _on_proto_controller_spell_confirm() -> void:
	pass # Replace with function body.
