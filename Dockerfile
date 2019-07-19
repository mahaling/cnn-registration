FROM tensorflow/tensorflow:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends \
    nano \
    libx11-6 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    imagemagick \
    python-matplotlib \
    python-numpy \
    python-tk \
    python-pil \
    build-essential \
    cython \
    python-pyqt5 \
    python-skimage && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root/cnn-registration
COPY . /root/cnn-registration

#RUN pip install --no-cache-dir --upgrade pip setuptools 
RUN pip install -r requirements.txt
RUN pip install jupyter matplotlib scikit-image 

COPY jupyter_notebook_config.py /root/.jupyter/
EXPOSE 9999

