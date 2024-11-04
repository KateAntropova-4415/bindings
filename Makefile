CXX=g++
CXXFLAGS=-std=c++11 -O3 -march=native -Wall -I$(SRC_DIR) $(shell python3 -m pybind11 --includes)
PY_LDFLAGS=$(shell python3-config --ldflags) -lopenblas -shared -fPIC
GTEST_FLAGS=-lgtest -lgtest_main -pthread
LDFLAGS=-lopenblas
SRC_DIR=sigmoid/src
TESTS_DIR=sigmoid/tests
PYTHON_DIR=sigmoid/python

all: sigmoid test

sigmoid: $(PYTHON_DIR)/bindings.o $(SRC_DIR)/Sigmoid.o
	$(CXX) $^ -o $(PYTHON_DIR)/sigmoid_core`python3-config --extension-suffix` $(PY_LDFLAGS) $(CXXFLAGS)

$(PYTHON_DIR)/bindings.o: $(PYTHON_DIR)/bindings.cpp $(SRC_DIR)/Sigmoid.h
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

$(SRC_DIR)/Sigmoid.o: $(SRC_DIR)/Sigmoid.cpp $(SRC_DIR)/Sigmoid.h
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

test: $(TESTS_DIR)/test_sigmoid.o $(SRC_DIR)/Sigmoid.o
	$(CXX) $^ -o $(TESTS_DIR)/test_sigmoid $(GTEST_FLAGS) $(LDFLAGS)

$(TESTS_DIR)/test_sigmoid.o: $(TESTS_DIR)/test_sigmoid.cpp $(SRC_DIR)/Sigmoid.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

run_tests: test
	./$(TESTS_DIR)/test_sigmoid

clean:
	rm -f $(PYTHON_DIR)/*.o $(SRC_DIR)/*.o $(TESTS_DIR)/*.o $(PYTHON_DIR)/sigmoid_core`python3-config --extension-suffix` $(TESTS_DIR)/test_sigmoid