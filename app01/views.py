import hashlib
import os
from captcha.helpers import captcha_image_url
from captcha.models import CaptchaStore
from datetime import datetime
from django.shortcuts import render, redirect
from django.contrib import messages
from app01.models import *
from django.db.models import Q, Max
from django.http import JsonResponse
from django.db import connection
from gmssl import sm3
from worldfriend import settings
from .forms import *
from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .decorators import custom_login_required
import pytz


# 添加用户
@custom_login_required
def adduser(request):
    if Adpass.objects.filter(name=request.session.get('name')).exists():
        if request.method == 'POST':
            userid = request.POST.get('id')
            name = request.POST.get('username')
            password = request.POST.get('password')
            signa = request.POST.get('signa')
            if request.session.get('name') != 'admin':
                messages.error(request, '该操作只能由管理员执行！')
                return redirect('adduser')
            exists = Adpass.objects.filter(name=name).exists()
            if exists:
                messages.error(request, '创建失败，用户名已存在！')
                return redirect('adduser')
            exists = Adpass.objects.filter(id=userid).exists()
            if exists:
                messages.error(request, '创建失败，ID已存在！')
                return redirect('adduser')
            if name == 'admin':
                messages.error(request, '创建失败，创建用户名不应为admin！')
                return redirect('adduser')
            # 在此处可以进行表单验证，确保输入的数据符合要求
            # 创建用户并保存到数据库
            new_user = Adpass(id=userid, name=name, password=password)
            new_user.save()
            messages.success(request, '用户创建成功！')
            user = User.objects.get(id=userid)
            user.signature = signa
            user.save()
            return redirect('adduser')  # 重定向到创建用户页面或其他页面
        return render(request, 'adduser.html')
    else:
        message = '请先登录'
        return redirect('http://localhost:8000/')


'''def removeuser(request):
    name = login_name
    if Adpass.objects.filter(name=name).exists():
        if request.method == 'POST':
            userid = request.POST.get('id')
            name = request.POST.get('name')
            password = request.POST.get('password')
            if userid == '000000000':
                messages.error(request, '不可删除管理员账号!')
                return redirect('removeuser')
            exists = Adpass.objects.filter(id=userid).exists()
            if exists:
                user = Adpass.objects.get(id=userid)
                if user.password == password:
                    user.delete()
                    messages.success(request, '用户删除成功！')
                    return redirect('removeuser')  # 重定向到创建用户页面或其他页面
                else:
                    messages.error(request, '密码错误，无法删除！')
                    return redirect('removeuser')  # 重定向到创建用户页面或其他页面
            exists = Adpass.objects.filter(name=name).exists()
            if exists:
                user = Adpass.objects.get(name=name)
                if user.password == password:
                    user.delete()
                    messages.success(request, '用户删除成功！')
                    return redirect('removeuser')  # 重定向到创建用户页面或其他页面
                else:
                    messages.error(request, '密码错误，无法删除！')
            else:
                messages.error(request, '未查询到用户')
                return redirect('removeuser')
        return render(request, 'removeuser.html')
    else:
        message = '请先登录'
        return redirect('http://localhost:8000/')'''


# 删除用户
@custom_login_required
def removeuser(request):
    name = request.session.get('name')
    if Adpass.objects.filter(name=name).exists():
        if request.method == 'POST':
            if name != 'admin':
                messages.error(request, '该操作只能由管理员执行！')
                return redirect('removeuser')
            userid = request.POST.get('id')
            name = request.POST.get('name')
            password = request.POST.get('password')
            if userid == '000000000' or name == 'admin':
                messages.error(request, '请勿尝试删除管理员账号!')
                return redirect('removeuser')
                # 使用存储过程删除用户
            with connection.cursor() as cursor:
                try:
                    # 调用存储过程
                    cursor.callproc('DeleteAdpass', [userid, name, password])
                except Exception as e:
                    # 处理存储过程执行失败的情况
                    messages.error(request, '删除用户失败!')
                    return redirect('removeuser')
                # 删除成功后的提示消息
                messages.success(request, '成功删除用户!')
                return redirect('removeuser')
        return render(request, 'removeuser.html')
    else:
        # 未登录时的处理
        messages.error(request, '请先登录!')
        return redirect('http://localhost:8000/')


'''def change_pwd(request):
    name = login_name
    if request.method == 'POST':
        pwd_now = request.POST.get('password1')
        pwd_new = request.POST.get('password')
        try:
            obj = Adpass.objects.get(name=name)
            if pwd_now != obj.password:
                messages.error(request, '修改失败，原密码错误！')
                return redirect('change_pwd')
            obj.password = pwd_new
            obj.save()
            messages.success(request, '修改成功，请重新登录！')
            return redirect('login')
        except Adpass.DoesNotExist:
            messages.error(request, '修改失败，未查询到登陆状态。')
            return redirect('login')
    return render(request, 'change_pwd.html')'''


