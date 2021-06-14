FROM ubuntu:latest

ENV LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8
RUN apt update --fix-missing && apt install -yqq wget nodejs git ca-certificates \
    && wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh -O ~/Anaconda_install.sh \
    && bash ~/Anaconda_install.sh -b -p $HOME/Anaconda3 \
    && eval "$($HOME/Anaconda3/bin/conda shell.bash hook)" \
    && conda init && conda config --set auto_activate_base true \
    && apt clean && rm -rf ~/Anaconda_install.sh 
VOLUME ["/config","/workspace"]
EXPOSE 8888
CMD ["/bin/bash"]
