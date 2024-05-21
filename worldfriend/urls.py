"""
URL configuration for worldfriend project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.contrib.auth.management.commands import changepassword
from django.urls import path
from app01.views import *
from django.urls import include

urlpatterns = [
    path('adduser/', adduser, name='adduser'),
    path('removeuser/', removeuser, name='removeuser'),
    path('change_pwd/', change_pwd, name='change_pwd'),
    path('', login, name='login'),
    path('captcha/', include('captcha.urls')),
    path('refresh_captcha/', refresh_captcha, name='refresh_captcha'),
    path('index/', index, name='index'),
    path('search_user/', search_user, name='search_user'),
    path('search_essay/', search_essay, name='search_essay'),
    path('search_comments/', search_comments, name='search_comments'),
    path('homepage/', homepage, name='homepage'),
    path('change_message/', change_message, name='change_message'),
    path('add_essay/', add_essay, name='add_essay'),
]
