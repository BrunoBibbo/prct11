require "./lib/Matriz.rb"
require "test/unit"
   
class Test_Matriz < Test::Unit::TestCase

class Matriz_Densas < Matriz_Densa
    def zero
        0
    end
end

    def setup
        # Crear matrices
        # -- Densas Enteras
        @m1 = Matriz_Densas.new(2,2,[1,2,3,4])
        @m2 = Matriz_Densas.new(2,2,[1,2,3,4])

        # -- Dispersas Enteras
        @md1 = Matriz_Dispersa.new(2,2,[1],[1],[7],1)
        @md2 = Matriz_Dispersa.new(2,2,[0],[0],[5],1)

    end

    def test_enteros
        #Suma
        @m3 = Matriz_Densas.new(2,2,[2,4,6,8])
        assert_equal(@m3, @m1+@m2)

        @md3 = Matriz_Dispersa.new(2,2,[0,1],[0,1],[5,7],2)
        assert_equal(@md3, @md1+@md2)
        #Resta
        @m3 = Matriz_Densa.new(2,2,[0,0,0,0])
        assert_equal(@m3, @m1-@m2)

        @md3 = Matriz_Dispersa.new(2,2,[0,1],[0,1],[-5,7],2)
        assert_equal(@md3, @md1-@md2)
        #Multiplicación
        @m3 = Matriz_Densas.new(2,2,[2,4,6,8])
        assert_equal(@m3, @m1*@m2)

        @md3 = Matriz_Dispersa.new(2,2,[0,1],[0,1],[5,7],2)
        assert_equal(@md3, @md1*@md2)
        #Comparación
	@m3 = Matriz_Densas.new(2,2,[1,2,3,4])
        assert_equal(@m3, @m1)

        #Mínimo
        assert_equal(@m1.min,1)

        #Máximo
        assert_equal(@m1.max,4)

    end

   

end
