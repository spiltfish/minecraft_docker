from java:8
MAINTAINER Mary Larrousse a.spilt.fish@gmail.com

RUN useradd -ms /bin/bash minecraft

USER minecraft
WORKDIR /home/minecraft

RUN wget https://www.feed-the-beast.com/projects/ftb-infinity-evolved/files/2320899/download
RUN unzip download
RUN rm download

RUN rm eula.txt
RUN touch eula.txt
RUN echo "eula=true" >> eula.txt

RUN /bin/bash FTBInstall.sh

EXPOSE 25565

RUN mkdir /home/minecraft/world
RUN mount /dev/disk/by-id/google-minecraft-dev /home/minecraft/world

CMD ["/bin/bash", "/home/minecraft/ServerStart.sh"]
