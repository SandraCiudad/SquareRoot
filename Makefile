all:
	#program compilation
	cd build && g++ -o testResults sqrt.cpp sqrt_test.cpp -lcppunit --coverage -g -O0

	#memory leaks detection
	valgrind ./testResults

	gcovr 