all: clean library problem run

library: data list listInt rangeInt setInt matrixInt project_euler

data:
	@gcc -o lib/data.o -c lib/data/data.c -Wall -O3

list:
	@gcc -o lib/list.o -c lib/list/list.c -Wall -O3

listInt:
	@gcc -o lib/listint.o -c lib/list/int/listint.c -Wall -O3

rangeInt:
	@gcc -o lib/rangeint.o -c lib/range/int/rangeint.c -Wall -O3

setInt:
	@gcc -o lib/setint.o -c lib/set/int/setint.c -Wall -O3

matrixInt:
	@gcc -o lib/matrixint.o -c lib/matrix/int/matrixint.c -Wall -O3

project_euler:
	@gcc -o lib/project_euler.o -c lib/project_euler/project_euler.c -lm -Wall -O3

problem:
	@gcc -o problem 1-25/problem_8.c lib/*.o -lm -Wall -O3 

run:
	@./problem

clean:
	@rm lib/*.o
	@rm problem