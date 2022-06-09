# BladeX

## 文档地址

    http://bladex.itsmycar.cn/

## idea插件

    lombok
    mybatisX
    Spring Initializr and Assistant

## 环境准备

    redis 3.0.504
    nacos 2.0.3
    mysql 8.0.27
    sentinel 1.8.3

## 导入数据

    数据库
        创建数据库blade，字符集utf8mb4,排序规则utf8mb4_general_ci
        导入数据库doc/sql/blade/blade-saber-mysql.sql
    nacos
        导入配置doc/nacos

## 运行后端

    *注意：gateway是最后开启*

    1. blade-auth/src/main/java/org/springblade/auth/AuthApplication.java
    2. blade-service/blade-desk/src/main/java/org/springblade/desk/DeskApplication.java
    3. blade-ops/blade-develop/src/main/java/org/springblade/develop/DevelopApplication.java
    4. blade-service/blade-log/src/main/java/org/springblade/core/log/LogApplication.java
    5. blade-ops/blade-resource/src/main/java/org/springblade/resource/ResourceApplication.java
    6. blade-service/blade-system/src/main/java/org/springblade/system/SystemApplication.java
    7. blade-service/blade-user/src/main/java/org/springblade/system/user/UserApplication.java
    8. blade-ops/blade-swagger/src/main/java/org/springblade/swagger/SwaggerApplication.java
    9. blade-gateway/src/main/java/org/springblade/gateway/GateWayApplication.java

## 验证后端

    http://localhost:18000/doc.html

    登录接口
    ```
    Authorization = Basic c2FiZXI6c2FiZXJfc2VjcmV0
        Authorization的值是blade_client表的client_id、client_secret字段组合后转换成的Base64编码
            saber	saber_secret    -> saber:saber_secret -> c2FiZXI6c2FiZXJfc2VjcmV0
    获取认证token
        http://localhost:18000/doc.html#/%E6%8E%88%E6%9D%83%E6%A8%A1%E5%9D%97/%E6%8E%88%E6%9D%83%E6%8E%A5%E5%8F%A3/tokenUsingPOST
    活跃用户
        http://localhost:18000/doc.html#/%E5%B7%A5%E4%BD%9C%E5%8F%B0%E6%A8%A1%E5%9D%97/%E9%A6%96%E9%A1%B5/activitiesUsingGET

        将token_type与access_token两个值拼接，中间以空格隔开，配置到全局参数设置内（注意不同子系统切换后，都需要到全局参数设置内配置一下）
            Blade-Auth = bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ0ZW5hbnRfaWQiOiIwMDAwMDAiLCJyb2xlX25hbWUiOiJhZG1pbmlzdHJhdG9yIiwidXNlcl9pZCI6IjExMjM1OTg4MjE3Mzg2NzUyMDEiLCJyb2xlX2lkIjoiMTEyMzU5ODgxNjczODY3NTIwMSIsInVzZXJfbmFtZSI6ImFkbWluIiwib2F1dGhfaWQiOiIiLCJ0b2tlbl90eXBlIjoiYWNjZXNzX3Rva2VuIiwiZGVwdF9pZCI6IjExMjM1OTg4MTM3Mzg2NzUyMDEiLCJhY2NvdW50IjoiYWRtaW4iLCJjbGllbnRfaWQiOiJzYWJlciIsImV4cCI6MTY0ODM3NTU5MiwibmJmIjoxNjQ4MzcxOTkyfQ.let9eKHhgwbsoCYwR_QkvmVJ2ng96Ej8kU_V2fJC5WzpvIi1LXFb0FiHz25XF_Lyj1F0WQUB-UOLEImccjS_EQ

    ```
    验证Sentinel
        注意本地开发模式下，地址为默认为127.0.0.1:8858，注意端口。

## 运行前端

    安装注意事项
    
    node-sass安装失败的解决方案(https://www.jianshu.com/p/92afe92db99f)
    配置.npmrc
    ```
    ...
    sass_binary_site=https://npm.taobao.org/mirrors/node-sass/
    ```
    执行命令
    ```
        npm install -g node-gyp
        npm install --global --production windows-build-tools
        npm uninstall node-sass
        npm install node-sass
    ```
