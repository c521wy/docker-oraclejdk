FROM centos

# 1. install glibc-common to support chiness character
# 2. set timezone to Shanghai
RUN \
yum install glibc-common -y && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


ADD https://pub.caiweiqiang.cn/jdk/jdk-8u221-linux-x64.tar.gz /

RUN tar -xf /jdk-8u221-linux-x64.tar.gz

ENV JAVA_HOME=/jdk1.8.0_221
ENV PATH=$JAVA_HOME/bin:$PATH
