class_name Icicle

extends RigidBody3D



var mesh: Node3D
var coll: CollisionShape3D

func _init(x:float, y:float, z:float) -> void:

	mesh = preload("res://spells/Icicle Rain/Icicle.glb").instantiate()
	add_child(mesh)
	mesh.get_children()[0].set_surface_override_material(0, preload("res://spells/Icicle Rain/icicle_material_1.tres"))
	#mesh = preload("res://spells/Icicle Rain/Icicle.glb")
	#mesh.material_override = preload("res://spells/Icicle Rain/icicle_material.tres")
	
	coll = CollisionShape3D.new()	
	coll.shape = preload("res://spells/Icicle Rain/icicle_collision.tres")
	coll.scale = Vector3(0.1, 0.5, 0.1)
	add_child(coll)
	
	gravity_scale = 2.0
	mass = 1
	set_axis_velocity(Vector3(0, -20, 0))
	#set_axis_velocity(Vector3(15, -20, 0))
	#rotate_z(3.14/4)
	
	set_contact_monitor(true)
	set_max_contacts_reported(1)

	
	position.x = x
	position.y = y
	position.z = z
	
	
func _physics_process(delta: float) -> void:
	if get_contact_count() > 0:
		self.queue_free()
		pass
	
