<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Maticsoft.Web.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="themes/default/easyui.css" rel="stylesheet" />
    <link href="themes/icon.css" rel="stylesheet" />
    <script src="src/jquery.min.js"></script>
    <script src="src/jquery.easyui.min.js"></script>

    <style type="text/css">
     body{
         font-family:'Microsoft YaHei'
     }
        .north{
            background-color:red;
            height:110px;
            padding:15px;
            background:url(Images/a.png) no-repeat ;
            overflow:hidden;
        }
        p{
            font-size:40px;
            
            margin-left:140px;
            margin-top:50px;
           
        }
    </style>


    <script type="text/javascript">

        //切换内容页的页签，当页签存在和不存在的不同情况下的分开讨论
        $(function () {
            binClickEvent();
        });
        function binClickEvent() {
            //绑定超链接的单击事件
            $(".a").click(function () {
                var title = $(this).text();
                var url = $(this).attr("url");
                var isExt = $('#tt').tabs('exists', title);//判断页签是否存在
                if (isExt) {
                    $('#tt').tabs('select', title);
                    return;
                }

                $('#tt').tabs('add', {
                    title: title,
                    content: showContent(url),
                    closable: true
                });

            });
        }
        //页签中显示的内容
        function showContent(url) {
            var strHtml = '<iframe src="' + url + '" scrolling="no" width="100%" height="100%" frameborder="0" ></iframe>';
            return strHtml;
        }
        
    </script>
    <script>
        $("#course_content").load(function () {
            var iframeHeight = $(this).contents().find("body").height();
            $(this).height(iframeHeight);
        });

      
    </script>

</head>
<body class="easyui-layout" id="a">

    <!--顶部-->
	<div data-options="region:'north',border:false" class="north" ><p>欢迎您的到来</p></div>

    <!--菜单部分-->
	<div data-options="region:'west',split:true,title:'菜单栏'" style="width:300px;overflow:hidden;height:auto;"  >
         <div class="easyui-accordion" style="width:auto;height:auto;" >
		      <div title="文章操作" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
			     <a href="javascript:void(0)" class="a" url="Article.aspx" >文章管理gv版</a>
		      </div>
		      <div title="会员中心" data-options="iconCls:'icon-help'" style="padding:10px;">
			     <a href="javascript:void(0)" class="a" url="aaaaa.aspx">文章管理repedater版</a>
		       </div>
	          </div>
    </div>
	
    <!--底部-->
	<div data-options="region:'south',border:false" style=" height:70px;padding:10px;text-align:center;font-size:20px;overflow:hidden">Copyright©XXXX</div>
	
    
    <!--中间内容部分-->
    <div data-options="region:'center',title:'内容'"   >
        <div class="easyui-tabs" style="width:auto;"  fit="true" id="tt"  >
		<div title="文章管理gv版" style="padding:10px;">
			 <iframe id="course_content"  width="100%" height="100%" frameborder="0" style="overflow:visible" src="Article.aspx"></iframe>
		</div>	
        <div title="文章管理repedater版" style="padding:10px;">
			 <iframe id="course_content"  width="100%" height="100%" frameborder="0" style="overflow:visible" src="aaaaa.aspx"></iframe>
		</div>	
	</div>
	</div>

</body>
</html>
