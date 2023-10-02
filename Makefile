all:
	cd build && valgrind ./executeTests --gtest_output=xml --coverage -g -O0
	
	gcc --coverage sqrt.cpp
	gcc --coverage sqrt_test.cpp
	gcovr