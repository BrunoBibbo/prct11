
require "./gcd.rb"
include Comparable

class Fraccion
#Se debe invocar al metodo num() para obtener el numerador
# Se debe invocar al metodo denom() para obtener el denominador
	attr_reader :num, :den
#  Debe existir un numerador
#  Debe existir un denominador
	def initialize(num, den)
		@num = num
		@den = den
	end
#Se debe mostar por la consola la fraccion de la forma: a/b, donde a es el numerador y b el denominador
	def to_s
		if @num % @den == 0
			aux = "#{@num/@den}"
		else
			aux = "#{@num}/#{@den}"
		end
	end
#  Se debe mostar por la consola la fraccion en formato flotante
	def mfloat
		"#{@num/@den}"
	end
#  Se debe calcular el valor absoluto de una fraccion con el metodo abs
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
# Se debe calcular el reciproco de una fraccion con el metodo reciprocal
	def reciprocal
		Fraccion.new(@den, @num)
	end


        def -(*args) 
                if args.size == 0  #  Se debe calcular el opuesto de una fraccion con -
 		Fraccion.new(-@num, @den)
                else   #  Se debe restar dos fracciones con - y dar el resultado de forma reducida
                   return Fraccion.new((@num * args[0].den)-(args[0].num * @den), @den * args[0].den).min
		end
        end
#Debe de estar en su forma reducida
	def min
	
		aux = gcd(@num, @den)

		@num = @num/aux
		@den = @den/aux

		Fraccion.new(@num,@den)

	end	
#Se debe calcular el resto dos fracciones con % y dar el resultado de forma reducida
	def %(other)
		a = @num*other.den()
		b = @den*other.num()
		c = Fraccion.new(a, b)
		d = c.num()%c.den()
		return d/1
	end
#Se debe sumar dos fracciones con + y dar el resultado de forma reducida
        def +(other)
 
        Fraccion.new(((@num * other.den) + (other.num * @den)), (@den * other.den)).min
 
        end
# Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida
        def *(other)

        Fraccion.new(@num * other.num, @den * other.den).min

        end
#Se debe dividir dos fracciones con / y dar el resultado de forma reducida
        def /(other)

        Fraccion.new(@num * other.den, @den * other.num).min

        end

	def <=>(other)
		(@num/@den)<=>(other.num()/other.den())
	end
	
	def coerce(other)
	  if(other.is_a? Fixnum)
	    dev = Fraccion.new(other,1)
	    [self,dev]
	  end
	end

end

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
