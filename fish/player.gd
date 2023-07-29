extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("walk_right"):
		_animated_sprite.play("walk")
		_animated_sprite.flip_h = false
#		velocity.x += SPEED * delta
		global_position.x += SPEED * delta
	elif Input.is_action_pressed("walk_left"):
		_animated_sprite.play("walk")
		_animated_sprite.flip_h = true
#		velocity.x -= SPEED * delta
		global_position.x -= SPEED * delta

	move_and_slide()
