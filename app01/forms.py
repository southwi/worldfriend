from django import forms


class UploadForm(forms.Form):
    name = forms.CharField(label='新昵称', max_length=100, required=False)
    sign = forms.CharField(label='个性签名', max_length=100, required=False)
    image = forms.FileField(label='修改头像', required=False)


class UploadEssay(forms.Form):
    text = forms.CharField(label='朋友圈内容', max_length=100, required=True)
    imageUpload = forms.FileField(label='添加图片', required=False)


class LoginForm(forms.Form):
    name = forms.CharField(label='用户名', max_length=100, widget=forms.TextInput(
        attrs={'class': 'name', 'placeholder': '用户名', 'autocomplete': 'off'}))
    pwd = forms.CharField(label='密码', widget=forms.PasswordInput(
        attrs={'class': 'pwd', 'placeholder': '密码', 'autocomplete': 'off'}))
    vcode = forms.CharField(label='验证码', max_length=10, widget=forms.TextInput(
        attrs={'class': 'weui-input', 'placeholder': '请输入验证码', 'required': True}))
    hashkey = forms.CharField(widget=forms.HiddenInput)
