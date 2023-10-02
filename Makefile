all:
	cd build && valgrind ./executeTests --gtest_output=xml

	#program compilation
	cd .. && g++ -o testResults sqrt.cpp sqrt_test.cpp -lcppunit --coverage -g -O0 -I/usr/include/ -L/usr/lib/ -lgtest -lgtest_main  -pthread

	gcovr --html


