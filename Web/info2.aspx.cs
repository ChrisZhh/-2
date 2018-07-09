using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maticsoft.Web
{
    public partial class info2 : System.Web.UI.Page
    {
        public string title = string.Empty;
        public string contents = string.Empty;
        public string keyword = string.Empty;
        public string time = string.Empty;
        public string image = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Request["id"] == null ? 0 : int.Parse(Request["id"]);
            BLL.ArticleManagement article = new BLL.ArticleManagement();
            

            Model.ArticleManagement model = new Model.ArticleManagement();
            model= article.GetModel(id);

            title = model.Title;
            keyword = model.Keyword;
            contents = model.Content;
            image = model.Image;
            time = Convert.ToDateTime(model.Uploadtime).ToString("yyyy-mm-dd");
        }
    }
}