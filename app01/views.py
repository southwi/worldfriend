from captcha.helpers import captcha_image_url
from captcha.models import CaptchaStore
from django.core.exceptions import ObjectDoesNotExist
from django.http import *
from django.shortcuts import render, redirect
from django.contrib import messages
from app01.models import *
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.http import JsonResponse
from django.db import connection

login_name = "test"


def adduser(request):
    name = login_name
    if Adpass.objects.filter(name=name).exists():
        if request.method == 'POST':
            userid = request.POST.get('id')
            name = request.POST.get('username')
            password = request.POST.get('password')
            signa = request.POST.get('signa')
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


def removeuser(request):
    name = login_name
    if Adpass.objects.filter(name=name).exists():
        if request.method == 'POST':
            userid = request.POST.get('id')
            name = request.POST.get('name')
            password = request.POST.get('password')
            if userid == '000000000' or name == 'admin':
                messages.error(request, '不可删除管理员账号!')
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


def change_pwd(request):
    name = login_name
    if request.method == 'POST':
        pwd_now = request.POST.get('password1')
        pwd_new = request.POST.get('password')
        with connection.cursor() as cursor:
            try:
                cursor.callproc('UpdatePwd', [name, pwd_now, pwd_new])
                result = cursor.fetchall()
                message = result[0][0]  # 提取存储过程返回的消息
                if message == 'Password updated successfully.':
                    messages.success(request, '修改成功，请重新登录！')
                    return redirect('login')  # 密码修改成功，重定向到登录页或其他适当的页面
                # 如果未发生重定向，说明密码修改失败
                messages.error(request, "密码修改失败！")
                return redirect('change_pwd')  # 密码修改失败，重定向回密码修改页面
            except Exception as e:
                messages.error(request, "密码修改失败1！")
                return redirect('change_pwd')
    return render(request, 'change_pwd.html')


def refresh_captcha(request):
    # 生成新的验证码 hashkey
    hashkey = CaptchaStore.generate_key()
    # 获取验证码图片 URL
    imgage_url = captcha_image_url(hashkey)
    return JsonResponse({'image_url': imgage_url, 'hashkey': hashkey})


def login(request):
    # 验证码生成
    hashkey = CaptchaStore.generate_key()
    imgage_url = captcha_image_url(hashkey)

    if request.method == 'POST':
        username = request.POST.get('name')
        password = request.POST.get('pwd')
        vcode = request.POST.get('vcode')
        vcode_key = request.POST.get('hashkey')
        # 验证查询数据库生成正确的码
        get_captcha = CaptchaStore.objects.get(hashkey=vcode_key)
        try:
            user = Adpass.objects.get(name=username)
        except:
            messages.error(request, '用户不存在！')
            return render(request, 'login.html', locals())

        if user.password == password:
            if vcode.lower() == get_captcha.response.lower():
                global login_name
                login_name = username
                return redirect('index/')  # 重定向到添加用户页面
            else:
                messages.error(request, '验证码不正确！')
                return render(request, 'login.html', locals())
        else:
            messages.error(request, '密码不正确！')
            return render(request, 'login.html', locals())
    else:
        return render(request, 'login.html', locals())


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


def search_user(request):
    query = request.GET.get('query', '')
    if query:
        # 调用存储过程查询用户
        with connection.cursor() as cursor:
            cursor.callproc('GetUserById', [query])
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


'''def homepage(request):
    name = login_name
    user = Adpass.objects.get(name=name)
    user_id = user.id
    user = User.objects.get(id=user_id)
    posts = Whosays.objects.filter(ownerid=user_id).order_by('-saytime')
    return render(request, 'home.html', {'user': user, 'posts': posts})'''
