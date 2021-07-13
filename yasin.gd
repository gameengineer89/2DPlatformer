extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 180
const GRAVITY = 35
const JUMPFORCE = -1100

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idle")

	if not is_on_floor():
		$Sprite.play("jump")

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE

	velocity.y = velocity.y + GRAVITY;
	

	

	velocity = move_and_slide(velocity, Vector2.UP)

	#this is for rmoving gravity pull when collide to the floor
	velocity.x = lerp(velocity.x, 0, 0.2)
