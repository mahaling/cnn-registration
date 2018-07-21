# cnn-registration
A image registration method using convolutional neural network features written in Python2, Tensorflow API r1.5.0.

![process](https://github.com/yzhq97/cnn-registration/raw/publish/img/process_comp.jpg)

# Introduction
Registration of multi-temporal remote sensing images has been widely applied in military and
civilian fields, such as ground target identification, urban development assessment and geographic change
assessment. Ground surface change challenges feature point detection in amount and quality, which is
a common dilemma faced by feature based registration algorithms. Under severe appearance variation,
detected feature points may contain a large proportion of outliers, whereas inliers may be inadequate
and unevenly distributed. This work presents a convolutional neural network (CNN) feature based multitemporal
remote sensing image registration method with two key contributions: (i) we use a CNN to generate
robust multi-scale feature descriptors; (ii) we design a gradually increasing selection of inliers to improve the
robustness of feature points registration. Extensive experiments on feature matching and image registration
are performed over a multi-temporal satellite image dataset and a multi-temporal unmanned aerial vehicle
(UAV) image dataset. Our method outperforms four state-of-the-art methods in most scenarios.


The paper "Multi-temporal Remote Sensing Image Registration Using Deep Convolutional Features" has been accepted by IEEE Access and is awaiting publication. The preprint is available at https://ieeexplore.ieee.org/document/8404075/.


# Requirements

* numpy
* scipy
* opencv-python
* matplotlib
* tensorflow (with or without gpu)
* lap

To install all the requirements run
```
pip install -r requirements.txt
```

This code also needs pretrained VGG16 parameters file `vgg16partial.npy`, please download it from `https://drive.google.com/file/d/1o1xjU9F58x83iR91LoFjLOlBdLN3bPnm/view?usp=sharing`
and put it under the `src/` directory.

# Usage
see src/demo.py
```python
import Registration
from utils.utils import *
import cv2

# load images
IX = cv2.imread(IX_path)
IY = cv2.imread(IY_path)

#initialize
reg = Registration.CNN()

#register
X, Y, Z = reg.register(IX, IY)

#generate regsitered image using TPS
registered = tps_warp(Y, Z, IY, IX.shape)
```
