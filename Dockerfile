# Use an official GCC image as the base
FROM gcc:latest

# Use an official base image
#FROM ubuntu:latest

# Install Git
RUN apt-get update && \
    apt-get install -y git \
    bash && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Clone the public repository
RUN git clone https://github.com/ompodjol/IoT.git

# Set the working directory
WORKDIR /app/IoT

# Build the application
#RUN mkdir -p build && \
#    gcc -o build/my_esp32_devkitc_ve_program src/main.c



# Set the entry point to run the application
CMD ["bin/bash"]
