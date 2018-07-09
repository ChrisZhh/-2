using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Maticsoft.Web
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            HttpPostedFile postFile =HttpContext.Current.Request.Files["a"];
            if (postFile == null)
            {
                context.Response.Write("no:请选择上传的文件");
            }
            else
            {
                string filename = Path.GetFileName(postFile.FileName);//得到文件名称
                string fileExt = Path.GetExtension(filename); //获取文件的扩展名
                if (fileExt == ".jpg" || fileExt == ".txt" || fileExt == ".png")
                {
                    string dir = "/ImagePath/" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/" + DateTime.Now.Day + "/";
                    //根据时间来创建文件夹的分类
                    Directory.CreateDirectory(Path.GetDirectoryName(HttpContext.Current.Request.MapPath(dir)));//如果目录存在就进行操作，如果不存在就进行创建
                    string newfilename = Guid.NewGuid().ToString(); //新的文件名称
                    string fullDir = dir + newfilename + fileExt;//完整的路径；
                    postFile.SaveAs(HttpContext.Current. Request.MapPath(fullDir)); //保存文件；
                    context.Response.Write("OK:" + fullDir);
                }
                else
                {
                    context.Response.Write("no:文件格式错误！");
                }

            }
        }

       


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}