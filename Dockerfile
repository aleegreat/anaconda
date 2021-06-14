FROM ubuntu:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 DEBIAN_FRONTEND=noninteractive


RUN useradd -m -s /bin/bash -p abc abc && apt update --fix-missing \
    && apt install -yqq bzip2 ca-certificates apt-utils wget nodejs git ca-certificates \
    && su - abc -c " \
    wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh -O ~/Anaconda_install.sh \
    && bash ~/Anaconda_install.sh -b -p /home/abc/Anaconda3 \
    && /home/abc/Anaconda3/bin/conda init \
    && source ~/.bashrc \
    && /home/abc/Anaconda3/bin/conda config --set auto_activate_base true \
    && rm -rf ~/Anaconda_install.sh \
    && wget https://linux.kite.com/linux/current/kite-installer -O ~/kite-installer \
    && chmod 777 ~/kite-installer && ~/kite-installer install \
    && rm -rf ~/Anaconda_install.sh \
    " \
    && apt clean

VOLUME ["/config","/workspace"]
EXPOSE 8888
CMD ["nohup /home/abc/.local/share/kite/kited &;/bin/bash"]
