<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mm.aspx.cs" Inherits="Maticsoft.Web.mm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   
    <link href="src/tableStyle.css" rel="stylesheet" />
    <link href="src/validatform.css" rel="stylesheet" />
    <script src="src/jquery-1.7.1.js"></script>
    <script src="src/jquery.unobtrusive-ajax.min.js"></script>
    <script src="src/MyAjaxForm.js"></script>
    <%--//引用文件--%>
    <script src="src/JSJS.js"></script>
    <script src="laydate/laydate.js"></script>  
    <script src="utf8-net/ueditor.config.js"></script>
    <script src="utf8-net/ueditor.all.min.js"></script>
    <script src="utf8-net/lang/zh-cn/zh-cn.js"></script>
    <style>       
        .right{
            width:30%;
            text-align:right;
        }
         .demo-input{
             padding-left: 10px;
             height: 38px; 
             min-width: 262px;
             line-height: 38px;
             border: 1px solid #e6e6e6;
             background-color: #fff;
             border-radius: 2px;

         }

    </style>

    <!--时间控件-->
   
</head>
<body>
    <form class="form1" runat="server" >
        <div class="Adiv" style="overflow:auto" >
            <table style="width:100%">
                <tr>
                   <td class="right">文章编号</td>
                    <td>
                        <asp:Label ID="IdLab" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                   <td class="right">文章题目</td>
                    <td>
                        <asp:TextBox datatype="*" ID="txtTitle" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                   <td class="right">关键词</td>
                    <td>
                        <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                   <td class="right">内容</td>
                    <td>
                        <asp:TextBox ID="txtEditorContents" name="txtEditorContents" datatype="*" runat="server" TextMode="MultiLine" Height="400px" Width="1000px" > </asp:TextBox>
                    </td>
                </tr>
                <tr>
                   <td class="right">图片</td>
                    <td> <input type="file" name="a" id="filepic" />
                                    <input type="button" value="上传" id="upbtn" />
                                    <input type="hidden" id="hidImagePath" name="ImagePath" runat="server" />
                                    <div id="showImage"></div>
                    </td>
                </tr>
                <tr>
                   <td class="right">上传时间</td>
                    <td><input type="text" datatype="*" runat="server" class="demo-input" autocomplete="off"   placeholder="请选择日期" id="test1" />
                    </td>
                </tr>
                <tr>
                   <td class="right"></td>
                    <td>&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" />
                    </td>
                </tr>

            </table>
        </div>
    </form>
   
    <script>
        <!--上传图片缩略图-->
        $(function () {           
             $("#upbtn").click(function () { 
                var getpic = $("#filepic").val();
                //对file按钮进行判断，非空的时候回调函数将图片地址反馈回来，加载到div里面
                if (getpic == "") {
                    alert("请选择上传文件");
                    return;
                } else {                  
                    $(".form1").ajaxSubmit({                       
                        type:"post",
                        url: "Handler1.ashx",                      
                        success: function (data) {
                            var sdata = data.split(':');
                            if (sdata[0] == "OK") {
                                $("#hidImagePath").val(sdata[1]);//将路径赋给隐藏域
                               
                                $("#showImage").append("<img src='" + sdata[1] + "' width='100px'/>");//显示图片
                            } else {
                                alert(data);
                            }
                        }
                    })
                }
            })
        });
   </script>

    <script>
         $(".form1").Validform({  
            tiptype: 3   //控制信息输出的位置  tiptype:2  表现是鼠标焦点锁定没有填值的框，tiptype：3  在文本框之后显示提示信息
                         //tiptype：1 提示信息在左下角  tiptype：4 选中为填值的框，并提示信息
        });
       
    </script>

    <script type="text/javascript">

        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('txtEditorContents');
        

        function isFocus(e) {
            alert(UE.getEditor('editor').isFocus());
            UE.dom.domUtils.preventDefault(e)
        }
        function setblur(e) {
            UE.getEditor('editor').blur();
            UE.dom.domUtils.preventDefault(e)
        }
        function insertHtml() {
            var value = prompt('插入html代码', '');
            UE.getEditor('editor').execCommand('insertHtml', value)
        }
        function createEditor() {
            enableBtn();
            UE.getEditor('editor');
        }
        function getAllHtml() {
            alert(UE.getEditor('editor').getAllHtml())
        }
        function getContent() {
            var arr = [];
            arr.push("使用editor.getContent()方法可以获得编辑器的内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getContent());
            alert(arr.join("\n"));
        }
        function getPlainTxt() {
            var arr = [];
            arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getPlainTxt());
            alert(arr.join('\n'))
        }
        function setContent(isAppendTo) {
            var arr = [];
            arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
            UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
            alert(arr.join("\n"));
        }
        function setDisabled() {
            UE.getEditor('editor').setDisabled('fullscreen');
            disableBtn("enable");
        }

        function setEnabled() {
            UE.getEditor('editor').setEnabled();
            enableBtn();
        }

        function getText() {
            //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
            var range = UE.getEditor('editor').selection.getRange();
            range.select();
            var txt = UE.getEditor('editor').selection.getText();
            alert(txt)
        }

        function getContentTxt() {
            var arr = [];
            arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
            arr.push("编辑器的纯文本内容为：");
            arr.push(UE.getEditor('editor').getContentTxt());
            alert(arr.join("\n"));
        }
        function hasContent() {
            var arr = [];
            arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
            arr.push("判断结果为：");
            arr.push(UE.getEditor('editor').hasContents());
            alert(arr.join("\n"));
        }
        function setFocus() {
            UE.getEditor('editor').focus();
        }
        function deleteEditor() {
            disableBtn();
            UE.getEditor('editor').destroy();
        }
        function disableBtn(str) {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                if (btn.id == str) {
                    UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                } else {
                    btn.setAttribute("disabled", "true");
                }
            }
        }
        function enableBtn() {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            }
        }

        function getLocalData() {
            alert(UE.getEditor('editor').execCommand("getlocaldata"));
        }

        function clearLocalData() {
            UE.getEditor('editor').execCommand("clearlocaldata");
            alert("已清空草稿箱")
        }
</script>
    
    <!--引用文件可以放在头部，执行文件需要放在最下面-->
    <!--把JS执行文件放在底部，可以在页面加载完成之后 在加载JS文件，避免了一些加载失败的可能性存在-->
     <script>
     //执行文件
         //执行一个laydate实例
          laydate.render({
             elem: '#test1'
             ,type: 'datetime'
           });
    </script>
</body>
    
</html>
