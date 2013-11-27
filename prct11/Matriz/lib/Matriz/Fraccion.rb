#Clase Fraccion utilizada para las operaciones entre fracciones.
class Fraccion
include Comparable
	#num=numerador den=denominador
	attr_reader :num, :den
#Inicializador de las variables de instancias
	def initialize(num, den)
		@num = num
		@den = den
	end
#Se utiliza el metodo to_s para mostrar las fracciones en el formato a/b.
	def to_s
		if @num % @den == 0
			aux = "#{@num/@den}"
		else
			aux = "#{@num}/#{@den}"
		end
	end
#  Se utiliza este metodo para mostrar las fracciones en formato flotante.
	def mfloat
		"#{@num/@den}"
	end
#  Este metodo es utilizado para calcular el valor absoluto.
	def abs
		n = @num
		d = @den

		if @num < 0
			n = -@num
		end

		if @den < 0
			d = -@den
		end

		Fraccion.new(n, d)
	end
# Se utiliza este metodo para calcular el reciproco de la fraccion.
	def reciprocal
		Fraccion.new(@den, @num)
	end

#El siguiente metodo se usa polimorfismo, para que haga las resta o el opuesto segun los argumentos que se le pasen.
        def -(*args) 
                if args.size == 0  #  Calcula el opuesto.
 		Fraccion.new(-@num, @den)
                else   #  Se restan dos fracciones.
                   return Fraccion.new((@num * args[0].den)-(args[0].num * @den), @den * args[0].den).min
		end
        end
#Este metodo se usa para dar las fracciones en forma reducida.
	def min
	
		aux = gcd(@num, @den)

		@num = @num/aux
		@den = @den/aux

		Fraccion.new(@num,@den)

	end	
#Se utiliza este metodo para calcular el resto dos fracciones con % y dar el resultado de forma reducida
	def %(other)
		a = @num*other.den()
		b = @den*other.num()
		c = Fraccion.new(a, b)
		d = c.num()%c.den()
		return d/1
	end
#Se suman dos fracciones con + y se da el resultado de forma reducida.
        def +(other)
 
        Fraccion.new(((@num * other.den) + (other.num * @den)), (@den * other.den)).min
 
        end
# Se multiplican dos fracciones con * y se da el resultado de forma reducida.
        def *(other)

        Fraccion.new(@num * other.num, @den * other.den).min

        end
#Se dividen dos fracciones con / y se da el resultado de forma reducida.
        def /(other)

        Fraccion.new(@num * other.den, @den * other.num).min

        end
#Permite la utilizacion de Comparable
	def <=>(other)
		(@num/@den)<=>(other.num()/other.den())
	end
#Este metodo nos permite operar con numeros de distinto tipo.
	def coerce(other)
	  if(other.is_a? Fixnum)
	    dev = Fraccion.new(other,1)
	    [self,dev]
	  end
	end
#Calcula el maximo comun divisor
	def gcd(x, y)
		aux = 1
		aux1 = 1
        	while aux <= x and aux <=y
        		if x % aux == 0 and y % aux == 0
        	                        aux1 = aux
        	        end
        	        aux += 1
        	end
  		aux1
	end

end #Fraccion

f1 = Fraccion.new(4.0,5)
f2 = Fraccion.new(6,4)
f3 = Fraccion.new(-7,4)
f4 = Fraccion.new(8,6)

puts "Fraccion 1: #{f1}"
puts "Fraccion 2: #{f2}"
puts "Fraccion 3: #{f3}"
puts "Fraccion 4: #{f4}"

puts "Fraccion 1 en flotante: #{f1.mfloat}"

puts "Valor absoluto de la fraccion 3: #{f3.abs}"

puts "Reciproco de la fraccion 2: #{f2.reciprocal}"

puts "Opuesto de la fraccion 4: #{f4.-}"

puts "Resto de la division entre la fraccion 1 y 2: #{f1.%(f2)}"

f4.min
puts "La expresion minima de la funcion 4 es: #{f4}"

puts "La suma entre la fraccion 2 y la fraccion 4: "
puts f2 +f4

puts "La resta entre la fraccion 2 y la fraccion 4: "
puts f2 - f4

puts "La multiplicacion entre la fraccion 2 y la fraccion 4: "
puts f2 * f4

puts "La division entre la fraccion 2 y la fraccion 4: "
puts f2 / f4
