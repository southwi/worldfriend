<!doctype html>
<html>
<head>
<meta http-equiv = "X-UA-Compatible" content = "IE=Edge">
<meta language="zh">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="/style/css/reset.css">
<link rel="stylesheet" type="text/css" href="/style/css/main.css">
<link rel="stylesheet" type="text/css" href="/style/css/jquery-ui-1.10.3.custom.min.css">
<link rel="stylesheet" type="text/css" href="/style/css/agent.css">
<!--[if lt IE 7 ]>
	<link rel="stylesheet" type="text/css" href="css/ie6.css">
	<script src="js/png.js"></script>
    <script>
       PNG.fix('.select-box i');
    </script>
<![endif]-->
</head>
<body class="seting-page Agent">
<h1 class="title">加盟商列表>添加<span id="sysControl" class="sys-control"><a href="javascript:;"></a></span> 
  <!--系统伸缩列表 start-->
  <div id="sysBox" class="sys-box">
    <ul class="clearfix">
      <li><a href="agent.php" target="_blank"><img src="/images/sys-icon/icon_01.png">代理商管理</a></li>
      <li><a href="campaign.php" target="_blank"><img src="/images/sys-icon/icon_02.png">营销活动管理</a></li>
      <li><a href="system.php" target="_blank"><img src="/images/sys-icon/icon_03.png">系统设置</a></li>
      <li><a href="product.php" target="_blank"><img src="/images/sys-icon/icon_04.png">产品管理</a></li>
      <li><a href="customer.php" target="_blank"><img src="/images/sys-icon/icon_05.png">客户服务管理</a></li>
      <li><a href="financial.php" target="_blank"><img src="/images/sys-icon/icon_06.png">财务管理</a></li>
      <li><a href="store.php" target="_blank"><img src="/images/sys-icon/icon_07.png">门店管理</a></li>
      <li><a href="tv.php" target="_blank"><img src="/images/sys-icon/icon_08.png">电视媒体运营管理</a></li>
      <li><a href="order.php" target="_blank"><img src="/images/sys-icon/icon_09.png">核心订单管理</a></li>
      <li><a href="user.php" target="_blank"><img src="/images/sys-icon/icon_10.png">用户管理</a></li>
      <li><a href="logistics.php" target="_blank"><img src="/images/sys-icon/icon_11.png">物流仓储管理</a></li>
      <li><a href="official.php" target="_blank"><img src="/images/sys-icon/icon_12.png">官方网络营销管理</a></li>
      <li><a href="production.php" target="_blank"><img src="/images/sys-icon/icon_13.png">生产管理</a></li>
      <li><a href="security.php" target="_blank"><img src="/images/sys-icon/icon_14.png">防伪追溯管理</a></li>
      <li><a href="thirdparty.php" target="_blank"><img src="/images/sys-icon/icon_15.png">第三方营销管理</a></li>
      <div class="up-btn" id="sysHide"></div>
    </ul>
  </div>
  <!--系统伸缩列表 end--> 
