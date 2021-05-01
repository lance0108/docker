FROM jupyter/datascience-notebook:latest

RUN pip install pytd

USER root
ENV UNAME=ldeng
ENV UID=6079
ENV GID=500
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME

ENV PYTHONPATH="${PYTHONPATH}:/home/jovyan/wip"
