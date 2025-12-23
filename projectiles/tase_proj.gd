extends ProjectileBase

@onready var anim_sprite: AnimatedSprite2D = $AnimSprite

func _ready() -> void:
	play_attack_animation()


func play_attack_animation() -> void:
	if anim_sprite.animation != "attack":
		anim_sprite.play("attack")
	else:
		anim_sprite.play()
