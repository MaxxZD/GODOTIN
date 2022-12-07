class_name Sierra
extends Area

func _on_Sierra_body_entered(body: Node) -> void:
	var player: Godotin = body 
	if player.has_method("respawn"):
		player.respawn()
