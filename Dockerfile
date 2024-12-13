# Use an official GCC image as the base
FROM gcc:latest

# Use an official base image
#FROM ubuntu:latest

# unit tests package needed for CMocka
# libcunit1-dev

# Install Git
RUN apt-get update && \
    apt-get install -y git \
    libcunit1-dev && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Clone the public repository
RUN git clone https://github.com/ompodjol/IoT.git

# Set the working directory
WORKDIR /app/IoT

# Build the application
RUN mkdir -p build && \
    gcc -Iinclude src/hello.c src/main.c -o build/my_esp32_devkitc_ve_program && \
    gcc -Iinclude -o test_print_hello test_print_hello.c hello.c -lcmocka



# Set the entry point to run the application
CMD ["bin/bash"]
