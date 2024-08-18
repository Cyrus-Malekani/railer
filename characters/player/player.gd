class_name Player
extends PlatformerCharacter2D

func _physics_process(delta: float) -> void:
	velocity.x = move_speed * direction.x
	#print("velocity x:", velocity.x)
	#print("velocity y:", velocity.y)
	#print("direction :", direction.x)
	_apply_gravity(delta)
	move_and_slide()