# 修改密码
@custom_login_required
def change_pwd(request):
    if request.method == 'POST':
        name = request.session.get('name')
        pwd_now = request.POST.get('password1')
        pwd_new = request.POST.get('password')
        with connection.cursor() as cursor:
            try:
                cursor.callproc('UpdatePwd', [name, pwd_now, pwd_new])
                result = cursor.fetchall()
                message = result[0][0]  # 提取存储过程返回的消息
                if message == '密码更新成功':
                    clear_session(request)
                    messages.success(request, '修改成功，请重新登录！')
                    request.session.flush()
                    return redirect('login')  # 密码修改成功，重定向到登录页或其他适当的页面
                # 如果未发生重定向，说明密码修改失败
                messages.error(request, "密码修改失败！")
                return redirect('change_pwd')  # 密码修改失败，重定向回密码修改页面
            except Exception as e:
                messages.error(request, "修改失败！")
                return redirect('change_pwd')
    return render(request, 'change_pwd.html')


# 验证码生成
def refresh_captcha(request):
    # 生成新的验证码 hashkey
    hashkey = CaptchaStore.generate_key()
    # 获取验证码图片 URL
    imgage_url = captcha_image_url(hashkey)
    return JsonResponse({'image_url': imgage_url, 'hashkey': hashkey})


# 登陆页面
def login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['name']
            print(username)
            password = form.cleaned_data['pwd']
            print(password)
            vcode = form.cleaned_data['vcode']
            vcode_key = form.cleaned_data['hashkey']
            # 验证查询数据库生成正确的码
            try:
                get_captcha = CaptchaStore.objects.get(hashkey=vcode_key)
                if vcode.lower() != get_captcha.response.lower():
                    messages.error(request, '验证码不正确！')
                    return render(request, 'login.html', {'form': form})

                user = Adpass.objects.get(name=username)
                if user.password == password:
                    # 设置会话信息
                    request.session['user_id'] = user.id
                    request.session['name'] = user.name
                    pwd = bytes(password, 'utf-8')
                    list1 = [i for i in pwd]
                    request.session['pwd'] = sm3.sm3_hash(list1)
                    return redirect('index/')  # 重定向到主页
                else:
                    messages.error(request, '密码不正确！')
                    return render(request, 'login.html', {'form': form})
            except Adpass.DoesNotExist:
                messages.error(request, '用户不存在！')
                return render(request, 'login.html', {'form': form})
            except CaptchaStore.DoesNotExist:
                messages.error(request, '验证码无效！')
                return render(request, 'login.html', {'form': form})
    else:
        form = LoginForm()
    # 验证码生成
    hashkey = CaptchaStore.generate_key()
    imgage_url = captcha_image_url(hashkey)
    return render(request, 'login.html', {'form': form, 'hashkey': hashkey, 'imgage_url': imgage_url})


def clear_session(request):
    request.session.flush()


def logout(request):
    # Check if the user is logged in
    clear_session(request)
    return redirect('login')


# 导航
@custom_login_required
def index(request):
    return render(request, 'index.html')


'''def search_user(request):
    query = request.GET.get('query', '')

    if query:
        # 查询 User 模型，根据 ID 或 name
        users = User.objects.filter(id__icontains=query) | User.objects.filter(name__icontains=query)

        # 遍历查询结果，将数据添加到结果列表中
        u_results = [
            {
                'id': user.id,
                'name': user.name,
                'signature': user.signature,
                'avatar': user.avatar
            }
            for user in users
        ]
        # 返回 JSON 格式的结果
        return JsonResponse(u_results, safe=False)
    return render(request, 'search_user.html')'''


# 查询用户
@custom_login_required
def search_user(request):
    query = request.GET.get('query', '')
    if query:
        # 调用存储过程查询用户
        with connection.cursor() as cursor:
            cursor.callproc('GetUser', [query])
            results = cursor.fetchall()

        # 将查询结果组装成字典列表
        users = [
            {
                'id': user[0],
                'name': user[1],
                'signature': user[2],
                'avatar': user[3]
            }
            for user in results
        ]
        return JsonResponse(users, safe=False)  # 返回查询结果作为 JSON 对象
    return render(request, 'search_user.html')


