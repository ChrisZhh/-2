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
    public partial class Add : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        		protected void btnSave_Click(object sender, EventArgs e)
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
			string Title=this.txtTitle.Text;
			string Keyword=this.txtKeyword.Text;
			string Content=this.txtContent.Text;
			string Image=this.txtImage.Text;
			DateTime Uploadtime=DateTime.Parse(this.txtUploadtime.Text);

			Maticsoft.Model.ArticleManagement model=new Maticsoft.Model.ArticleManagement();
			model.Title=Title;
			model.Keyword=Keyword;
			model.Content=Content;
			model.Image=Image;
			model.Uploadtime=Uploadtime;

			Maticsoft.BLL.ArticleManagement bll=new Maticsoft.BLL.ArticleManagement();
			bll.Add(model);
			Maticsoft.Common.MessageBox.ShowAndRedirect(this,"保存成功！","add.aspx");

		}


        public void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("list.aspx");
        }
    }
}
