#!/bin/sh
# 收集所有app（包括第三方）的静态文件到settings中配置的静态目录中
# 一般只有第一次需要，或者app静态文件发生变化时需要
python manage.py collectstatic
# 构建镜像
docker build -t registry.cn-hangzhou.aliyuncs.com/myelin2021/piek-client .
# 登陆阿里云的ARC
docker login --username=mdude@aliyun.com registry.cn-hangzhou.aliyuncs.com
# 上传镜像
docker push registry.cn-hangzhou.aliyuncs.com/myelin2021/piek-client:latest