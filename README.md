# Docker for Pyspark and Jupyter Notebook

## Prerequisite

Must have Docker installed. 

Visit <https://docs.docker.com/> to install Docker.

## Clone this Repository

## In command line, make your script executable

``` bash
chmod gu+x build.sh test.sh
```

## Then run this script to build your image

``` bash
./build.sh
```

## Then run the container

``` bash
./test.sh
```

## In browser, go to

<http://localhost:8888>

to access jupyter notebook

## Test Word count

In Jupyter Notebook in browser, go to `root` directory. Create a Text.txt file and write something inside.

## Create a python3 file to test

In `root` directory, create a python3 file with the following code:

``` python3
import sys

from pyspark import SparkContext, SparkConf

# create Spark context with necessary configuration
sc = SparkContext("local","Word Count")

# read data from text file and split each line into words
words = sc.textFile("Text.txt").flatMap(lambda line: line.split(" "))

# count the occurrence of each word
wordCounts = words.map(lambda word: (word, 1)).reduceByKey(lambda a,b:a +b)

wordCounts.collect()
```

Example of 1 result of the Word Count (This may varies with your Text.txt file):

![alt text](Screenshot-Wordcount.png "Result of Wordcount")

- The result is considered to be successful if the program returns a list of words with its frequency of appearance in your Text.txt file.

## Pull image from Docker Hub

- Alternatively, you can pull images from Docker Hub without having to build it again.

- To pull the image:

``` bash
docker pull tranhuuhoang/pyspark:secondimage
```

- Then to run the container from that image:

``` bash
docker run -it -p 8888:8888 tranhuuhoang/pyspark:secondimage bash
```

- Then, you can open <http://localhost:8888> in your browser to enter Jupyter Notebook.

- Then, go to `root` directory and go into Wordcount.py file.

- Run that file in Jupyter Notebook to test

## Notes to self

### Redirect python3 to python

``` bash
ln -s /usr/bin/python3 /usr/bin/python
```

Since pyspark automatically run "python", not "python3"
