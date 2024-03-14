# # app/Dockerfile

# FROM python:3.8-slim-buster

# WORKDIR /app
# COPY . /app
# ENV PATH="/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin"

# RUN apt-get update && apt-get install -y \
#     build-essential \
#     curl \
#     software-properties-common \
#     git \
#     && rm -rf /var/lib/apt/lists/* \
#     && pip3 install --upgrade pip \
#     && pip3 install bentoml==1.0.25 \
#                    joblib==1.2.0 \
#                    pip-chill==1.0.1 \
#                    torchvision==0.14.1 \
#                    tqdm==4.64.1 \
#                    wincertstore==0.2 \
#                    boto3 \
#                    mypy-boto3-s3 \
#                    streamlit






# EXPOSE 8501

# HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]


FROM python:3.8-slim-buster

EXPOSE 8501

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

 COPY . /app

RUN pip3 install -r requirements.txt
# Use RUN command to print the $PATH environment variable
RUN echo $PATH
# ENTRYPOINT [ "streamlit","run","app.py","--server.port=8501","--server.address=0.0.0.0" ]
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py", "--server.port=8501", "--server.address=0.0.0.0"]