# Use an official GCC image as the base
FROM gcc:latest

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY $(SOURCE_DIR) .

# Build the application
RUN mkdir -p $(BUILD_DIR) && \
    g++ -o $(BUILD_DIR)/$(EXECUTABLE) main.cpp

# Set the entry point to run the application
CMD ["./$(BUILD_DIR)/$(EXECUTABLE)"]
