using System;
using System.Web;
using Maticsoft.BLL;

namespace Maticsoft.Web
{
    public partial class management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Request["id"]==null?0:int.Parse(Request["id"]); //对id进行为空的判断
             //因为我的数据库的标识种子是1，所以不存在未0的情况
            if (!IsPostBack)
            {
                GetPage(id);
            }
        }

        public void GetPage(int id)
        {
            ArticleManagement article = new ArticleManagement();
    
            if(id>0)
            {
                string where = " id=" + id;             
                IdLab.Text = article.GetModel(id).Id.ToString();  //填充Id文本框
                txtTitle.Text = article.GetModel(id).Title;       //填充title文本框
                txtKeyword.Text = article.GetModel(id).Keyword;   //填充keyword文本框
                txtEditorContents.Text = article.GetModel(id).Content;//填充内容框

            }
        }
      

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id= HttpContext.Current.Request["id"]==null?0: int.Parse(HttpContext.Current.Request["id"]);
           
            if (id>0)  //当它大于0的时候说明文本框有数据，则是修改操作
            {
                ArticleManagement article = new ArticleManagement();
                
                //实例化一个相同Id的model用于修改数据
                Model.ArticleManagement model = new Model.ArticleManagement();               
                model.Id = id;
                model.Title = txtTitle.Text;
                model.Keyword = txtKeyword.Text;
                model.Content = txtEditorContents.Text;
                model.Image = hidImagePath.Value;
                model.Uploadtime =Convert.ToDateTime(test1.Value);
                //执行修改
              bool a=  article.Update(model);
                if(a==true)
                {
                    Response.Write("<script>alert('修改成功！');window.location.href='Article.aspx'</script>");
                }

            }
            else
            {
                ArticleManagement article = new ArticleManagement();

                //实例化一个对象用来新增操作
                Model.ArticleManagement NewModel = new Model.ArticleManagement();
                //Id是自增长不需要添加
                NewModel.Title = txtTitle.Text;
                NewModel.Keyword = txtKeyword.Text;
                NewModel.Content = txtEditorContents.Text;
                NewModel.Image = Request["hidImagePath"];
                NewModel.Uploadtime = Convert.ToDateTime(test1.Value);

               int a= article.Add(NewModel);
                if(a>0)
                {
                    Response.Write("<script>alert('添加成功！');window.location.href='Article.aspx'</script>");
                }
            }
        }
    }
}