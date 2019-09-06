<h1 align="center"><a href="" target="_blank">iGreat</a></h1>
>
> iGreat是使用Angular开发的个人网址导航系统，具备完整的前后台，您可以拿来部署自己收藏的网址。
> 

<p align="center">
<a href="#"><img alt="JDK" src="https://img.shields.io/badge/JDK-1.8-yellow.svg?style=flat-square"/></a>
<a href="#"><img alt="JDK" src="https://img.shields.io/badge/Angular-8.2.2-blue.svg?style=flat-square"/></a>
<a href="#"><img alt="JDK" src="https://img.shields.io/badge/springboot-2.1.7-green.svg?style=flat-square"/></a>
</p>

------------------------------

## 简介

**iGreat**是临摹[兰客导航](http://lackk.com/nav/)开发的网址导航系统，初始数据是作者从兰客复制或抓取的。**iGreat**是使用`Angular`和`SpringBoot`开发的一整套前后端分离的系统，包含前端网站和管理后台。

## 项目结构

**Resources**：截图及使用到的资源文件；

**WebNav-Admin**：管理平台页面源代码；

**WebNav**：网站页面源代码；

**WebNav-Admin-API**：管理后台API服务源代码；

**WebNav-API**：网站前端API服务源代码；

## 预览

### 在线预览

导航网址：<http://47.96.98.193:8886/>

管理后台：<http://47.96.98.193:8887/welcome>

### 网站导航

![website_screenshot](http://njcwking.oss-cn-hangzhou.aliyuncs.com/markdown/2019-09-06-035440.jpg)

### 管理后台

![管理后台-轮播图管理](http://njcwking.oss-cn-hangzhou.aliyuncs.com/markdown/2019-09-06-035435.jpg)

![管理后台-分类管理](http://njcwking.oss-cn-hangzhou.aliyuncs.com/markdown/2019-09-06-035430.jpg)

![管理后台-搜索管理](http://njcwking.oss-cn-hangzhou.aliyuncs.com/markdown/2019-09-06-035425.jpg)

![管理后台-网址管理](http://njcwking.oss-cn-hangzhou.aliyuncs.com/markdown/2019-09-06-035422.jpg)

## 部署

> 以下的所有操作是建立在服务器环境已经安装完毕，所以部署文件已复制到`/opt`目录下。

### 服务器环境（自行百度配置）

* CentOS 7
* Java SDK 1.8
* Nginx 1.8.1
* MySQL 5.7

### 部署文件清单

| 文件                            | 作用             |
| ------------------------------- | ---------------- |
| WebNav初始数据库.sql            | 数据库           |
| webnav-admin-1.0.0-SNAPSHOT.jar | 管理后台API程序  |
| webnav-1.0.0-SNAPSHOT.jar       | 前端网站API程序  |
| WebNav.zip                      | 网站前端资源     |
| WebNav-Admin.zip                | 管理后台前端资源 |

> 这些文件可以在[Resources](https://github.com/njcwking/LackkNav/tree/master/Resources)目录下找到。

### 导入数据库

#### 连接数据库

```bash
$ mysql -u root -p
```

#### 创建数据库

```mysql
mysql > CREATE DATABASE WebNav IF NOT EXISTS WebNav default charset utf8mb4 COLLATE utf8mb4_general_ci;
```

#### 使用数据库

```mysql
mysql > use WebNav
```

#### 导入数据

```mysql
mysql > source /opt/WebNav初始数据库.sql
```

成功后执行`exit`命令退出`MySQL`命令客户端即可。

### 运行Jar

使用`nohup`命令让程序在后台运行

```bash
//部署网站API，占用8888端口
$ nohup java -jar webnav-1.0.0-SNAPSHOT.jar --server.port=8888 &
//部署管理后台API，占用8889端口
$ nohup java -jar webnav-admin-1.0.0-SNAPSHOT.jar --server.port=8889 &
```

### 部署网站页面

将`WebNav.zip`和`WebNav-Admin.zip`分别解压至`nginx`的html目录下，例如作者服务器的路径是`/usr/local/nginx/html`。

最终目录结构如图所示：

![文件目录](http://njcwking.oss-cn-hangzhou.aliyuncs.com/markdown/2019-09-06-035416.jpg)

### 配置Nginx反向代理

1. 修改`nginx.conf`文件，在http{....}中添加8886和8887两个端口的server代理；

   ```
   server {
     listen  8886;
     server_name localhost;
     location / {
       root /usr/local/nginx/html/WebNav;
       index index.html;
       try_files $uri $uri/ /index.html;
   	}
   	error_page 500 502 503 504 /50x.html;
   	location = /50x.html {
   		root html;
   	}
   }
   server {
     listen  8887;
     server_name localhost;
     location / {
       root /usr/local/nginx/html/WebNav-Admin;
       index index.html;
       try_files $uri $uri/ /index.html;
     }
     error_page 500 502 503 504 /50x.html;
     location = /50x.html {
     	root html;
     }
   }
   ```

2.  重新加载配置文件

   ```bash
   $ /usr/local/nginx/sbin/nginx -s reload
   ```

3. 使用浏览器打开<http://ip:port>就可以访问对应的网页了。

> 配置过程中`try_files $uri $uri/ /index.html;`这条句柄是关键，不然子路由页面刷新后会出现无法加载的问题。具体可参考：<https://www.angular.cn/guide/deployment>

![image-20190906115331196](http://njcwking.oss-cn-hangzhou.aliyuncs.com/markdown/2019-09-06-035339.png)

## 编译

有需要的朋友可以从[GitHub](https://github.com/njcwking/LackkNav)或这里下载源代码到本地修改后重新编译发布。

### 前端页面

由于前端都是通过`Angular`框架完成的，我们可以先参考[Angular搭建环境](https://www.angular.cn/guide/setup-local)一节先把运行环境搭建起来，作者本地的node版本是`10.16.3`。下面我们假设前端页面的文件已经下载并压缩至`Downloads`目录下。

首先先进入到工程目录下，我们这以导航网站为例，管理后台的页面编译相同

```bash
$ cd Downloads/WebNav
```

然后使用`npm`安装项目依赖

```bash
$ npm install
```

> 如果安装速度慢的话可以通过配置`cnpm`代替`cpm`执行`install`命令

等待安装完成后，使用下面命令运行

```bash
$ ng serve --port 0 --open
```

如果命令运行成功后会自动打开浏览器进行预览，我们可以在预览模式下修改源代码保存，浏览器将马上进行更新。

定制完成后可以通过`build`进行编译后发布自己的服务器，命令如下：

```bash
$ ng build
```

 如果编译成功会在工程目录下生成`dist`文件夹，把`dist`文件夹里的内容传到服务器部署即可。

### API服务

下载工程源代码后直接使用[Intellij IDEA](https://www.jetbrains.com/idea/)打开并`Reimport`Maven依赖，然后修改`application-prod.yml`文件中的数据库地址、账号、密码就可以运行起来了。

![image-20190906150910933](http://njcwking.oss-cn-hangzhou.aliyuncs.com/markdown/2019-09-06-070915.png)

上图为打包流程：

1. 选择侧边标签`Maven`;
2. 点击运行`package`命令；
3. 等待编译过程，出现**BUILD SUCCESS**表示编译成功；
4. 工程目录下会出现`webnav-1.0.0-SNAPSHOT.jar`文件，上传服务器使用`java -jar`命令运行。

## 参考和使用

1. [Angular框架](https://www.angular.cn/)：快速开发框架；
2. [Spring及Spring Boot](https://spring.io/)：API服务技术选型；
3. [NG-ZORRO组件库](https://ng.ant.design/docs/introduce/zh)：Ant Design的Angular实现，开发和服务于企业级后台产品；
4. [兰客导航](http://lackk.com/nav/)：作者前端页面是仿照此网站写的；

## Thank You

感谢所有看到这里的你们，希望它对你有帮助

如果觉得不错，欢迎打赏，金额不限

|                            支付宝                            |                             微信                             |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img src="http://njcwking.oss-cn-hangzhou.aliyuncs.com/markdown/2019-09-06-%E6%94%AF%E4%BB%98%E5%AE%9D%E6%94%B6%E6%AC%BE.JPG" width="200"/> | <img src="http://njcwking.oss-cn-hangzhou.aliyuncs.com/markdown/2019-09-06-%E5%BE%AE%E4%BF%A1%E6%94%B6%E6%AC%BE.JPG" width="200"/> |