# 查询朋友圈
@custom_login_required
def search_essay(request):
    query1 = request.GET.get('query1', '')

    if query1:
        # 查询 User 模型，根据 ID 或 name
        users = Whosays.objects.filter(Q(ownerid__id__icontains=query1) | Q(essayid__icontains=query1))

        # 遍历查询结果，将数据添加到结果列表中
        e_results = [
            {
                'ownerid': user.ownerid_id,
                'essayid': user.essayid,
                'text': user.text,
                'saytime': user.saytime.strftime('%Y-%m-%d %H:%M:%S'),
                'pictureway': user.pictureway
            }
            for user in users
        ]
        # 返回 JSON 格式的结果
        return JsonResponse(e_results, safe=False)
    return render(request, 'search_essay.html')


# 查询评论
@custom_login_required
def search_comments(request):
    query2 = request.GET.get('query2', '')
    if query2:
        users = Comments.objects.filter(Q(userid__id__icontains=query2) | Q(textid__icontains=query2))

        # 遍历查询结果，将数据添加到结果列表中
        c_results = [
            {
                'userid': user.userid_id,
                'textid': user.textid,
                'essayid': user.essayid,
                'text': user.text,
                'saytime': user.saytime.strftime('%Y-%m-%d %H:%M:%S'),
            }
            for user in users
        ]
        # 返回 JSON 格式的结果
        return JsonResponse(c_results, safe=False)
    return render(request, 'search_comments.html')


'''def friendworld(request):
    # 获取当前登录用户
    current_user = request.user
    if request.method == 'POST':
        # 获取当前登录用户
        current_user = request.user

        # 获取评论内容
        comment_content = request.POST.get('comment_content')

        # 获取对应的 Friend World 对象
        friendworld_post = FriendWorldPost.objects.get(id=post_id)

        # 创建评论对象并保存到数据库
        comment = FriendWorldComment.objects.create(
            user=current_user,
            post=friendworld_post,
            content=comment_content
        )
        comment.save()
        return redirect('friendworld')  # 重定向到 Friend World 页面
    # 查询当前用户的所有 Friend World 内容
    friendworld_posts = FriendWorldPost.objects.filter(user=current_user)

    context = {
        'friendworld_posts': friendworld_posts,
        'current_user': current_user,
    }

    return render(request, 'friendworld.html', context)
'''


# 修改个人信息
@custom_login_required
def change_message(request):
    if request.method == 'POST':
        form = UploadForm(request.POST, request.FILES)
        if form.is_valid():
            new_name = form.cleaned_data.get('name')
            sign = form.cleaned_data.get('sign')
            uploaded_file = form.cleaned_data['image']
            old_name = request.session.get('name')
            user = User.objects.get(name=old_name)
            if new_name != '':
                if Adpass.objects.exclude(id=request.session.get('id')).filter(name=new_name).exists():
                    messages.error(request, '该用户名已被使用，请选择其他用户名！')
                    return redirect('change_message')
                user.name = new_name
                request.session['name'] = new_name
            if sign != '':
                user.signature = sign
            # 自定义文件保存的路径
            upload_folder = os.path.join(settings.BASE_DIR, 'static\\img\\user\\photo\\')
            if not os.path.exists(upload_folder):
                os.makedirs(upload_folder)
            # 构建新的保存路径，保持文件名不变
            if uploaded_file:
                file_path = os.path.join(upload_folder, uploaded_file.name)

                # 将上传的文件保存到指定位置
                with open(file_path, 'wb+') as destination:
                    for chunk in uploaded_file.chunks():
                        destination.write(chunk)

                user.avatar = 'user/photo/' + uploaded_file.name
            user.save()
            # 生成文件路径后，将路径传递给模板渲染，或者进行其他操作
            return redirect('homepage')
    else:
        form = UploadForm()
    return render(request, 'change_message.html', {'form': form})


# 发布朋友圈
@custom_login_required
def add_essay(request):
    if request.method == 'POST':
        essay = UploadEssay(request.POST, request.FILES)
        if essay.is_valid():
            text = essay.cleaned_data['text']
            image = essay.cleaned_data['imageUpload']
            now_name = request.session.get('name')
            # 当前登录的用户
            user = User.objects.get(name=now_name)
            # 生成最大essay_id + 1
            max_essayid = Whosays.objects.aggregate(Max('essayid'))['essayid__max']
            next_essayid = '1' + str(int(max_essayid[1:]) + 1).zfill(8)
            essay_way = os.path.join(settings.BASE_DIR, 'static\\img\\whosays\\')
            if not os.path.exists(essay_way):
                os.makedirs(essay_way)
            # 构建新地保存路径，保持文件名不变
            # print(text)
            if image:
                file_path = os.path.join(essay_way, image.name)
                #     print(image.name)
                # 将上传的文件保存到指定位置
                with open(file_path, 'wb+') as destination:
                    for chunk in image.chunks():
                        destination.write(chunk)
                new_essay = Whosays(ownerid=user, essayid=next_essayid, text=text, saytime=datetime.now(),
                                    pictureway='whosays/' + image.name)
            else:
                new_essay = Whosays(ownerid=user, essayid=next_essayid, saytime=datetime.now(), text=text)
            new_essay.save()
            return redirect('homepage')
    return render(request, 'add_essay.html')


