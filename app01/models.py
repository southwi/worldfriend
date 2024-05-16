#-*- coding=utf-8 -*-

from django.db import models


class Adpass(models.Model):
    id = models.CharField(primary_key=True, max_length=100)
    name = models.CharField(max_length=100, blank=True, null=True)
    password = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'adpass'


class Comments(models.Model):
    userid = models.ForeignKey('User', models.DO_NOTHING, db_column='userid')
    essayid = models.CharField(max_length=15)
    textid = models.CharField(primary_key=True, max_length=15)
    text = models.CharField(max_length=100)
    saytime = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'comments'


class Support(models.Model):
    omnerid = models.ForeignKey('User', models.DO_NOTHING, db_column='omnerid')
    essayid = models.CharField(max_length=15)
    sptid = models.CharField(primary_key=True, max_length=15)
    spttime = models.DateTimeField()
    sptavatar = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'support'


class User(models.Model):
    id = models.CharField(primary_key=True, max_length=15)
    name = models.CharField(max_length=40, blank=True, null=True)
    signature = models.CharField(max_length=100, blank=True, null=True)
    avatar = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user'


class Whosays(models.Model):
    ownerid = models.ForeignKey(User, models.DO_NOTHING, db_column='ownerid', blank=True, null=True)
    essayid = models.CharField(primary_key=True, max_length=15)
    text = models.CharField(max_length=250, blank=True, null=True)
    saytime = models.DateTimeField(blank=True, null=True)
    pictureway = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'whosays'
