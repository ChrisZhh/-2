using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Maticsoft.BLL;

namespace Maticsoft.Web
{
    public partial class Article : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetList();
            }
        }

        /// <summary>
        /// 绑定数据源
        /// </summary>
        public void GetList()
        {
            ArticleManagement article = new ArticleManagement();
            DataSet ds=  article.GetAllList();
            gvlist.DataSource = ds;
            gvlist.DataBind();
        }

        protected void gvlist_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        /// <summary>
        /// 删除事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvlist_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(gvlist.DataKeys[e.RowIndex].Value.ToString());

            ArticleManagement article = new ArticleManagement();
            article.Delete(id);
            GetList();
        }

        /// <summary>
        /// 新增文章按钮，传输ID固定为0
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("management.aspx?id=0");
        }
    }
}