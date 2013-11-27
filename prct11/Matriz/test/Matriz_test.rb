require "./lib/Matriz.rb"
require "test/unit"

 #clase test  
class Test_Matriz < Test::Unit::TestCase
#Inicia las variables de instancia
    def setup
        # Crear matrices
        # -- Densas 
        @m1 = Matriz_Densa.new(2,2,[1,2,3,4])
        @m2 = Matriz_Densa.new(2,2,[1,2,3,4])

    end
#pruebas unitarias de enteros
    def test_enteros
        #Suma
        @m3 = Matriz_Densa.new(2,2,[2,4,6,8])
        assert_equal(@m3, @m1+@m2)

        #Resta
        @m3 = Matriz_Densa.new(2,2,[0,0,0,0])
        assert_equal(@m3, @m1-@m2)

        #Multiplicación
        @m3 = Matriz_Densa.new(2,2,[2,4,6,8])
        assert_equal(@m3, @m1*@m2)

        #Comparación
	@m3 = Matriz_Densa.new(2,2,[1,2,3,4])
        assert_equal(@m3, @m1)

        #Mínimo
        assert_equal(@m1.min,1)

        #Máximo
        assert_equal(@m1.max,4)

    end

   

end
