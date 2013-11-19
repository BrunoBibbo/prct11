require "./Fraccion.rb"

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

	end

	def -(other)

	end

	def *(other)

	end
end
