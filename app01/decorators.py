# myapp/decorators.py

from django.shortcuts import redirect

def custom_login_required(view_func):
    def wrapper(request, *args, **kwargs):
        if 'user_id' not in request.session:
            return redirect('/login/')  # 重定向到登录页面
        return view_func(request, *args, **kwargs)
    return wrapper