require "./Matriz.rb"

class Matriz_Densa < Matriz
  
  attr_reader(:alt, :anc)
	
	def initialize(alt, anc, array)
		super(alt, anc)
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
	
	def +(other)
		if(@alt==other.alt && @anc==other.anc)
			suma=Matriz_Densa.new(@alt+1,@anc+1, 0)
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

	def -(other)
		if(@alt==@anc)
			resta=Matriz_Densa.new(@alt+1,@anc+1, 0)
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

	def *(other)
	  mul = Matriz_Densa.new(@alt+1, @anc+1, 0)
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