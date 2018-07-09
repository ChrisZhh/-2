using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maticsoft.Web
{
    public partial class aaaaa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetPageList();
            }
        }

        /// <summary>
        /// 绑定数据源
        /// </summary>
        public void GetPageList()
        {
           
            BLL.ArticleManagement article = new BLL.ArticleManagement();
     
            DataSet ds = article.GetListByPage("", "Uploadtime desc",( AspNetPager1.CurrentPageIndex-1)*AspNetPager1.PageSize+1,( AspNetPager1.CurrentPageIndex)*AspNetPager1.PageSize); 
            //进行分页操作
            AspNetPager1.RecordCount = article.GetRecordCount("");  //对控件进行数据绑定
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }

        /// <summary>
        /// 删除操作
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void Del(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            //得到对应的按钮
            BLL.ArticleManagement article = new BLL.ArticleManagement();
            bool a = article.Delete(id);
            if(a==true)
            {
                Repeater1.DataSource = article.GetList("");
                Repeater1.DataBind();
            }
            else
            {
                Response.Write("删除失败！");
            }
        }

        /// <summary>
        /// 分页控件发生改变的时候需要重新进行数据源的绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            GetPageList();
        }
    }
}