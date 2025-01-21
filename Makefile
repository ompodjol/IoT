# Tool definition
CC ?= gcc
CXX ?= g++

# Settings
SRC_DIR = ./src
TEST_DIR = ./tests
BUILD_DIR = ./build
NAME = app.elf

# Search path for header files
CFLAGS += -I$(SRC_DIR)/average

# List module source files
CSOURCES = $(SRC_DIR)/main.c
CSOURCES += $(wildcard $(SRC_DIR)/average/*.c)

# Compile flags
CFLAGS += -Wall

# Linker +=
LDFLAGS +=

# Generate names for output object files (*.o)
COBJECTS = $(patsubst %.c, %.o, $(CSOURCES))

# Default rule: build application
.PHONY: all
all: $(NAME)

# Rule to create the build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Build components
$(COBJECTS) : %.o : %.c
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Buil the target application
.PHONY: $(NAME)
$(NAME): $(COBJECTS) | $(BUILD_DIR)
	$(CC) $(COBJECTS) -o $(BUILD_DIR)/$(NAME) $(LDFLAGS)
	@echo "Build complete: $(BUILD_DIR)/$(NAME)"

# Remove compiled object files
.PHONY: clean
clean:
	rm -rf $(COBJECTS) $(BUILD_DIR)

# Run tests
.PHONY: test
test:
	make -C $(TEST_DIR)

# Clean tests
.PHONY: test_clean
test_clean:
	make -C $(TEST_DIR) clean

