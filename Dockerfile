FROM continuumio/miniconda3 AS build
COPY environments/production.yaml .
RUN conda env create -f production.yaml
RUN conda install -c conda-forge conda-pack
RUN conda-pack -n prod -o /tmp/env.tar && \
    mkdir /venv && cd /venv && tar xf /tmp/env.tar && \
    rm /tmp/env.tar
RUN /venv/bin/conda-unpack

FROM debian:buster AS runtime
COPY --from=build /venv /venv
COPY src .
SHELL ["/bin/bash", "-c"]
ENTRYPOINT ["tini", "-g", "--"]
RUN source /venv/bin/activate && \
           python -c "import pandas; print('success!')"
