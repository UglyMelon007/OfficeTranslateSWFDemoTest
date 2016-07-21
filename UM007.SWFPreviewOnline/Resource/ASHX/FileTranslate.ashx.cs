using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using UM007.SWFPreviewOnline.Common;

namespace UM007.SWFPreviewOnline
{
    /// <summary>
    /// FileTranslate 的摘要说明
    /// </summary>
    public class FileTranslate : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            try
            {
                string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "PDFFiles");
                string[] filesPath = Directory.GetFiles(path);
                foreach (string filePath in filesPath)
                {
                    string fileName = Path.GetFileNameWithoutExtension(filePath);
                    PSD2swfHelper.PDF2SWF(string.Format("../../PDFFiles/{0}.pdf", fileName),
                        string.Format("../../SWFFiles/{0}.swf", fileName.Trim().Replace(" ", "")));
                }
                context.Response.Write("转换成功");
            }
            catch (Exception err)
            {
                context.Response.Write("转换失败：" + err.InnerException + "\r\n" + err.Message);
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