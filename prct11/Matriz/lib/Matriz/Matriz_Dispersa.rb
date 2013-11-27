require "./lib/Matriz/Matriz.rb"
require "./lib/Matriz/Matriz_Densa.rb"

class Matriz_Dispersa < Matrix

  attr_accessor(:alt, :anc, :n_elem, :alto, :ancho, :elem)
  
	def initialize(alto, ancho, alt, anc, array, n_elem)
		@alt = alto-1
		@anc = ancho-1
		@n_elem = n_elem
		@alto = Array.new(@n_elem)
		@ancho = Array.new(@n_elem)
		@elem = Array.new(@n_elem)
		for i in(0..@n_elem-1)
		   @alto[i] = alt[i]
		   @ancho[i] = anc[i]
		   @elem[i] = array[i]
		end
	end
	
	def [](i, j = nil)
		if (j.nil?)
			@M[i]
		else
			@M[i,j]
		end
	end

	def []=(i, value)
		@alto[i]=value
		@ancho[i]=value
		@elem[i]=value
	end

	def ==(other)
		if (@alt == other.alt) && (@anc == other.anc)
			for i in (0..@alt)
				for j in (0..@anc)
					@M[i,j] == other[i,j]
				end
			end
		end
	end

	#PASAR A MATRIZ DENSA
	def to_densa
	  @M = Matriz_Densa.new(@alt+1,@anc+1, 0)
	  for i in (0..@alt)
		  for j in (0..@anc)
		     @M[i][j] = 0
		  end
	  end
	  for i in (0..@n_elem-1)
	    @M[@alto[i]][@ancho[i]]=@elem[i]
	  end
	  @M
	end
	
	#METODO TO_S
	def to_s
	  w=0
	  aux = "["
	  for i in(0..@alt)
	    aux += "["
	    for j in(0..@anc)
		if (w < @n_elem && i==@alto[w])
		    if(j==@ancho[w])
		      if(j==@anc)
			aux += "#{@elem[w]}"
		      else
			aux += "#{@elem[w]},"
		      end
		      w=w+1
		    else
		      if(j==@anc)
			aux += "0"
		      else
			aux += "0,"
		      end
		    end
		else
		  if(j==@anc)
			aux += "0"
		      else
			aux += "0,"
		      end
		end
	      end
	  aux += "]"
	  end
	  aux += "]"
	  aux
	end
	
	#SUMA
	def +(other)
	  if (other.is_a? Matriz_Dispersa)
		if(@alt==other.alt && @anc=other.anc)
			suma=Matriz_Dispersa.new(@alt+1,@anc+1, [],[],[], (@n_elem+other.n_elem))
			m = 0
			for i in (0..suma.n_elem-1)
			  if(other.elem[i].is_a? Fixnum)
			    suma.elem[i]=0
			  end
			  if(other.elem[i].is_a? Fraccion)
			    suma.elem[i]=Fraccion.new(0,1)
			  end
			end
			for i in(0..@alt)
			  for j in (0..@anc)
			    for h in (0..@n_elem-1)
			      if(i==@alto[h])
				for t in (0..@n_elem-1)
				  if(j == @alto[t] && h==t)
				    suma.elem[m]=@elem[t]
				    suma.alto[m]=@alto[t]
				    suma.ancho[m]=@ancho[t]
				    m = m+1
				  end
				end
			      end
			    end
			      for l in (0..other.n_elem-1)
				if(i==other.alto[l])
				  for t in(0..other.n_elem-1)
				    if(j==other.alto[t] && l==t)
				      suma.elem[m]=(suma.elem[m]+other.elem[t])
				      suma.alto[m]=other.alto[t]
				      suma.ancho[m]=other.ancho[t]
				      m = m+1
				    end
				  end
				end
			      end
			  end
			end
			suma
		else
		  puts "no se puede realizar la suma"
		end
	  else
	    if(other.is_a? Matriz_Densa)
	      if(@alt==other.alt && @anc=other.anc)
		other.+(self.to_densa)
	      else
		puts "no se puede realizar la suma"
	      end
	    end
	  end
	end

	#RESTA
	def -(other)
	  if (other.is_a? Matriz_Dispersa)
		if(@alt==other.alt && @anc=other.anc)
			resta=Matriz_Dispersa.new(@alt+1,@anc+1, [],[],[], (@n_elem+other.n_elem))
			m = 0
			for i in (0..resta.n_elem-1)
			  if(other.elem[i].is_a? Fixnum)
			    resta.elem[i]=0
			  end
			  if(other.elem[i].is_a? Fraccion)
			    resta.elem[i]=Fraccion.new(0,1)
			  end
			end
			for i in(0..@alt)
			  for j in (0..@anc)
			    for h in (0..@n_elem-1)
			      if(i==@alto[h])
				for t in (0..@n_elem-1)
				  if(j == @alto[t] && h==t)
				    resta.elem[m]=@elem[t]
				    resta.alto[m]=@alto[t]
				    resta.ancho[m]=@ancho[t]
				    m = m+1
				  end
				end
			      end
			    end
			      for l in (0..other.n_elem-1)
				if(i==other.alto[l])
				  for t in(0..other.n_elem-1)
				    if(j==other.alto[t] && l==t)
				      resta.elem[m]=(resta.elem[m]-other.elem[t])
				      resta.alto[m]=other.alto[t]
				      resta.ancho[m]=other.ancho[t]
				      m = m+1
				    end
				  end
				end
			      end
			  end
			end
			resta
		else
		  puts "no se puede realizar la resta"
		end
	  else
	    if(other.is_a? Matriz_Densa)
	      if(@alt==other.alt && @anc=other.anc)
		self.to_densa.-(other)
	      else
		puts "no se puede realizar la resta"
	      end
	    end
	  end
	end

	#MULTIPLICACION
	def *(other)
	      if(@alt==other.alt && @anc=other.anc)
		if(other.is_a? Matriz_Dispersa)
		  self.to_densa.*(other.to_densa)
		else
		  self.to_densa.*(other)
		end
	      else
		puts "no se puede realizar la multiplicacion"
	      end
	    end
	
	#MAXIMO
	def max
	  w=0
	  for i in(0..@n_elem-1)
	    if(w < @elem[i])
	      w = @elem[i]
	    end
	  end
	  w
	end
	
	#MINIMO
	def min
	  w=0
	  for i in(0..@n_elem-1)
	    if(i == 0)
	      w = @elem[i]
	    end
	    if(w > @elem[i])
	      w = @elem[i]
	    end
	  end
	  w
	end
	
end

q = Matriz_Dispersa.new(2,2,[1],[1],[7],1)
puts q

m = Matriz_Dispersa.new(2,2,[0],[0],[5],1)
puts m

k=Matriz_Densa.new(2,2,[1,2,3,4])
puts k

e = Matriz_Dispersa.new(2,2,[1],[1],[5],1)

puts "Sumas"

puts q+m

puts q+k

puts m+k

puts "Minimos y maximos"
puts q.max
puts q.min
puts m.max
puts m.min
puts k.max
puts k.min

puts "Restas"
puts q-m
puts k-q
puts m-k

puts "Multiplicaciones"
puts q*e
puts q*k
puts k*q
puts q+m

puts "Operaciones con densas con fracciones"
l= Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])
n= Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])
puts l
puts n
puts l+n
puts l-n
puts l*n

u=Matriz_Dispersa.new(2,2,[1],[1],[Fraccion.new(1,2)],1)
puts u
y=Matriz_Dispersa.new(2,2,[0],[0],[Fraccion.new(2,5)],1)
puts y

puts u+y
puts u-y

a= Matriz_Densa.new(2,2,[1,1,1,1])
b= Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])


puts a+b
puts a*b

puts u+k

