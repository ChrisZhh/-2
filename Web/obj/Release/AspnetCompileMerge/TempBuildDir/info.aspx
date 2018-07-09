<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="Maticsoft.Web.info" %>

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
    <form id="form1" runat="server" >
        <div class="Adiv"  style="overflow:visible">
            <!--可以对后台拿过来的数据进行CSS样式设计-->
           <h1><%=title%></h1>

           <h4>标签： <%=Keyword %></h4> 

           <div class="Ap"><%=Content %></div>   

            <div class="time"><%=Time %>
              </br>
            <a href="Article.aspx">点击返回</a></div>  
        </div>
    </form>
</body>
</html>
