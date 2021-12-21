# This line means that we're building on top of the nvcr.io/nvidia/pytorch:20.03-py3 image.
# That allows us to use an image with PyTorch already set up.
FROM nvcr.io/nvidia/pytorch:20.03-py3

COPY requirements.txt .
RUN apt-get update && apt-get install -y libsasl2-modules libsasl2-dev
RUN pip install -r requirements.txt
ENV PYTHONPATH=/workspace/product_listing_classifcation

# Limit the number of threads for tokenizers
ENV RAYON_RS_NUM_CPUS=8
ENV TOKENIZERS_PARALLELISM=true

# Disable jedi
RUN ipython profile create
RUN echo 'c.IPCompleter.use_jedi = False' >> /root/.ipython/profile_default/ipython_config.py

# Start Jupyter
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=16079", "--no-browser", "--NotebookApp.password='sha1:07a7bdd44734:c683e1e9158d4e43eae6be11468c40ef99309267'"]
