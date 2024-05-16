/*将默认提示中文化start*/
jQuery.extend(jQuery.validator.messages, {
    required   : "必选字段",
	remote     : "请修正该字段",
	email      : "请输入正确格式的电子邮件",
	url        : "请输入合法的网址",
	date       : "请输入合法的日期",
	dateISO    : "请输入合法的日期 (ISO).",
	number     : "请输入合法的数字",
	digits     : "只能输入整数",
	creditcard : "请输入合法的信用卡号",
	equalTo    : "请再次输入相同的值",
	accept     : "请输入拥有合法后缀名的字符串",
	maxlength  : jQuery.validator.format("请输入一个长度最多是{0}的字符串"),
	minlength  : jQuery.validator.format("请输入一个长度最少是{0}的字符串"),
	rangelength: jQuery.validator.format("请输入一个长度介于{0}和{1}之间的字符串"),
	range      : jQuery.validator.format("请输入一个介于{0}和{1}之间的值"),
	max        : jQuery.validator.format("请输入一个最大为{0}的值"),
	min        : jQuery.validator.format("请输入一个最小为{0}的值")
});
/*将默认提示中文化end*/

/*验证demo表单start*/
$(function(){
	$('#demo').validate({
		errorElement: 'span',
		errorClass: 'false',
		validClass: 'right',
		rules: {
			username: {
				required: true
			},
			password: {
				required: true,
				minlength: 8,
				maxlength: 16
			},
			password2: {
				required: true,
				equalTo: '#password',
				minlength: 8,
				maxlength: 16
			},
			tel: {
				required: true,
				digits: true
			},
			sex: {
				required: true
			},
			favorite: {
				required: true,
				minlength: 2
			}
		},
		messages: {
			username: {
				required: '请设置一个用户名'
			},
			password: {
				required: '请设置一个密码',
				minlength: '密码长度不小于8个字符',
				maxlength: '密码长度不大于16个字符'
			},
			password2: {
				required: '请再次确认密码',
				equalTo: '两次输入密码不相同',
				minlength: '密码长度不小于8个字符',
				maxlength: '密码长度不大于16个字符'
			},
			tel: {
				required: '请输入您的ID',
				digits: 'Id值只能为数字'
			}
		}
	});	
})
/*验证demo表单end*/