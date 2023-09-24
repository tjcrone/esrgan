# #!/bin/bash

# install system-wide packages
apt-get update
apt-get -yqq install zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev python3-opencv

# .bashrc
RUN echo "alias ll='ls -l'" >> ~/.bashrc
RUN echo "alias lt='ls -lat'" >> ~/.bashrc

# install esrgan
git clone https://github.com/xinntao/Real-ESRGAN.git
cd  Real-ESRGAN/
pip install basicsr --use-pep517
pip install facexlib
pip install gfpgan
pip install -r requirements.txt

wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth" -P weights
wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth" -P weights
wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-general-x4v3.pth" -P weights
wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-general-wdn-x4v3.pth" -P weights
wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.1/ESRGAN_SRx4_DF2KOST_official-ff704c30.pth" -P weights
wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.1/RealESRNet_x4plus.pth" -P weights
wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.3/RealESRGAN_x4plus_netD.pth" -P weights
wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.1/RealESRGAN_x2plus.pth" -P weights
wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.3/RealESRGAN_x2plus_netD.pth" -P weights
wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth" -P weights
wget "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B_netD.pth" -P weights
python setup.py develop
