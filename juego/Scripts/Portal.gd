extends Area
class_name PortalNivel

export(String, FILE, "*.tscn") var proximo_nivel = ""

# warning-ignore:unused_argument
func _on_body_entered(body: Node) -> void:
	if proximo_nivel != "":
# warning-ignore:return_value_discarded
		get_tree().change_scene(proximo_nivel)
