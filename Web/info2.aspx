<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="info2.aspx.cs" Inherits="Maticsoft.Web.info2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style> 
        h1{
            text-align:center;
        }
        h4{    
            text-align:center;
        }
        .Adiv{           
            width:760px; 
            margin:auto;          
        }
        .time{
            float:right;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           
              <div class="Adiv"  style="overflow:visible">
            <!--可以对后台拿过来的数据进行CSS样式设计-->
           <h1><%=title%></h1>

           <h4>标签： <%=keyword%></h4> 
    <div><img src="<%=image%>" /></div>
           <div class="Ap"><%=contents%></div>   

            <div class="time"> <%=time%>
              </br>
            <a href="aaaaa.aspx">点击返回</a></div>  
        </div>
        </div>
    </form>
</body>
</html>
