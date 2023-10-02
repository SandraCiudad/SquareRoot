all:
	cd build && valgrind ./executeTests --gtest_output=xml --coverage -g -O0

	#program compilation
	g++ -o testResults sqrt.cpp sqrt_test.cpp -lcppunit --coverage -g -O0 -I/usr/include/ -L/usr/lib/ -lgtest -lgtest_main  -pthread

	#memory leaks detection
	valgrind ./testBasicMath

	gcovr --html


