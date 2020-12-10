//Un programa C para probar el analizador

principal(){
	entero var1 = 2, var2, numero2 = 10;
	real numero;
	bool bit = 0, bit2;
	
	elevarCuadrado(entero numero){
		numero = numero * numero;
	}
	
	procedimiento(entero numero1, entero numero2){
		real nada;
		entero otro;
		numero1 = (numero1 * -numero2) % 5;
	}

	para contador := 0 sube hasta 1 haz 
		var1 = var1 + 2;
		
	si (!(bit == 0)) entonces
		var1 = 2;
	sino{
		var1 = var1 * 2;
		numero ++;
	}
	
	elevarCuadrado();
	
	numero = (var1 + (var1 * 2))/10;
	
	real lectura;
	
	si ((lectural == 2.0)&&(var1 != 4)) entonces
		leer(lectura);
	
	lista de bool lista1 = [lectura];
	lista de real lista2 = [2.3,5.1], lista3 = [1.0];
	lista2 = lista2 ** lista3;
	lista2 = lista2 -- lista3;
	
	$lista2;
	lista2 >>;
}
