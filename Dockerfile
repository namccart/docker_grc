FROM 52.73.25.76/pybombs-dev

RUN tar xvfj /target.tar.bz2 && \
    cd /bin && rm sh && ln -s bash sh

RUN apt-get install -y libcanberra-gtk-module && \
    export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    mkdir /home/developer/.local && \
    mkdir /home/developer/.local/share && \
    mkdir /home/developer/.grc_gnuradio && \
    mkdir /home/developer/grc_files && \
    mkdir /home/developer/.gnuradio && \
    mkdir /home/developer/.gnuradio/prefs && \
    chown ${uid}:${gid} -R /home/developer && \
    chown ${uid}:${gid} -R /gnuradio-prefix




USER developer
ENV HOME /home/developer
WORKDIR /home/developer/grc_files

CMD ["/bin/sh", "-c", "source /gnuradio-prefix/setup_env.sh ; gnuradio-companion"]

VOLUME ["/home/developer"]
