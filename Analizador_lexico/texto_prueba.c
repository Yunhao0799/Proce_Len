//Un programa C para probar el analizador

main(){
	entero var1 = 2;
	real numero;
	bool bit = 0, bit2;
	
	elevarCuadrado(entero numero){
		numero = numero * numero;
		return numero;
	}

	para contador := 0 sube hasta 1 haz 
		var1 = var1 + 1;
		
	si bit == 0 entonces
		var1 = 2;
	sino
		var1 = var1 * 2;
		
	var1 = elevarCuadrado(entero var1);
}
