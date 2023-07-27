FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

LABEL maintainer = "jerome.samuelsclarke@newburyinnovation.co.uk"

WORKDIR /app

# Download Linux support tools
RUN apt-get update && \
    apt-get clean && \
    apt-get install -y \
        curl unzip bzip2 cmake ninja-build python3-pip gcc-arm-none-eabi ruby

ENV GNU_INSTALL_ROOT /usr/bin/
ENV GNU_PREFIX arm-none-eabi

# Install Nordic Tools
RUN pip3 install nrfutil
COPY nrf-command-line-tools-10.23.0_linux-arm64.tar.gz /tmp
RUN cd /tmp && tar -xvzf /tmp/nrf-command-line-tools-10.23.0_linux-arm64.tar.gz 
# && cd /tmp && tar -xvzf /tmp/nRF-Command-Line-Tools_10_23_0.tar \
# && cd /tmp && rm JLink_Linux_V688a_x86_64.deb JLink_Linux_V688a_x86_64.tgz nRF-Command-Line-Tools_10_12_1.tar \
# nRF-Command-Line-Tools_10_12_1_Linux-amd64.deb nRFCommandLineTools10121Linuxamd64.tar.gz README.txt
RUN mv /tmp/nrf-command-line-tools/bin/mergehex /opt/ && mv /tmp/nrf-command-line-tools/bin/nrfjprog /opt/
ENV PATH=$PATH:/opt/mergehex:/opt/nrfjprog

# # Tools for anaylsis
RUN apt-get install -y \
    cppcheck \
    clang clang-tools clang-format
RUN pip3 install cpplint

# # Set up a development tools directory
# WORKDIR /home/dev
# ADD . /home/dev/

# # Install the ARM compiler
# RUN wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 | tar -xj
# ENV PATH $PATH:/home/dev/gcc-arm-none-eabi-10.3-2021.10/bin

