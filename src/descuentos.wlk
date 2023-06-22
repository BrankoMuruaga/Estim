class Descuento{
	method descuentoAAplicarA_(unJuego)
}


class DescuentoFijo inherits Descuento{
	const montoADescontar
	
	override method descuentoAAplicarA_(unJuego) = montoADescontar
}

class DescuentoDirecto inherits Descuento{
	var porcentajeADescontar
	
	override method descuentoAAplicarA_(unJuego){
	porcentajeADescontar = 0.max(100.min(porcentajeADescontar))
	
	return	unJuego.precioDeLista()*(porcentajeADescontar/100)		
	} 
}

class DescuentoDeNavidad inherits DescuentoDirecto{
	override method descuentoAAplicarA_(unJuego){
		const descuentoAdicional = new DescuentoDirecto(porcentajeADescontar = 10)
		return	super(unJuego) + descuentoAdicional.descuentoAAplicarA_(unJuego)
		
	}
}


object gratis inherits Descuento{
	override method descuentoAAplicarA_(unJuego) = unJuego.precioDeLista()
}

object sinDescuento inherits Descuento{
	override method descuentoAAplicarA_(unJuego) = 0
}

