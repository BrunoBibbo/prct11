require "./lib/Matriz/Matriz.rb"

class Matriz_Densa < Matrix
  
  attr_reader(:alt, :anc)
	
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

	def [](i, j = nil)
		if (j.nil?)
			@M[i]
		else
			@M[i,j]
		end
	end

	def []=(i, j, value)
		@M[i][j]=value
	end

	def ==(other)
		if (@alt == other.alt()) && (@anc == other.anc())
			for i in (0..@alt)
				for j in (0..@anc)
					@M[i,j] == other[i,j]
				end
			end
		end
	end

	#METODO TO_S
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
	
	#SUMA
	def +(other)
		if(@alt==other.alt && @anc==other.anc)
			suma=Matriz_Densa.new(@alt+1,@anc+1, [])
			for i in (0..@alt)
				for j in (0..@anc)
					suma[i,j]=(@M[i][j]+other[i][j])
				end
			end
			suma
		else
			puts"No se puede sumar, ya que la matriz no es cuadrada"
		end
	end

	#RESTA
	def -(other)
		if(@alt==@anc)
			resta=Matriz_Densa.new(@alt+1,@anc+1, [])
			for i in (0..@alt)
				for j in (0..@anc)
					resta[i,j]=@M[i][j]-other[i][j]
				end
			end
			resta
		else
			puts"No se puede restar, ya que la matriz no es cuadrada"
		end
	end

	#MULTIPLICACION
	def *(other)
	    mul = Matriz_Densa.new(@alt+1, @anc+1, [])
	    for i in (0..@alt)
		  for j in (0..@anc)
		      mul[i][j] = 0
		  end
	    end
	    for i in (0..@alt)
		  for j in (0..@anc)
			  for k in (0..@anc)
				  mul[i][j] += ((@M[i][k])*(other[k][j]))
			  end
		  end
	    end
	    mul
	  end
	
	#MAXIMO
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
	
	#MINIMO
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
	
end

l = Matriz_Densa.new(2,2,[1,2,3,4])
puts l

r = Matriz_Densa.new(2,2,[1,2,3,4])
puts r

puts l*r

puts l+r

puts l-r
