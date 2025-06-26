class_name Icicle

extends RigidBody3D



var mesh: MeshInstance3D
var coll: CollisionShape3D

func _init(x:float, y:float, z:float) -> void:

	mesh = MeshInstance3D.new()
	add_child(mesh)
	mesh.mesh = preload("res://spells/icicleMesh.tres")
	
	coll = CollisionShape3D.new()	
	coll.shape = preload("res://spells/icicleCollision.tres")
	add_child(coll)
	
	gravity_scale = 2.0
	mass = 1
	set_axis_velocity(Vector3(0, -10, 0))
	
	set_contact_monitor(true)
	set_max_contacts_reported(1)

	
	position.x = x
	position.y = y
	position.z = z
	
	
func _physics_process(delta: float) -> void:
	if get_contact_count() > 0:
		self.queue_free()
	
