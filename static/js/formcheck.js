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

/*验证register表单start*/
$(function(){
	$('#register').validate();
})
/*验证register表单end*/

/*验证register2表单start*/
$(function(){
	$('#register2').validate({
		rules:{
			username:{
				required:true
			},
			password:{
				required:true,
				rangelength:[8,10]
			},
			password2:{
				required:true,
				equalTo:'#password'
			}
		},
		messages:{
			username:{
				required:'请输入一个用户名'
			},
			password:{
				required:'请设置一个密码',
				rangelength:'密码位数为8到10位'
			},
			password2:{
				required:'请再次确认密码',
				equalTo:'两次输入密码不相符'
			}
		}
	});
})
/*验证register2表单end*/

/*验证register3表单start*/
$(function(){
	$('#register3').validate({
		rules:{
			username:{
				required:true
			},
			password:{
				required:true,
				rangelength:[8,10]
			},
			password2:{
				required:true,
				equalTo:'#password'
			}
		},
		messages:{
			username:{
				required:'请输入一个用户名'
			},
			password:{
				required:'请设置一个密码',
				rangelength:'密码位数为8到10位'
			},
			password2:{
				required:'请再次确认密码',
				equalTo:'两次输入密码不相符'
			}
		},
		errorClass:'ctt',
		errorElement:'span'
	});
})
/*验证register3表单end*/

/*验证register4表单end*/
$(function(){
	$('#register4').validate({
		rules:{
			username:{
				required:true
			},
			password:{
				required:true,
				rangelength:[8,10]
			},
			password2:{
				required:true,
				equalTo:'#password'
			}
		},
		messages:{
			username:{
				required:'请输入一个用户名'
			},
			password:{
				required:'请设置一个密码',
				rangelength:'密码位数为8到10位'
			},
			password2:{
				required:'请再次确认密码',
				equalTo:'两次输入密码不相符'
			}
		},
		errorContainer:'em',
		errorLabelContainer:'em',
		wrapper:'b'
	})
})
/*验证register4表单end*/

/*验证register5表单end*/
$(function(){
	$('#register5').validate({
		rules:{
			username:{
				required:true
			},
			password:{
				required:true,
				rangelength:[8,10]
			},
			password2:{
				required:true,
				equalTo:'#password'
			}
		},
		messages:{
			username:{
				required:'请输入一个用户名'
			},
			password:{
				required:'请设置一个密码',
				rangelength:'密码位数为8到10位'
			},
			password2:{
				required:'请再次确认密码',
				equalTo:'两次输入密码不相符'
			}
		},
        success: function(label){
			label.addClass('checked');
		}
	})
})
/*验证register5表单end*/