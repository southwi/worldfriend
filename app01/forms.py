from django import forms


class UploadForm(forms.Form):
    name = forms.CharField(label='新昵称', max_length=100, required=False)
    sign = forms.CharField(label='个性签名', max_length=100, required=False)
    image = forms.FileField(label='修改头像', required=False)


class UploadEssay(forms.Form):
    text = forms.CharField(label='朋友圈内容', max_length=100, required=True)
    imageUpload = forms.FileField(label='添加图片', required=False)
