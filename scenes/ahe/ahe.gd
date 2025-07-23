extends CharacterBody2D

const SPEED = 100
const JUMP_FORCE = -300
const GRAVITY = 800  

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta

	# Horizontal movement
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite2D.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite2D.flip_h = true
	else:
		velocity.x = 0

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE

	move_and_slide()
