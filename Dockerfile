FROM centos:7

# tar.gz文件名
ARG TAR_GZ_NAME
# tar.gz解压后的文件夹名，用于设置JAVA_HOME
ARG JAVA_HOME_NAME

# 1. install glibc-common to support chiness character
# 2. set timezone to Shanghai
RUN \
yum install glibc-common wget -y && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


RUN \
if [[ "${TAR_GZ_NAME}" = "" ]] || [[ "${JAVA_HOME_NAME}" = "" ]]; then \
    echo -e "\033[31mTAR_GZ_NAME or JAVA_HOME_NAME can not be NULL\033[0m"; \
    exit 1; \
fi; \
wget -q -O /$TAR_GZ_NAME https://pub.caiweiqiang.cn/jdk/$TAR_GZ_NAME && \
tar -xf /$TAR_GZ_NAME && \
rm -rf /$TAR_GZ_NAME

ENV JAVA_HOME=/$JAVA_HOME_NAME
ENV PATH=$JAVA_HOME/bin:$PATH
## 防止中文乱码
ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
