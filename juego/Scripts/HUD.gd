extends Control


onready var etiquetavidas = $contenedorvidas/cantidad
onready var monedaoro = $contenedormonedasoro/cantidad


func _ready():
	Eventos.connect("actualizar_hud", self, "actualizar_hud")
	actualizar_hud()


func actualizar_hud():
	etiquetavidas.text = "%s" % DatosJuego.vidas 
	monedaoro.text = "%s" % DatosJuego.monedasoro
