<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aaaaa.aspx.cs" Inherits="Maticsoft.Web.aaaaa" %>

<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
       table
        {
           width:1200px;
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }
        table td, table th
        {
            border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
        }
        table thead th
        {
            background-color: #CCE8EB;
            width: 100px;
        }
        table tr:nth-child(odd)
        {
            background: #fff;
        }
        table tr:nth-child(even)
        {
            background: #F5FAFA;
        }

        .page-warp{ margin:35px auto 30px;text-align: center;overflow:hidden; clear:both;}
.page-warp a,.page-warp span{display:inline-block; margin-left:5px; height:24px; color: #333;line-height:24px; padding:0 10px; border: 1px solid #e7e7e7; font-size:14px;}
.page-warp span.current{background:#00aaf9;border-color: #00aaf9; color:#fff;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr><th>标题</th><th>关键词</th><th>上传时间</th><th>操作</th></tr>          
            <asp:Repeater ID="Repeater1" runat="server" >
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("Title") %></td>
                        <td><%#Eval("Keyword") %></td>
                        <td><%#Eval("Uploadtime") %></td>
                        <td><a href="mm.aspx?id=<%#Eval("Id")%>">编辑</a>

                         <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("id") %>'  OnClientClick="return confirm('是否删除')"  OnClick="Del" >删除</asp:LinkButton>

                        <a href="info2.aspx?id=<%#Eval("Id")%>">预览界面</a></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
                    
               
                    
                </table>
            <div class="page-warp">
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server"  CurrentPageButtonClass="current" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页" ShowCustomInfoSection="Left" SubmitButtonText="Go" TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到" OnPageChanged="AspNetPager1_PageChanged">
            </webdiyer:AspNetPager>
            </div>


        </div>
    </form>
</body>
</html>
