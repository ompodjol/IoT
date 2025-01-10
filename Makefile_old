# Variables
IMAGE_NAME := my_esp32_devkitc_ve_project
CONTAINER_NAME := esp32_devkitc_ve_container
SOURCE_DIR := ./src
BUILD_DIR := ./build
EXECUTABLE := my_esp32_devkitc_ve_program

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
	docker run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) /bin/bash

# Clean the build artifacts
.PHONY: clean
clean:
	# Remove build directory
	rm -rf $(BUILD_DIR)
	# Stop all running containers
	docker stop $$(docker ps -q) || true
	# Remove all containers
	docker rm $$(docker ps -aq) || true
	# Remove all images
	docker rmi $$(docker images -aq) || true
	# Remove all unused volumes
	docker volume prune -f
	# Remove all unused networks
	docker network prune -f
	# Remove all unused data
	docker system prune -af --volumes


# Stop and remove the Docker container
.PHONY: stop
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