</h1>
<div id="tab" class="user-detail">
	<ul class="navigation clearfix">
    	<li><a href="newset.php" class="on">添加</a></li>
    	<li><a href="addset.php">意向</a></li>
    	<li><a href="#">定金</a></li>
    	<li><a href="#">初审</a></li>
    	<li><a href="#">信息确认</a></li>
    	<li><a href="#">信息审核</a></li>
    	<li><a href="#">签约</a></li>
    	<li><a href="#">尾款确认</a></li>
    	<li><a href="#">开店</a></li>
    	<li><a href="#">授权</a></li>
    	<li><a href="#">归档</a></li>
    </ul>
    <div class="box_pad">
	<form method="post" action="newset.php">
		{{if $t.AgentID > 0}}
		<input type="hidden" name="AgentID" value="{{$t.AgentID}}">
		<input type="hidden" name="action" value="modify">
		{{else}}
		<input type="hidden" name="action" value="add">
		{{/if}}
        加盟商类型：
        <select  class="input-text-sel" onChange="changeSelect(this);return false;"  name="AgentBodyTypeID">
            <option value="1">公司</option>
            <option value="2">个人</option>
        </select>
        加盟商名称：<input  class="input-text" type="text" placeholder="" name="AgentName">
        服务专员：
        <select  class="input-text-sel" name="ServiceID">
            <option value="1">专员a</option>
            <option value="2">专员a</option>
            <option value="3">专员a</option>
        </select>
        <div id="forcompany">
            <h3 class="set_h3">企业信息</h3>
            <ul class="nav_to clearfix new_cer">
                <li class="on" id="only"><a href="#">独立证件</a></li>
                <li id="three"><a href="#">三证合一</a></li>
				<input  class="input-text input-per" type="hidden" value="" name="cardtype" id="cardtype"> 
            </ul>
            <div class="infBox certificate">
			
                <div class="inf-top">
                    <span class="forIts">企业名称：</span><input  class="input-text input-per" type="text" placeholder="" name="">
                    <span class="forIts">营业执照号：</span><input  class="input-text input-per" type="text" placeholder="" name="BussinessCode">
                </div>
                <div class="inf-top">
                    <span class="forIts">组织机构代码证号：</span><input  class="input-text input-per" type="text" placeholder="" name="OrganizationCode">
                    <span class="forIts">税务登记证号：</span><input  class="input-text input-per" type="text" placeholder="" name="TaxCode">
                </div>
                <div class="inf-top mar-bot">
                    <span class="forIts">企业地址：</span>
                    <select  class="input-text-sel" name="ProvinceID">
                        <option>专员a</option>
                        <option>专员a</option>
                        <option>专员a</option>
                    </select>
                    <select  class="input-text-sel" name="CityID">
                        <option>专员a</option>
                        <option>专员a</option>
                        <option>专员a</option>
                    </select>
                    <select  class="input-text-sel" name="AreaID">
                        <option>专员a</option>
                        <option>专员a</option>
                        <option>专员a</option>
                    </select>
                    <input  class="input-text input-per" type="text" placeholder="" name="Address">
                </div>
            </div> 

            <div class="infBox hidden certificate">
                <div class="inf-top">
                    <span class="forIts">企业名称：</span><input  class="input-text input-per" type="text" placeholder="">
                </div>
                <div class="inf-top">
                    <span class="forIts">证件号：</span><input  class="input-text input-per" type="text" placeholder="" name="CertificateCode">
                </div>
                <div class="inf-top mar-bot">
                    <span class="forIts">企业地址：</span>
                    <select  class="input-text-sel" name="ProvinceID">
                        <option>专员a</option>
                        <option>专员a</option>
                        <option>专员a</option>
                    </select>
                    <select  class="input-text-sel" name="CityID">
                        <option>专员a</option>
                        <option>专员a</option>
                        <option>专员a</option>
                    </select>
                    <select  class="input-text-sel" name="AreaID">
                        <option>专员a</option>
                        <option>专员a</option>
                        <option>专员a</option>
                    </select>
                    <input  class="input-text input-per" type="text" placeholder="" name="Address">
                </div>
            </div>  
                  
        </div>        
        <div class="responsible clearfix">
        	<div class="responL new_res">
            	<h4>法人（负责人）信息</h4>
                <p><span class="forIts2">负责人姓名：</span><input type="text" value="" class="newIts" name="ContactName"></p>
                <p><span class="forIts2">身份证：</span><input type="text" value="" class="newIts" name="ContactIDNumber"></p>
                <p><span class="forIts2">联系方式：</span><input type="text" value="" class="newIts" name="ContactMobile"></p>
                <p><span class="forIts2">传　真：</span><input type="text" value="" class="newIts" name="ContactPost"></p>
                <p><span class="forIts2">联系地址：</span>
                	<select  name="ContactProvinceID">
                    	<option>北京市</option>
                    	<option>北京市</option>
                    	<option>北京市</option>
                    </select>
                	<select  name="ContactCityID">
                    	<option>北京市</option>
                    	<option>北京市</option>
                    	<option>北京市</option>
                    </select>
                	<select  name="ContactAreaID">
                    	<option>北京市</option>
                    	<option>北京市</option>
                    	<option>北京市</option>
                    </select>
                	<input type="text" value="" class="newIts newIts2"  name="ContactAddress">
                </p>
            </div>
        	<div class="responL new_res">
            	<h4>委托渠道人信息</h4>
                <p><span class="forIts2">负责人姓名：</span><input type="text" value="" class="newIts" name="EntrusterName"></p>
                <p><span class="forIts2">身份证：</span><input type="text" value="" class="newIts" name="EntrusterIDNumber"></p>
                <p><span class="forIts2">联系方式：</span><input type="text" value="" class="newIts" name="EntrusterMobile"></p>
                <p><span class="forIts2">传　真：</span><input type="text" value="" class="newIts" name=""></p>
                <p><span class="forIts2">联系地址：</span>
                	<select name="EntrusterProvinceID">
                    	<option>北京市</option>
                    	<option>北京市</option>
                    	<option>北京市</option>
                    </select>
                	<select name="EntrusterCityID">
                    	<option>北京市</option>
                    	<option>北京市</option>
                    	<option>北京市</option>
                    </select>
                	<select name="EntrusterAreaID">
                    	<option>北京市</option>
                    	<option>北京市</option>
                    	<option>北京市</option>
                    </select>
                	<input type="text" value="" class="newIts newIts2" name="EntrusterAddress">
                </p>
            </div>
        </div>
    	<h3 class="set_h3">仓储信息</h3>
        <p>是否有仓库：
            <input type="radio" name="HasWareHouse" id="warehouseyes" value="1">是
            <input type="radio" name="HasWareHouse" id="warehouseno" value="2">否</p>
        </p>
        <div class="responsible clearfix"  id="forwarehouseyes">
            <div class="responL new_res">
                <h4>仓库地址信息</h4>
                <p><span class="forIts2">仓库面积：</span><input type="text" value="" class="newIts3" name="Size">平方米</p>
                <p><span class="forIts2">仓库地址：</span>
                    <select name="WareProvinceID">
                        <option>北京市</option>
                        <option>北京市</option>
                        <option>北京市</option>
                    </select>
                    <select name="WareCityID">
                        <option>北京市</option>
                        <option>北京市</option>
                        <option>北京市</option>
                    </select>
                    <select name="WareAreaID">
                        <option>北京市</option>
                        <option>北京市</option>
                        <option>北京市</option>
                    </select>
                    <input type="text" value="" class="newIts newIts2" name="WareAddress">
                </p>
            </div>
            <div class="responL new_res">
                <h4>仓库联系人</h4>
                <p><span class="forIts2">姓名：</span><input type="text" value="" class="newIts" name="ContactName"></p>
                <p class="mar-bottom"><span class="forIts2">电话：</span><input type="text" value="" class="newIts" name="ContactMobile"></p>
            </div>
        </div>
    	<h3 class="set_h3">资源文件</h3>
        <div class="qualification clearfix">
        	<div class="quaList quaList_G">
            	<ul>
                	<li class="quaOn">负责人身份证</li>
                	<li>营业执照</li>
                	<li>组织机构代码证</li>
                	<li>税务登记证</li>
                </ul>
            </div>
			<div class="infBox hidden certificate" style="display: block;">
                <div class="inf-top">
                    <span class="forIts">企业名称：</span><input class="input-text input-per" type="text" placeholder="">
                </div>
                <div class="inf-top">
                    <span class="forIts">证件号：</span><input class="input-text input-per" type="text" placeholder="">
                </div>
                <div class="inf-top mar-bot">
                    <span class="forIts">企业地址：</span>
                    <select class="input-text-sel">
                        <option>专员a</option>
                        <option>专员a</option>
                        <option>专员a</option>
                    </select>
                    <select class="input-text-sel">
                        <option>专员a</option>
                        <option>专员a</option>
                        <option>专员a</option>
                    </select>
                    <select class="input-text-sel">
                        <option>专员a</option>
                        <option>专员a</option>
                        <option>专员a</option>
                    </select>
                    <input class="input-text input-per" type="text" placeholder="">
                </div>
            </div>
            <div class="quaImg quaImg_G clearfix">
			<!--<ul> 
				<li id="example"> 
					<div id="upload_button" style="width: 207px;text-align: center;margin-left: 318px;margin-top: 10px;   background-color: #2ACBEA;">文件上传</div>
					<p id="tip">已上传的文件列表:</p> 
					<ol class="files" name='SupportPoster'>
					{{if $t.supportDetail.SupportPoster !== ''}}
					<li>
					<img src='{{$t.domainName}}{{$t.supportDetail.SupportPoster}}' class="quaImgCnt new_img">
					<input type='hidden' name='ContactIDImage' value='{{$t.supportDetail.SupportPoster}}' id='VideoPicturePath'/><span class='delete remove' dataid=''>X</span>
					</li>
					{{else}}
					（空）
				    {{/if}}
					</ol>
				</li>
			</ul>-->
            	<img src="/images/images.jpg" class="quaImgCnt new_img">
                <div class="new_del">
                <a href="#" class="serch-btn" id="quaImg_btn">删除</a>
                <a href="#" class="serch-btn" id="quaImg_btn">上传</a>
                </div>
            </div>
            <div class="quaImg quaImg_G clearfix hidden">
            	<img src="/images/images.jpg" class="quaImgCnt new_img">
                <div class="new_del">
                <a href="#" class="serch-btn" id="quaImg_btn">删除2</a>
                <a href="#" class="serch-btn" id="quaImg_btn">上传</a>
                </div>
            </div>
            <div class="quaImg quaImg_G clearfix hidden">
            	<img src="/images/images.jpg" class="quaImgCnt new_img">
                <div class="new_del">
                <a href="#" class="serch-btn" id="quaImg_btn">删除3</a>
                <a href="#" class="serch-btn" id="quaImg_btn">上传</a>
                </div>
            </div>
            <div class="quaImg quaImg_G clearfix hidden">
            	<img src="/images/images.jpg" class="quaImgCnt new_img">
                <div class="new_del">
                <a href="#" class="serch-btn" id="quaImg_btn">删除4</a>
                <a href="#" class="serch-btn" id="quaImg_btn">上传</a>
                </div>
            </div>
        </div>
        <div class="newSave">
         <!--   <a href="#" class="serch-btn">提交</a>
            <a href="#" class="serch-btn">保存</a>-->
		<input type="submit" value="提交" class="serch-btn" />
		<input type="button" value="返回列表" class="serch-btn" onClick="window.history.go(-1);" />
        </div>
		</form>
    </div>
