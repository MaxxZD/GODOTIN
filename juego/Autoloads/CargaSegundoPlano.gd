extends Control

var hilo: Thread = null
var puede_iniciar: bool = false
var escena_precargada: Node = null

onready var barra_progreso: ProgressBar = $ProgressBar
onready var texto_completo: Label = $TextoCompleto

# warning-ignore:unused_argument

func _ready() -> void:
	barra_progreso.visible = false
	texto_completo.visible = false
	
func _unhandled_input(_event: InputEvent) -> void:
	if puede_iniciar:
		get_tree().current_scene.queue_free()
		get_tree().current_scene = null
		get_tree().root.add_child(escena_precargada)
		get_tree().current_scene = escena_precargada
		
		barra_progreso.visible = false
		texto_completo.visible = false
		puede_iniciar = false
		#opcional 
		queue_free()

##Metodos Custom
func cargar_nivel(nivel: String) -> void:
	hilo = Thread.new()
# warning-ignore:return_value_discarded
	hilo.start(self, "cargar_hilo", nivel, 2)
	raise()
	barra_progreso.visible = true

func cargar_hilo(nivel: String) ->void:
	var recurso_interactivo : ResourceInteractiveLoader = ResourceLoader.load_interactive(nivel)
	var total_partes: int = recurso_interactivo.get_stage_count()
	barra_progreso.max_value = total_partes
	
	var resultado: int = OK
	var recurso : Resource = null
	
	while resultado == OK:
		barra_progreso.value = recurso_interactivo.get_stage()
		resultado = recurso_interactivo.poll()

		
		if resultado != OK:
			if resultado == ERR_FILE_EOF:
				recurso = recurso_interactivo.get_resource()
				barra_progreso.value = total_partes
			else:
				printerr("Hubo un error en la carga de recursos")
	
	call_deferred("carga_completa", recurso)

func carga_completa(recurso: Resource) -> void:
	texto_completo.visible = true
	hilo.wait_to_finish()
	escena_precargada = recurso.instance()
	puede_iniciar = true
