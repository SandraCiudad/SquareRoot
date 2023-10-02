all:
	#program compilation
	g++ -o testResults sqrt.cpp sqrt_test.cpp -lcppunit --coverage -g -O0

	#memory leaks detection
	valgrind ./testResults

	gcovr 