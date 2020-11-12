//Un programa C para probar el analizador

principal(){
	entero var1 = 2;
	real numero;
	bool bit = 0, bit2;
	
	elevarCuadrado(entero numero){
		numero = numero ** 2;
	}
	
	procedimiento(entero numero1, entero numero2){
		numero1 = (numero1 * -numero2) % 5;
	}

	para contador := 0 sube hasta 1 haz 
		var1 = var1 + 1;
		
	si bit == 0 entonces
		var1 = 2;
	sino{
		var1 = var1 * 2;
		numero ++;
	}
		
		
	var1 = elevarCuadrado(entero var1);
	
	real lectura;
	leer(lectura);
	
	lista de bool lista1 = [lectura];
	lista de real lista2 = [2.3,5.1];
	
}
