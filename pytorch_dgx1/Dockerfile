# This line means that we're building on top of the nvcr.io/nvidia/pytorch:20.03-py3 image.
# That allows us to use an image with PyTorch already set up.
FROM nvcr.io/nvidia/pytorch:20.03-py3

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
          --upgrade

RUN jupyter nbextension enable --py widgetsnbextension

# Disable jedi
RUN ipython profile create
RUN echo 'c.IPCompleter.use_jedi = False' >> /root/.ipython/profile_default/ipython_config.py

# Start Jupyter
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=6079", "--no-browser", "--NotebookApp.password='sha1:07a7bdd44734:c683e1e9158d4e43eae6be11468c40ef99309267'"]
