extends Control
tool

export(String, FILE, "*.tscn") var menu_inicial = ""

func _ready() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	cargar.cargar_datos_configuracion()

func _get_configuration_warning() -> String:
	if menu_inicial == "":
		return "No hay menu inicial asignado"
		
	return ""
	
func cargar_menu() -> void:
	get_tree().change_scene(menu_inicial)
