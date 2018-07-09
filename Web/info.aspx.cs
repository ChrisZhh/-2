using System;

namespace Maticsoft.Web
{
    public partial class info : System.Web.UI.Page
    {
        //通过这样的方式，避免respons.write的方式，同时传到前台的数据还可以进行样式的设计
        public string Content = string.Empty;
        public string title = string.Empty;
        public string Keyword = string.Empty;
        public string Time=string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Request["id"] == null ? 0 : int.Parse(Request["id"]);

            BLL.ArticleManagement management = new BLL.ArticleManagement();

            Model.ArticleManagement model;
            model = management.GetModel(id);
            Content = model.Content;
            title = model.Title;
            Keyword = model.Keyword;
            DateTime? time = model.Uploadtime;    //因为数据库中有可能时间为空，所以用 datetiem?类型
            Time=  Convert.ToDateTime(time).ToString("yyyy-MM-dd");  //转化成约定的时间格式


            //Response.Write(model.Content);  避免respons.write的方式，因为它不可控制
            //DataSet ds = management.GetList(" id="+id.ToString());
            //Response.Write(ds.Tables[0].Rows[0][3]);
        }
        
        
    }
}