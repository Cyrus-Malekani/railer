class_name PlatformerCharacter2D
extends CharacterBody2D

signal direction_changed(direction: Vector2)

@export_range(0, 100, .2, "or_greater") var move_speed : float = 120.0

@export var can_ground_jump = false
@export_range(0, 100, .2, "or_greater") var jump_force : float = 350.0

var direction : Vector2 : 
	set(value):
		if direction == value:
			return
		
		direction = value
		direction_changed.emit(direction)

func _jump():
	velocity.y -= jump_force

## Makes character jump if possible
## Returns true if successful or false if failed
func try_jump() -> bool:
	if can_ground_jump && is_on_floor():
		_jump()
		return true
	
	return false

func _apply_gravity(delta):
	var gravity = get_gravity()
	velocity.x += gravity.x * delta
	velocity.y += gravity.y * delta
