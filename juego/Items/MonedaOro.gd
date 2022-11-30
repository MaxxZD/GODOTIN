extends Area
class_name Moneda

# warning-ignore:unused_argument
func _on_body_entered(body: Node) -> void:
	DatosJuego.sumar_monedas()
	$Colisionador.set_deferred("disabled", true)
	$AnimationPlayer.play("consumida")
