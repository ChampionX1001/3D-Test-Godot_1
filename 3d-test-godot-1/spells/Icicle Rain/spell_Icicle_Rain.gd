extends Node3D

@export var numOfIcicles := 25
@export var duration := 2.0
@export var radius := 5
@export var dist := 15

func _on_proto_controller_spell_icicle_rain(dir: float) -> void:
	icicle_rain(dir)

func icicle_rain(dir: float):
	position = $"../ProtoController".position
	print(str(position))
	
	var delay = duration / numOfIcicles  # total 3 seconds spread across all icicles
	
	var tempdir = 90 - dir
	var posX = position.x - (dist * cos(deg_to_rad(tempdir)))
	var posZ = position.z - (dist * sin(deg_to_rad(tempdir)))
	
	for i in range(numOfIcicles):
		var randPosX = randf_range(posX-radius, posX+radius)
		var randPosZ = randf_range(posZ-radius, posZ+radius)
		var posY = float(position.y + 10)
		
		
		add_sibling(Icicle.new(randPosX, posY, randPosZ))
		
		await get_tree().create_timer(delay).timeout
