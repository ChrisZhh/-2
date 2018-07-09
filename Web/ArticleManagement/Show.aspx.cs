using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
namespace Maticsoft.Web.ArticleManagement
{
    public partial class Show : Page
    {        
        		public string strid=""; 
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					strid = Request.Params["id"];
					int Id=(Convert.ToInt32(strid));
					ShowInfo(Id);
				}
			}
		}
		
	private void ShowInfo(int Id)
	{
		Maticsoft.BLL.ArticleManagement bll=new Maticsoft.BLL.ArticleManagement();
		Maticsoft.Model.ArticleManagement model=bll.GetModel(Id);
		this.lblId.Text=model.Id.ToString();
		this.lblTitle.Text=model.Title;
		this.lblKeyword.Text=model.Keyword;
		this.lblContent.Text=model.Content;
		this.lblImage.Text=model.Image;
		this.lblUploadtime.Text=model.Uploadtime.ToString();

	}


    }
}
