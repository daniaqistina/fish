extends Area2D


# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	if body.get_name() == "player":
		$Sprite2D/AnimatedSprite2D.play("gen_anim.png")
		
		await get_tree().create_timer(5.0).timeout

		get_tree().change_scene_to_file("res://world_2.tscn")
