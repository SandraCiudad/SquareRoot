all:
	cd build && ./executeTests -lcppunit --coverage -g -O0
	
	#memory leaks detection
	valgrind ./testBasicMath

	gcovr 