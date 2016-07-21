using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.Caching;
using System.Web.Services;
using System.Web.SessionState;

namespace jqUploadify.scripts
{
    /// <summary>
    /// $codebehindclassname$ 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class upload : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Charset = "utf-8";
            try
            {
                HttpPostedFile file = context.Request.Files["Filedata"];
                string uploadPath = context.Server.MapPath("../../PDFFiles//");

                if (file != null)
                {
                    if (!Directory.Exists(uploadPath))
                    {
                        Directory.CreateDirectory(uploadPath);
                    }
                    file.SaveAs(uploadPath + file.FileName);
                    context.Response.Write(file.FileName + "\r\n" + uploadPath);
                }
            }
            catch (Exception err)
            {
                context.Response.Write(err.Message);
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
