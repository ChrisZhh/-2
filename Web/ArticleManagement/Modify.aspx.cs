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
using Maticsoft.Common;
using LTP.Accounts.Bus;
namespace Maticsoft.Web.ArticleManagement
{
    public partial class Modify : Page
    {       

        		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.Params["id"] != null && Request.Params["id"].Trim() != "")
				{
					int Id=(Convert.ToInt32(Request.Params["id"]));
					ShowInfo(Id);
				}
			}
		}
			
	private void ShowInfo(int Id)
	{
		Maticsoft.BLL.ArticleManagement bll=new Maticsoft.BLL.ArticleManagement();
		Maticsoft.Model.ArticleManagement model=bll.GetModel(Id);
		this.lblId.Text=model.Id.ToString();
		this.txtTitle.Text=model.Title;
		this.txtKeyword.Text=model.Keyword;
		this.txtContent.Text=model.Content;
		this.txtImage.Text=model.Image;
		this.txtUploadtime.Text=model.Uploadtime.ToString();

	}

		public void btnSave_Click(object sender, EventArgs e)
		{
			
			string strErr="";
			if(this.txtTitle.Text.Trim().Length==0)
			{
				strErr+="Title不能为空！\\n";	
			}
			if(this.txtKeyword.Text.Trim().Length==0)
			{
				strErr+="Keyword不能为空！\\n";	
			}
			if(this.txtContent.Text.Trim().Length==0)
			{
				strErr+="Content不能为空！\\n";	
			}
			if(this.txtImage.Text.Trim().Length==0)
			{
				strErr+="Image不能为空！\\n";	
			}
			if(!PageValidate.IsDateTime(txtUploadtime.Text))
			{
				strErr+="Uploadtime格式错误！\\n";	
			}

			if(strErr!="")
			{
				MessageBox.Show(this,strErr);
				return;
			}
			int Id=int.Parse(this.lblId.Text);
			string Title=this.txtTitle.Text;
			string Keyword=this.txtKeyword.Text;
			string Content=this.txtContent.Text;
			string Image=this.txtImage.Text;
			DateTime Uploadtime=DateTime.Parse(this.txtUploadtime.Text);


			Maticsoft.Model.ArticleManagement model=new Maticsoft.Model.ArticleManagement();
			model.Id=Id;
			model.Title=Title;
			model.Keyword=Keyword;
			model.Content=Content;
			model.Image=Image;
			model.Uploadtime=Uploadtime;

			Maticsoft.BLL.ArticleManagement bll=new Maticsoft.BLL.ArticleManagement();
			bll.Update(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","list.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
