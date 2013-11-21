require "./lib/Matriz.rb"
require "test/unit"

class Fixnum
        def self.null
                       0
        end
end
        
class String
        def self.null
                       ""
        end
end
        
class Float
        def self.null
                       0.0
        end
end        
        

class Test_Matriz < Test::Unit::TestCase

      
 	def test_simple_suma
                @m1 = Matriz_Densa.new(2,2,[1,2,3,4])
                @m2 = Matriz_Densa.new(2,2,[1,2,3,4])
                @m3 = Matriz_Densa.new(2,2,[2,4,6,8])
        
                assert_equal(@m3.to_s,(@m1+@m2).to_s)
        end
        
        def test_simple_resta
                @md1 = Matriz_Dispersa.new(2,2,[1],[1],[7],1)
                @md2 = Matriz_Dispersa.new(2,2,[0],[0],[5],1)
                @md3  = Matriz_Dispersa.new(2,2,[0,1],[0,1],[5,7],2)

                assert_equal(@md3.to_s,(@md1-@md2).to_s)


        end
        
        def test_typecheck
                @m1 = Matriz_Densa.new(2,2,[1,2,3,4])
                @m2 = Matriz_Densa.new(2,2,[1,2,3,"p"])

                assert_raise(TypeError) {@m1+@m2}
        end
        
        def test_failure
                @m1 = Matriz_Densa.new(2,2,[1,2,3,4])
                @m2 = Matriz_Densa.new(2,2,[1,2,3,4])

                assert_raise(ArgumentError) {@m1*@m2}
        end
        
end
