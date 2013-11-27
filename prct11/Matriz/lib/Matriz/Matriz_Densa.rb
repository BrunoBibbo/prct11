require "./lib/Matriz/Matriz.rb"
# Clase Matriz_Densa que hereda de Matrix, permite crear matrices densas.
class Matriz_Densa < Matrix
  #alt=alto  anc= ancho
  attr_reader(:alt, :anc)
	# El initialize asigna los valores a las variables de instancias.
	# Se utiliza una estructura Array de Arrays.
	def initialize(alt, anc, array)
		super(alt, anc)
		@M = Array.new(@alt)
		for i in (0..@alt)
			@M[i]=Array.new(@anc)
		end
		t = 0
		for i in (0..@alt)
		  for j in (0..@anc)
		     @M[i][j] = array[t]
		     t = t+1
		  end
		end
	end
	#Metodos que permite acceder a un elemento de la matriz.
	def [](i, j = nil)
		if (j.nil?)
			@M[i]
		else
			@M[i,j]
		end
	end
	#Metodos que permite asignar un valor en la matriz.
	def []=(i, j, value)
		@M[i][j]=value
	end
	#Metodo de comparacion.
	def ==(other)
		if (@alt == other.alt()) && (@anc == other.anc())
			for i in (0..@alt)
				for j in (0..@anc)
					@M[i,j] == other[i,j]
				end
			end
		end
	end

	#METODO TO_S para convertir a string.
	def to_s
		aux = "["
		for i in(0..@alt)
			aux += "["
			for j in(0..@anc)
				if (j!=@anc)
					aux += "#{@M[i][j]},"
				else
					aux += "#{@M[i][j]}"
				end
			end
			aux += "]"
		end
		aux += "]"
		aux
	end
	
	#SUMA de dos matrices.
	#Como iterador se usa "times" el cual ejecutara el bloque que se le pase el numero de veces que se le indique.
	def +(other)
		if(@alt==other.alt && @anc==other.anc)
			suma=Matriz_Densa.new(@alt+1,@anc+1, [])
			(@alt+1).times do |i|
				(@anc+1).times do |j|
					suma[i,j]=(@M[i][j]+other[i][j])
				end
			end
			suma
		else
			puts"No se puede sumar, ya que la matriz no es cuadrada"
		end
	end

	#RESTA de dos matrices.
	#Como iterador se usa "times" el cual ejecutara el bloque que se le pase el numero de veces que se le indique.
	def -(other)
		if(@alt==@anc)
			resta=Matriz_Densa.new(@alt+1,@anc+1, [])
			(@alt+1).times do |i|
				(@anc+1).times do |j|
					resta[i,j]=@M[i][j]-other[i][j]
				end
			end
			resta
		else
			puts"No se puede restar, ya que la matriz no es cuadrada"
		end
	end

	#MULTIPLICACION de dos matrices.
	#Como iterador se usa "times" el cual ejecutara el bloque que se le pase el numero de veces que se le indique.
	def *(other)
	    mul = Matriz_Densa.new(@alt+1, @anc+1, [])
	    (@alt+1).times do |i|
		  (@anc+1).times do |j|
		      mul[i][j] = 0
		  end
	    end
	    (@alt+1).times do |i|
		  (@anc+1).times do |j|
			  (@anc+1).times do |k|
				  mul[i][j] += ((@M[i][k])*(other[k][j]))
			  end
		  end
	    end
	    mul
	  end
	
	#MAXIMO, calcula el elemento mas grande de la matriz.
	def max
	  w=0
	  for i in(0..@alt)
	    for j in(0..@anc)
	      if(w < @M[i][j])
		w = @M[i][j]
	      end
	    end
	  end
	  w
	end
	
	#MINIMO, calcula el elemento mas pequenyo de la matriz.
	def min
	  w=@M[0][0]
	  for i in(0..@alt)
	    for j in(0..@anc)
	      if(w > @M[i][j])
		w = @M[i][j]
	      end
	    end
	  end
	  w
	end
	
end #Matriz_Densa


