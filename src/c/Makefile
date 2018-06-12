all: clean library problem run

library: data list listInt project_euler

data:
	@gcc -o lib/data.o -c lib/data/data.c -Wall -O3

list:
	@gcc -o lib/list.o -c lib/list/list.c -Wall -O3

listInt:
	@gcc -o lib/listint.o -c lib/list/int/listint.c -Wall -O3

project_euler:
	@gcc -o lib/project_euler.o -c lib/project_euler/project_euler.c -Wall -O3

problem:
	@gcc -o problem 1-25/problem_1.c lib/*.o -Wall -O3

run:
	@./problem

clean:
	@rm lib/*.o
	@rm problem