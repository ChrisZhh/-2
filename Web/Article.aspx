<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="Maticsoft.Web.Article" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="src/jquery-1.7.1.js"></script>
    <style>
        #gvlist{
            text-align:center;

        }
    </style>
    <script>
        $(function () {
 $(".delete-link").parent().parent().mouseover(function () {
                 $(this).css("backgroundColor", "lightblue");
             }).mouseout(function () {
                 $(this).css("backgroundColor", "");
            });
        })
    

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="overflow:auto">
            <asp:GridView ID="gvlist" runat="server" Width="100%"  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowUpdating="gvlist_RowUpdating" DataKeyNames="Id" OnRowDeleting="gvlist_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="文章编号" />
                    <asp:BoundField DataField="Title" HeaderText="标题" />
                    <asp:BoundField DataField="Keyword" HeaderText="关键词" />
                    <asp:BoundField DataField="Uploadtime" HeaderText="上传时间" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                             <a href='management.aspx?id=<%# Eval("id")  %>'>编辑</a>                          
                            &nbsp; &nbsp; 
                            <asp:LinkButton ID="LinkButton2" CssClass="delete-link" runat="server" CausesValidation="false" CommandName="delete" OnClientClick="return confirm('确要删除吗?')" Text="删除"></asp:LinkButton>
                            &nbsp; &nbsp; 
                            <a href='info.aspx?id=<%# Eval("id")  %>'>预览页面</a>    
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="新增页面" />
        </div>
    </form>
</body>
</html>
