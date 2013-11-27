# Matriz

Este proyecto constará de una clase Matriz abstracta. En la cual definiremos los métodos:

	- []
	- []=
	- def + (Abstracto).
	- def - (Abstracto).
	- def * (Abstracto).
	- def coerce (Nos permite realizar operaciones entre estructuras de datos distintas).

# Matriz Densa

Esta clase hereda la estructura de la superclase Matriz. Su estructura de datos constará de un array de arrays (para poder representar el contenido de las matrices). Esta matriz debe contener, al menos, un 40% de sus elementos no nulos para considerarse densa. En ella deberemos definir los métodos que nos permitirán realizar las distintas operaciones entre matrices. Tales como:

	- []
	- []=
	- ==
	- def + / - / *
	- def to_s
	- def máximo / mínimo

# Matriz Dispersa

Esta clase hereda la estructura de la superclase Matriz. Su estructura de datos constará de un array para la posición de los elementos de una matriz no nulos y otro para almacenar dichos valores. Esta matriz debe contener más de un 60% de sus elementos nulos para considerarse dispersa. En ella deberemos definir los métodos que nos permitirán realizar las distintas operaciones entre matrices. Tales como:

	- []
	- []=
	- ==
	- def + / - / *
	- def to_s
	- def máximo / mínimo
