# Use an official GCC image as the base
FROM gcc:latest

# Use an official base image
#FROM ubuntu:latest

# Install cmocka
RUN apt-get update && \
    apt-get install -y libcmocka-dev

# Install Git
RUN apt-get update && \
    apt-get install -y git &&\
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Clone the public repository
RUN git clone https://github.com/ompodjol/IoT.git

# Set the working directory
WORKDIR /app/IoT

# Build the application
RUN mkdir -p build && \
    gcc -Iinclude src/hello.c src/main.c -o build/my_esp32_devkitc_ve_program

# Compile the test application
#RUN gcc -Iinclude -o build/test_print_hello tests/test_print_hello.c src/hello.c src/main.c -lcmocka



# Set the entry point to run the application
CMD ["bin/bash"]
