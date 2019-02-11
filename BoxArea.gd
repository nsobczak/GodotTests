extends Area

# class member variables go here, for example:
export var rotationAngles = Vector3(30,30,0)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	rotate_x(deg2rad(rotationAngles.x * delta))
	rotate_y(deg2rad(rotationAngles.y * delta))
	pass


func _on_BoxArea_body_entered(body):
	if	body is KinematicBody:
		queue_free()
	pass # replace with function body
