/*Por ahora no vamos a tener en cuenta qué hace cada empleado al recibir el dinero, el único 
 * efecto que nos interesa del pago es que disminuye el fondo de Giménez.*/

object galvan{
	
	var sueldoActual = 150000
	var fondosDisponibles = 0
	var deuda = 0
	
	method calcularSueldo(){
		return 150000.max(sueldoActual)
	}
	
	method cobrarSueldo(){
		sueldoActual = self.calcularSueldo()
		fondosDisponibles+= sueldoActual
		self.pagarDeuda()
	}
	
	method sueldo(){
		return 150000.max(sueldoActual)
	}
	
	method actualizarSueldo(nuevoMonto){
		sueldoActual = nuevoMonto
	}
	
	method totalCobrado(){
		
	}
	
	method gastarCuanto(monto) {
		var diferencia = monto - self.totalDinero()
		
  		if (self.totalDinero() >= monto) {
    		fondosDisponibles -= monto;
  		} else {
    		fondosDisponibles = 0;
   			deuda += diferencia
   			diferencia = 0
  	}
}

	method totalDeuda(){
		
		return deuda
	}
	
	method totalDinero(){
		return fondosDisponibles
	}
	
	method pagarDeuda() {
  		if (fondosDisponibles >= deuda) {
    	fondosDisponibles -= deuda;
    	deuda = 0;
  	} else {
    	deuda -= fondosDisponibles
    	fondosDisponibles = 0
  		}
	}

}
// Galván, el empleado de siempre, que cobra un sueldo fijo. El valor arranca en $ 150.000, y después puede cambiar mes a mes.

object baigorria{
	var sueldoActual
	var fondosDisponibles
	var empanadasVendidas= 20
	var montoUnidad =  150
	
	method calcularSueldo(){
		 return  150.max(montoUnidad) * empanadasVendidas		
		}
		
	method cobrarSueldo(){		
		sueldoActual = self.calcularSueldo()
		fondosDisponibles +=  sueldoActual
	}
	
	method sueldo(){
		return sueldoActual
	}
	
	method actualizarMontoUnidad(nuevoMonto){	
		montoUnidad = nuevoMonto
	}
	
	method empanadasVendidas(cantidad){
		empanadasVendidas = cantidad
	}
	
	method totalCobrado(){
		return fondosDisponibles
	}
		
}


//* Baigorria, el joven y explotado empleado de Giménez, que cobra en base a la cantidad de empanadas vendidas (actualmente $ 150 por empanada).

object gimenez{
	/*es el encargado de pagarle el sueldo a los empleados, y de gestionar el dinero que se utiliza para esto. 
	Asumimos que Giménez arranca con un fondo para sueldos de $ 3.000.000. Como los sueldos salen de este fondo, hay que 
	descontar el importe correspondiente cuando Giménez le paga a un empleado.*/
	var fondosDisponibles = 3000000
	
	method fondos(){
		return fondosDisponibles	
	}
	
	method pagarSueldoA(empleado){
		fondosDisponibles -= empleado.calcularSueldo()
		empleado.cobrarSueldo() 
	
	}
	

}