</div>
<script src="/style/js/jq.js"></script> 
<script src="/style/js/main.js"></script>
<script src="/style/js/common.js"></script>
<script type="text/javascript" src="/style/js/admin/ajaxupload/ajaxupload.js"></script>
<script>
$(function(){
    $('#only').click(function(){
       $("#cardtype").attr("value","2");

    })
	$('#three').click(function(){
       $("#cardtype").attr("value","1");
	 
    })
	
})
</script>
<script type="text/javascript">	
$(document).ready(function(){
    var button = $('#upload_button'), interval;
    var fileType = "all",fileNum = "one"; 
    new AjaxUpload(button,{
        action: '/api/upload.php?action=uploadimg',
        /*data:{
            'buttoninfo':button.text()
        },*/
        name: 'pic',
        onSubmit : function(file, ext){
            if(fileType == "pic")
            {
                if (ext && /^(jpg|png|jpeg|gif)$/.test(ext)){
                    this.setData({
                        'info': '文件类型为图片'
                    });
                } else {
                    $('<li></li>').appendTo('#example .files').text('非图片类型文件，请重传');
                    return false;               
                }
            }
            button.text('文件上传中');
            if(fileNum == 'one')
                this.disable();
             
            interval = window.setInterval(function(){
                var text = button.text();
                if (text.length < 14){
                    button.text(text + '.');                    
                } else {
                    button.text('文件上传中……');             
                }
            }, 200);
        },
        onComplete: function(file, response){
        	var responseObj = eval('(' + response + ')');
            if(responseObj['status'] != "success")
                alert(responseObj['reason']);
                 
            button.text('文件上传');
            window.clearInterval(interval);
            this.enable();
            if(responseObj['status'] == "success"){
            	imageName = $('#example .files').attr('name');
            	imageHtml = "<li><img src='" + responseObj['data']['path'] + "' width='100' height='100'><input type='hidden' name='"+imageName+"' value='"+responseObj['data']['path']+"'></li><span class='delete remove' dataid=''>X</span>";
            	// 此处可修正为展示多张图片
                $('#example .files').html(imageHtml);
            }
        }
    });

$('.delete').live('click',function(){
		$(this).parent().remove();
		imgHtml = $('#ShowPic').html();
	})  
  
});
</script>
</body>
</html>
