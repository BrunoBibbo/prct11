require "Fraccion.rb"

class Matriz
	
	attr_reader(:alt, :anc)
	
	def initialize(alt, anc)
		@alt = (alt-1)
		@anc = (anc-1)
		@M = Array.new(@alt)
		for i in (0..@alt)
			@M[i]=Array.new(@anc)
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
		if(@alt==@anc)
			suma=Matriz.new(@alt+1,@anc+1)
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
			resta=Matriz.new(@alt+1,@anc+1)
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
	  mul = Matriz.new(@alt+1, @anc+1)
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
end


m=Matriz.new(3,3)
n=Matriz.new(3,3)
for i in (0..m.alt)
	for j in (0..m.anc)
		m[i][j]=1
		n[i][j]=1
	end
end

puts m
puts m+n
puts m-n
puts m*n
