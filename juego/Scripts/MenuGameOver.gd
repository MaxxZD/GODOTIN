extends Control

func _ready():
	$Puntaje.text = "Tu Puntaje es: {puntos}".format({"puntos": DatosJuego.generar_puntaje()})
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_BotonNuevo_pressed() -> void:
	get_tree().change_scene("res://juego/Menus/MenuInicio.tscn")
	
func _on_BotonSalir_pressed() -> void:
	get_tree().quit()
