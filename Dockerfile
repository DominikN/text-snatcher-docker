FROM ubuntu:22.04

# # Set maintainer label
# LABEL maintainer="your-email@example.com"

ARG DEBIAN_FRONTEND=noninteractive

# Add elementary OS repository to install granite
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:elementary-os/daily && \
    apt-get update

# Install build-time dependencies
RUN apt-get install -y git meson ninja-build valac \
                       libgranite-dev libhandy-1-dev \
                       libgtk-3-dev libgdk-pixbuf2.0-dev \
                       libglib2.0-dev desktop-file-utils

RUN apt-get install -y libportal-dev

# Install runtime dependencies
RUN apt-get install -y scrot tesseract-ocr tesseract-ocr-eng

# Clone the TextSnatcher repository
RUN git clone https://github.com/RajSolai/TextSnatcher.git TextSnatcher

# Set the working directory to the cloned repository
WORKDIR /TextSnatcher

# Run meson build
RUN meson build --prefix=/usr

# Change to the build directory, build and test
WORKDIR /TextSnatcher/build
RUN ninja install

RUN apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module


# # Command to run the application
# CMD ["com.github.rajsolai.textsnatcher"]


COPY start.sh /start.sh
CMD ["/start.sh"]