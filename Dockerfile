FROM centos

# 1. install glibc-common to support chiness character
# 2. set timezone to Shanghai
RUN \
yum install glibc-common wget -y && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


RUN \
wget -O /jdk-11.0.4_linux-x64_bin.tar.gz https://pub.caiweiqiang.cn/jdk/jdk-11.0.4_linux-x64_bin.tar.gz && \
tar -xf /jdk-11.0.4_linux-x64_bin.tar.gz && \
rm -rf /jdk-11.0.4_linux-x64_bin.tar.gz

ENV JAVA_HOME=/jdk-11.0.4
ENV PATH=$JAVA_HOME/bin:$PATH
