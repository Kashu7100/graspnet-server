FROM nvcr.io/nvidia/pytorch:24.01-py3

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US/Pacific

RUN apt-get update && apt-get install -y \
    libegl1 \
    libgl1 \
    libgomp1 \
    build-essential \
    cmake \
    curl \
    g++ \
    wget \
    bzip2 \
    git \
    vim \
    tmux \
    htop \
    zip \
    unzip \
    ca-certificates \
    libosmesa6-dev \
    libgl1-mesa-glx \
    libglfw3 \
    patchelf \
    libglu1-mesa \
    libxext6 \
    libxtst6 \
    libxrender1 \
    libxi6 \
    libjpeg-dev \
    libpng-dev \
    libopenblas-dev \
    libopencv-dev \
    libyaml-dev \
    libavformat-dev \
    libavcodec-dev \
    libswscale-dev \
    libavutil-dev \
    libavfilter-dev \
    libavdevice-dev \
    libswresample-dev \
    libgtk2.0-dev \
    pkg-config \
    less \
    groff \
    mpich \
    ninja-build

# required for building Open3D
RUN apt install -y xorg-dev libglu1-mesa-dev libc++-dev libc++abi-dev

WORKDIR /apps
# Clone the ccache repository
RUN git clone https://github.com/ccache/ccache.git && \
    cd ccache && \
    git checkout v4.6 -b 4.6 && \
    mkdir build && \
    cd build && \
    cmake -DZSTD_FROM_INTERNET=ON \
          -DHIREDIS_FROM_INTERNET=ON \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=${HOME} \
          .. && \
    make -j$(nproc) && \
    make install -j$(nproc)

WORKDIR /apps
# Add ${HOME}/bin to ${PATH}
RUN echo "export PATH=${HOME}/bin:\$PATH" >> ~/.bashrc

# Source ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

RUN pip install open3d==0.18.0
# COPY third_party/Open3D/build/open3d-0.18.0-cp310-cp310-manylinux_2_31_x86_64.whl /apps/open3d-0.18.0-cp310-cp310-manylinux_2_31_x86_64.whl
# RUN pip install /apps/open3d-0.18.0-cp310-cp310-manylinux_2_31_x86_64.whl

RUN git clone https://github.com/mhamilton723/FeatUp.git && cd FeatUp && pip install -e .
WORKDIR /apps
RUN pip install git+https://github.com/mhamilton723/CLIP.git
RUN pip install \
    'torch' \
    'torchvision' \
    'torchshow' \
    'kornia' \
    'omegaconf' \
    'tqdm' \
    'torchmetrics' \
    'scikit-learn' \
    'numpy' \
    'matplotlib' \
    'ultralytics==8.0.120' \
    'opencv-python==4.8.0.74'
RUN pip install json_numpy draccus uvicorn fastapi
RUN pip install openai

WORKDIR /workspace