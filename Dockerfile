FROM julia:latest

RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get install -y maven

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

WORKDIR /app

COPY . /app

CMD ["julia", "helloworld.jl"]