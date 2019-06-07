FROM ubuntu



RUN apt update 
RUN apt install -y python3.6 python3-pip

# Install Java JDK 8
RUN  apt install -y openjdk-8-jdk

# Install Jupyter Notebook
RUN pip3 install jupyter

# Install numpy and pyspark
RUN pip3 install numpy && \
    pip3 install pyspark

# Trying to change pyspark python environment to python3 
# but not working
RUN chmod 777  /usr/bin/python3 &&\
    export PYSPARK_PYTHON=/usr/bin/python3

# Symlink python to python3 since Pyspark run python by default
RUN ln -s /usr/bin/python3 /usr/bin/python

# Open Jupyter notebook after container starts
ENTRYPOINT jupyter notebook --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='' --port=8888 --allow-root --no-browser
