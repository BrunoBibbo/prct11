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
