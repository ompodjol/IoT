# Tool definition
CC ?= gcc
CXX ?= g++

# Settings
COMPONENT = average
HDR_DIR = ./include
SRC_DIR = ./src
TEST_DIR = ./tests
BUILD_DIR = ./build
NAME = app.elf

# Search path for header files
CFLAGS += I$(HDR_DIR)/$(COMPONENT)

# List module source files
CSOURCES = $(SRC_DIR)/main.c
CSOURCES = $(wildcard $(SRC_DIR)/$(COMPONENT)/*.c)

# Compile flags
CFLAGS += -Wall

# Linker +=
LDFLAGS +=

# Generate names for output object files (*.o)
COBJECTS = $/(patsubst %.c, %.o, $(CSOURCES))

# Default rule: build application
.PHONY: all
all: $(NAME)

# Build components
$(COBJECTS) : %.o : %c
%.o: %.c
	$(CC) $(CFLAGS) -C $< -o $@

# Buil the target application
.PHONY: $(NAME)
$(NAME): $(COBJECTS)
	$(CC)  $(COBJECTS) -o $(BUILD_DIR)/$(NAME) $(LDFLAGS)

# Remove compiled object files
.PHONY: clean
clean:
	rm -f $(COBJECTS)
