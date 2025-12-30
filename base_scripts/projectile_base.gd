class_name ProjectileBase

extends Area2D

var direction: Vector2 = Vector2.RIGHT

# false if projectile is not a moving projectile (e.g. a bullet) with its own, independant movement
# true if projectile sticks to weapon (e.g. taser electric shock)
@export var is_static: bool = false

@export var attack_animation_name: String = "attack_animation"

# speed at which a non-static projectile moves
@export var movement_speed: float = 500

# damage that projectile does
@export var damage: int = 10

# for static projectiles. interval at which damage is applied
@export var static_damage_interval_sec: float


func _physics_process(delta: float) -> void:
	if is_static:
		if is_attack_released():
			queue_free()
	else:
		apply_movement(delta)


func is_attack_released() -> bool:
	if not Input.is_action_pressed("attack"):
		return true
	else:
		return false


func apply_movement(delta: float):
	global_position += direction * movement_speed * delta
	
