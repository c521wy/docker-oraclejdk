FROM centos:7

# 1. install glibc-common to support chiness character
# 2. set timezone to Shanghai
RUN \
yum install glibc-common wget -y && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


RUN \
wget -O /jdk-8u221-linux-x64.tar.gz https://pub.caiweiqiang.cn/jdk/jdk-8u221-linux-x64.tar.gz && \
tar -xf /jdk-8u221-linux-x64.tar.gz && \
rm -rf /jdk-8u221-linux-x64.tar.gz

ENV JAVA_HOME=/jdk1.8.0_221
ENV PATH=$JAVA_HOME/bin:$PATH
## 防止中文乱码
ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
