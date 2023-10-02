all:
	cd build && ./executeTests --gtest_output=xml --coverage -g -O0

	#memory leaks detection
	valgrind ./testBasicMath

	gcovr 