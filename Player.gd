extends KinematicBody

# class member variables go here, for example:
export var speed = 25
export var direction = Vector3()
export var gravity = -9.8
var velocity = Vector3()

func _ready():
	# Called when the node is added to the scene for the first time.
	#set_process_input(true)
	pass


func _input(deltaVal):
	direction = Vector3(0,0,0)
	if Input.is_action_pressed("ui_left"):
		direction.x -=1
	if Input.is_action_pressed("ui_right") :
		direction.x +=1
	if Input.is_action_pressed("ui_up"):
		direction.z -=1
	if Input.is_action_pressed("ui_down"):
		direction.z +=1
		
	direction = direction.normalized() #to keep same speed
	direction *= speed # * deltaVal
	#print("deltaVal typeof is: ", typeof(deltaVal), " | value = ", deltaVal)
	
	if	velocity.y >0:
		gravity = -20
	else:
		gravity = -30
	
	velocity.y += gravity #* deltaVal
	velocity.x = direction.x
	velocity.z = direction.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y =150
		
	var hitCount = get_slide_count() 
	if hitCount >0:
		var collision = get_slide_collision(0)
		if collision.collider is RigidBody:
			collision.collider.apply_impulse(collision.position, -collision.normal)
		


func _process(delta):
	# Called every frame. Delta is time since last frame.

	_input(delta)
	pass