# 个人主页
@custom_login_required
def homepage(request):
    name = request.session.get('name')
    user = User.objects.get(name=name)
    users = User.objects.all()
    posts = Whosays.objects.filter(ownerid=user.id).order_by('-saytime')
    # print(users)
    # 获取每个帖子的评论
    post_ids = [post.essayid for post in posts]
    comments = Comments.objects.filter(essayid__in=post_ids)
    likes = Support.objects.select_related('omnerid').filter(essayid__in=post_ids)
    # 将评论与帖子进行关联
    return render(request, 'home.html',
                  {'users': users, 'likes': likes, 'user': user, 'posts': posts, 'comments': comments})


# 朋友圈列表
@custom_login_required
def essay_center(request):
    posts = Whosays.objects.select_related('ownerid').all().order_by('-saytime')
    supports = Support.objects.select_related('omnerid').all()
    comments = Comments.objects.select_related('userid').all().order_by('textid')
    return render(request, 'essay_center.html',
                  {'posts': posts, 'supports': supports, 'comments': comments})


'''def add_comment(request):
    if request.method == 'POST':
        user = User.objects.get(id=request.session.get('user_id'))
        post_id = request.POST.get('post_id')
        comment_text = request.POST.get('comment_text')

        # 获取最大 textid 并生成下一个 textid
        max_textid = Comments.objects.aggregate(Max('textid'))['textid__max']
        next_textid = '2' + str(int(max_textid[1:]) + 1).zfill(8)

        # 创建评论对象并保存到数据库
        comment = Comments(essayid=post_id, text=comment_text, userid=user, textid=next_textid, saytime=datetime.now())
        comment.save()

        # 返回新评论的用户名和文本内容
        return JsonResponse({'username': comment.userid.name, 'text': comment.text, 'saytime': comment.saytime.strftime('%Y-%m-%d %H:%M:%S')})

    return redirect('essay_center')'''


def add_comment(request):
    if request.method == 'POST':
        user = User.objects.get(id=request.session.get('user_id'))
        post_id = request.POST.get('post_id')
        comment_text = request.POST.get('comment_text')

        # 获取最大 textid 并生成下一个 textid
        max_textid = Comments.objects.aggregate(Max('textid'))['textid__max']
        next_textid = '2' + str(int(max_textid[1:]) + 1).zfill(8)

        # 获取当前时间，并确保包含时区信息
        current_time = datetime.now(pytz.timezone('Asia/Shanghai'))  # 根据你的时区调整

        # 调用存储过程添加评论
        with connection.cursor() as cursor:
            cursor.callproc('AddComment', [post_id, comment_text, user.id, next_textid, current_time])

        # 获取新评论的信息
        comment = Comments.objects.get(textid=next_textid)

        # 返回新评论的用户名和文本内容
        return JsonResponse({'username': comment.userid.name, 'text': comment.text,
                             'saytime': comment.saytime.strftime('%Y-%m-%d %H:%M:%S')})

    return redirect('essay_center')


def add_support(request):
    if request.method == 'POST':
        post_id = request.POST.get('post_id')
        # 假设已经从请求中获取了当前用户和相关信息
        user_id = request.session.get('user_id')
        user = User.objects.get(id=user_id)
        max_spt = Support.objects.aggregate(Max('sptid'))['sptid__max']
        next_spt = '3' + str(int(max_spt[1:]) + 1).zfill(8)
        current_time = datetime.now(pytz.timezone('Asia/Shanghai'))
        # 将点赞记录插入数据库
        exists = Support.objects.filter(essayid=post_id, omnerid=user.id).exists()
        if not exists:
            with connection.cursor() as cursor:
                cursor.execute("CALL insert_support(%s, %s, %s, %s)", [user_id, post_id, next_spt, current_time])
            return JsonResponse({'avatar': user.avatar})
        else:
            Support.objects.filter(essayid=post_id, omnerid=user.id).delete()
            print(1)
            return JsonResponse({'avatar': "delete"})
    else:
        return redirect('essay_center')


def del_essay(request):
    if request.method == 'POST':
        post_id = request.POST.get('post_id')
        print(post_id)
        try:
            Whosays.objects.get(essayid=post_id).delete()
            return JsonResponse({'statu': 'success'})
        except Whosays.DoesNotExist:
            return JsonResponse({'statu': 'failed', 'error': 'Post not found'})
    else:
        return redirect('homepage')

