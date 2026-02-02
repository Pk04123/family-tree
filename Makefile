CXX=clang++
CXX_FLAGS=-std=c++20 -Iincludes -Wall -Wextra -fsanitize=address -g

exec: bin/exec

bin/exec: ./src/driver.o ./src/family_tree.o
	$(CXX) $(CXX_FLAGS) ./src/driver.o ./src/family_tree.o -o $@

src/driver.o: ./src/driver.cc ./includes/family_tree.hpp
	$(CXX) $(CXX_FLAGS) -c ./src/driver.cc -o $@

src/family_tree.o: ./src/family_tree.cc ./includes/family_tree.hpp
	$(CXX) $(CXX_FLAGS) -c ./src/family_tree.cc -o $@
	
.PHONY: exec