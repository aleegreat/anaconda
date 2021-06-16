FROM ubuntu:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 DEBIAN_FRONTEND=noninteractive

RUN useradd -m -s /bin/bash abc \
    && apt update --fix-missing \
    && apt install -yqq bzip2 ca-certificates apt-utils curl wget git net-tools ca-certificates \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt update \
    && apt install -yqq nodejs \
    && su - abc -c " \
    wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh -O ~/Anaconda_install.sh \
    && bash ~/Anaconda_install.sh -b -p /home/abc/Anaconda3 \
    && /home/abc/Anaconda3/bin/conda init \
    && source ~/.bashrc \
    && /home/abc/Anaconda3/bin/conda config --set auto_activate_base true \
    && rm -rf ~/Anaconda_install.sh \
    && wget https://linux.kite.com/linux/current/kite-installer -O ~/kite-installer \
    && chmod 777 ~/kite-installer && ~/kite-installer install \
    && /home/abc/Anaconda3/bin/pip install --upgrade jupyter-kite jupyterlab-git\
    && /home/abc/Anaconda3/bin/jupyter-labextension install @kiteco/jupyterlab-kite  @jupyterlab/debugger  jupyterlab-spreadsheet @jupyterlab/git @jupyterlab/toc \
    " \
    && apt autoremove && apt clean && apt autoclean 

#WORKDIR /home/abc

#COPY start.sh /home/abc/start.sh
#RUN chmod 777 /home/abc/start.sh

VOLUME ["/config","/workspace"]
EXPOSE 8888

CMD [ "/bin/bash" ]

#ENTRYPOINT [ "/home/abc/start.sh" ]