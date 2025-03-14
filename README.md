# WorldFriend - 微信朋友圈模拟

## 项目简介

WorldFriend 是一个基于 Django 框架开发的社交平台，模拟了微信朋友圈的基本功能。用户可以在平台上发布动态，进行点赞和评论，体验类似微信朋友圈的社交互动。该项目为学习和实践 Django 框架的开发者提供了一个很好的示例。

## 功能特点

- **用户注册与登录**：支持用户注册和登录。
- **发布动态**：用户可以发表带文字、图片的朋友圈动态。
- **互动功能**：用户可以对其他用户发布的动态进行点赞、评论。
- **动态时间排序**：朋友圈动态按发布时间排序，展示最新的动态。
- **用户个人主页**：用户可以查看和编辑自己的个人信息。

## 技术栈

- **Backend**: Django
- **Frontend**: HTML, CSS, JavaScript
- **Database**: MySQL

## 项目结构

worldfriend/

│

├── worldfriend/          # 主项目目录

│   ├── __init__.py

│   ├── settings.py       # 配置文件

│   ├── urls.py           # 路由配置

│   └── wsgi.py

│


│   ├── __init__.py

│   ├── admin.py          # 管理后台

│   ├── models.py         # 数据模型

│   ├── views.py          # 视图

│   ├── forms.py          # 表单

│   └── urls.py           # 应用路由配置

│

├── static/                # 静态文件目录 (CSS, JS, 图片)

│

├── templates/             # HTML 模板

│

├── sql.sql             # MYSQL 数据库文件

└── manage.py              # 管理工具脚本
