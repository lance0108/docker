# Based on a pytorch image where cuda and cudnn are already installed.
# Newer version of this image would not work due to the nividia driver version on DGX1.
FROM nvcr.io/nvidia/pytorch:20.03-py3

# Install some python packages. Pytorch 1.8.1 is required for the cuda v10.2.
# Alternatively, you can provide the packages in requirements.txt and pin their versions.
RUN pip install \
          jupyter \
	  jupyterlab \
          td-client \
          boto \
          sklearn \
          pytd \
	  tqdm \
	  transformers \
	  ipywidgets \
          python-lsp-server \
	  pigeonXT-jupyter \
	  nodejs \
	  torch==1.8.1 \
	  pytorch-lightning \ 
	  fasttext \
	  gensim \
	  python-Levenshtein \
	  pyarrow \ 
          --upgrade

RUN jupyter nbextension enable --py widgetsnbextension

# Install pyhive
RUN apt-get update && apt-get install -y libsasl2-modules libsasl2-dev
RUN pip install sasl==0.3.1 thrift-sasl==0.4.3 PyHive==0.6.4

# Add your own python modules
ENV PYTHONPATH=$PYTHONPATH:/workspace/wip:/workspace/extract_product_attributes:/workspace/product_listing_classification

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
# Each user need to specify their own port. I used my uid on dgx1. You can run `id` on DGX1 to see your uid.
# You also need to replace the password with a hashed value.
CMD ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=6079", "--no-browser", "--NotebookApp.password='sha1:07a7bdd44734:c683e1e9158d4e43eae6be11468c40ef99309267'"]
