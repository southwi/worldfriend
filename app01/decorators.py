# myapp/decorators.py

from django.shortcuts import redirect
from app01.models import Adpass
from gmssl import sm3


def custom_login_required(view_func):
    def wrapper(request, *args, **kwargs):
        if 'user_id' not in request.session:
            return redirect('login')  # 重定向到登录页面
        date = Adpass.objects.get(id=request.session['user_id'])
        pwd = bytes(date.password, 'utf-8')
        list1 = [i for i in pwd]
        if date.name != request.session['name'] or sm3.sm3_hash(list1) != request.session.get('pwd'):
            return redirect('login')
        return view_func(request, *args, **kwargs)

    return wrapper
