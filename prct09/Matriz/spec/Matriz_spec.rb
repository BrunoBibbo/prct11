require "./lib/Matriz.rb"


 
   describe "Operaciones con enteros" do
    before :all do
      # Crear matrices
      @m1 = Matriz_Densa.new(2, 2,[1,2,7,3])
      @m2 = Matriz_Densa.new(2, 2,[3,4,1,2])

    end

    # @m3 es la matriz resultado
  
    it "Deben poder sumarse 2 matrices" do
      @m3 = Matriz_Densa.new(2, 2,[4,6,8,5])

      (@m1+@m2).should eq(@m3)
    end

    it "Deben poder restarse 2 matrices" do
      @m3 = Matriz_Densa.new(2, 2,[-2,-2,6,1])

      (@m1-@m2).should eq(@m3)
    end

    it "Deben poder multiplicarse 2 matrices" do
      @m3 = Matriz_Densa.new(2, 2,[5,8,24,34])

      (@m1*@m2).should eq(@m3)
    end

    it "Deben poder compararse 2 matrices" do
      @m3 = Matriz_Densa.new(2, 2,[1,2,7,3])

      @m1.should eq(@m3)
    end
  end

  describe "Operaciones con fracciones" do
    before :all do
      # Crear matrices
      @m1 = Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])
      @m2 = Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])

    end

    # @m3 es la matriz resultado

    it "Deben poder sumarse 2 matrices" do
      @m3 = Matriz_Densa.new(2,2,[Fraccion.new(1,1),Fraccion.new(4,3),Fraccion.new(3,2),Fraccion.new(8,5)])

      (@m1+@m2).should eq(@m3)
    end

    it "Deben poder restarse 2 matrices" do
      @m3 = Matriz_Densa.new(2,2,[Fraccion.new(0,1),Fraccion.new(0,1),Fraccion.new(0,1),Fraccion.new(0,1)])

      (@m1-@m2).should eq(@m3)
    end

    it "Deben poder multiplicarse 2 matrices" do
      @m3 = Matriz_Densa.new(2,2,[Fraccion.new(3,4),Fraccion.new(13,15),Fraccion.new(39,40),Fraccion.new(57,50)])

      (@m1*@m2).should eq(@m3)
    end

    it "Deben poder compararse 2 matrices" do
      @m3 = Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])

      @m1.should eq(@m3)
    end
  end

  describe"Operaciones entre dispersa y densa" do
	before :all do
	#Crear matrices
        @m1 = Matriz_Densa.new(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])
        @m2 = Matriz_Densa.new(2, 2,[1,2,3,4]) 
	@md1 = Matriz_Dispersa.new(2,2,[1],[1],[7],1)
        @md2 = Matriz_Dispersa.new(2,2,[1],[1],[Fraccion.new(1,2)],1)
	end
	
	#@m3 es la matriz resultado

	it "Deben poder sumarse 2 matrices dispersas y densas" do
	@m3 = Matriz_Densa.new(2,2,[1,2,3,11])

	(@md1+@m2).should eq(@m3)
	end

	it "Deben poder restarse matrices dispersas y densas" do
	@m3 = Matriz_Densa.new(2,2,[1,2,3,-3])

	(@md1-@m2).should eq(@m3)
	end

	it "Deben poder multiplicarse matrices dispersas y densas" do
	@m3 = Matriz_Densa.new(2,2,[0,14,0,28])

	(@md1+@m2).should eq(@m3)
	end


  end




