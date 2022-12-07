extends Control
tool

export(String, FILE, "*.tscn") var menu_ajustes = ""
export(String, FILE, "*.tscn") var nivel_inicial = ""
export(String, FILE, "*.tscn") var pantalla_carga = ""

func _on_BotonSalir_pressed() -> void:
	get_tree().quit()
	
func _on_BotonOpciones_pressed() -> void:
#	$BotonSFX.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene(menu_ajustes)
	
func _get_configuration_warning() -> String:
	if menu_ajustes == "":
		return "Chequear rutas"
		
	return ""

func _on_BotonNuevo_pressed() -> void:
	DatosJuego.nivel_actual = nivel_inicial
# warning-ignore:return_value_discarded
	get_tree().change_scene(pantalla_carga)

func _on_BotonCargar_pressed() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	cargar.cargar_datos_juego()
