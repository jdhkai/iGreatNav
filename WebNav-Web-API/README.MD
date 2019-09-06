## 一、代码层结构
根目录：`com.igreat.webnav`

1.启动类（WebnavApplication.java）推荐放在根目录com.igreat.webnav包下

2.实体类（domain）

    A: com.igreat.webnav.domain（jpa项目）

    B: com.igreat.webnav.pojo（mybatis项目）

3.数据接口访问层(Dao)

    A: com.igreat.webnav.repository（jpa项目）

    B: com.igreat.webnav.mapper（mybatis项目）

4.数据服务接口层（Service）推荐：com.igreat.webnav.service

5.数据服务实现层（Service Implements）推荐：com.igreat.webnav.service.impl

```
——使用idea的同学推荐使用com.igreat.webnav.serviceImpl目录
```

6.前端控制器层（Controller）推荐：com.igreat.webnav.controller

7.工具类库（utils）推荐：com.igreat.webnav.utils

8.配置类（config）推荐：com.igreat.webnav.config

9.数据传输对象（dto）推荐：com.igreat.webnav.dto

```
——数据传输对象（Data Transfer Object）用于封装多个实体类（domain）之间的关系，不破坏原有的实体类结构
```

10.视图包装对象（vo）推荐：com.igreat.webnav.vo

```
——视图包装对象（View Object）用于封装客户端请求的数据，防止部分数据泄露（如：管理员ID），保证数据安全，不破坏   原有的实体类结构
```

## 二、资源目录结构

根目录：`resources`

1.项目配置文件：resources/application.yml

2.静态资源目录：resources/static/

    ——用于存放html、css、js、图片等资源

3.视图模板目录：resources/templates/

    ——用于存放jsp、thymeleaf等模板文件

4.mybatis映射文件：resources/mapper/（mybatis项目）

5.mybatis配置文件：resources/mapper/config/（mybatis项目）