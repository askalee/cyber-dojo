FROM       cyberdojo/build-essential
MAINTAINER Jon Jagger <jon@jaggersoft.com>


RUN apt-get install wget
RUN mkdir distribution
WORKDIR distribution
RUN wget http://www.cl.cam.ac.uk/users/mr/BCPL/bcpl.tgz
RUN tar xvf bcpl.tgz
WORKDIR BCPL/cintcode
RUN . os/linux/setbcplenv
RUN make clean
RUN make -f MakefileRaspi sys
