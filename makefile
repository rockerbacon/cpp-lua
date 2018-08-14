CXX=g++ --std=c++11

SRC_DIR=./src
BUILD_DIR=./build

OBJS_DIR=./objs
OBJS=$(patsubst $(SRC_DIR)/%.cpp, $(OBJS_DIR)/%.o, $(wildcard $(SRC_DIR)/*.cpp))

UNITY_TESTS_DIR=./unity_tests
UNITY_TESTS=$(wildcard $(UNITY_TESTS_DIR)/*.cpp)

CXXFLAGS=-I$(SRC_DIR)

clean:
	rm -f $(BUILD_DIR)/*
	rm -f $(OBJS_DIR)/*

.SECONDARY: $(OBJS)

$(OBJS_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) -c $^ -o $(OBJS_DIR)/$*.o $(CXXFLAGS)

$(UNITY_TESTS_DIR)/%.cpp: $(OBJS)
	$(CXX) $@ $^ -o $(BUILD_DIR)/$* $(CXXFLAGS)

unity_tests: $(UNITY_TESTS)
