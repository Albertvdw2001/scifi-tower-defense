extends Node2D

@export var projectile: PackedScene
@export var is_static_projectile: bool = true

@onready var projectile_slot: Node2D = $ProjectileSlot

func _physics_process(delta: float) -> void:
	apply_look_point_direction()
	if (Input.is_action_just_pressed("attack")):
		spawn_projectile()

# points extension front x to where mouse is
func apply_look_point_direction():
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

# spawns (or rather "instantiates") a new instance of object assigned to 'projectile'
# inside 'projectile_slot'
func spawn_projectile():
	var new_projectile = projectile.instantiate() as ProjectileBase
	new_projectile.is_static = is_static_projectile
	if is_static_projectile:
		#new_projectile.position = projectile_slot.position
		projectile_slot.add_child(new_projectile)
	else:
		new_projectile.direction = Vector2.RIGHT.rotated(projectile_slot.global_rotation)
		new_projectile.global_position = projectile_slot.global_position
		get_tree().current_scene.add_child(new_projectile)

	
