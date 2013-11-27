require "./lib/Matriz/Fraccion.rb"
#Esta es la clase madre Matriz de la cual se heredara para crear las clases Matriz_Dispersa y Matriz_Densa. 
class Matrix
	#alt=alto anc=ancho
	attr_reader(:alt, :anc)
#Initialize de la clase Matrix	
	def initialize(alt, anc)
		@alt = (alt-1)
		@anc = (anc-1)

	end
#Metodo que permite las operaciones entre numeros de distinto tipo	
	def coerce(other)
	  [self,other]
	end
end # Matrix
