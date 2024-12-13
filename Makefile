# Variables
IMAGE_NAME := my_ESP32_DEVKITC_VE_project
CONTAINER_NAME := ESP32_DEVKITC_VE_container
SOURCE_DIR := ./src
BUILD_DIR := ./build
EXECUTABLE := my_ESP32_DEVKITC_VE_program

# Default target
.PHONY: all
all: build

# Build the Docker image
.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

# Run the application inside the Docker container
.PHONY: run
run: build
	docker run --name $(CONTAINER_NAME) --rm $(IMAGE_NAME)

# Clean the build artifacts
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

# Stop and remove the Docker container
.PHONY: stop
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
