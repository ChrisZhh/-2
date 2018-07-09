<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Maticsoft.Web.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <th>
                         编号   
                     </th>
                    <th>
                         标题   
                    </th>
                    <th>
                         上传时间   
                    </th>
                    <th>
                         关键词   
                    </th>
                    <th>
                         操作   
                     </th>
                </tr>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                   <tr>
                        <td>
                         <%#Eval("Id")%>   
                        </td>
                    <td>
                         <%#Eval("Title")%> 

                        </td>
                    <td>
                         <%#Eval("Uploadtime")%> 
                        </td>
                    <td>
                         <%#Eval("Keyword")%> 
                        </td>
                    <td>
                         <%#Eval("Id")%> 
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArticleConnectionString %>" SelectCommand="SELECT [Id], [Title], [Keyword], [Uploadtime] FROM [ArticleManagement]"></asp:SqlDataSource>
        </table></div>
    </form>
</body>
</html>
