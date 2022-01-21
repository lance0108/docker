# This line means that we're building on top of the nvcr.io/nvidia/pytorch:20.03-py3 image.
# That allows us to use an image with PyTorch already set up.
FROM nvcr.io/nvidia/pytorch:20.03-py3

RUN apt-get update && apt-get install -y libsasl2-modules libsasl2-dev 
 
COPY requirements.txt .
RUN pip install -r requirements.txt

# Airflow
ENV TZ=UTC
ENV AIRFLOW_HOME=/workspace/extract_product_attributes/airflow
RUN pip install apache-airflow sqlalchemy==1.3.23 
RUN airflow db init

RUN echo exit 0 > /usr/sbin/policy-rc.d

ENV RAYON_RS_NUM_CPUS=8
ENV TOKENIZERS_PARALLELISM=true

ENV PYTHONPATH=$PYTHONPATH:/workspace/wip:/workspace/extract_product_attributes:/workspace/product_listing_classification
# Start webserver
USER root
#RUN airflow scheduler &
CMD ["airflow", "webserver", "-p 56079"]
