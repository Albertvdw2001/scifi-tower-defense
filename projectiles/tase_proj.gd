extends ProjectileBase

@onready var anim_sprite: AnimatedSprite2D = $AnimSprite

func _ready() -> void:
	print("proj ready has run")
	play_attack_animation()


func play_attack_animation() -> void:
	print("playing proj attack animation")
	if anim_sprite.animation != "attack_animation":
		anim_sprite.play("attack_animation")
