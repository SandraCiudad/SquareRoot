all:
	cd build && valgrind ./executeTests --gtest_output=xml --coverage -g -O0 
	cd build && gcovr 