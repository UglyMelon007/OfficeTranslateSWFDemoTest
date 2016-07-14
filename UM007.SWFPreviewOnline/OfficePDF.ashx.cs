using System;
using System.IO;
using System.Web;
using UM007.SWFPreviewOnline.Common;

namespace UM007.SWFPreviewOnline
{
    /// <summary>
    /// OfficePDF 的摘要说明
    /// </summary>
    public class OfficePDF : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "OfficeFiles");
            string[] filesPath = Directory.GetFiles(path);
            foreach (string filePath in filesPath)
            {
                string fileName = Path.GetFileNameWithoutExtension(filePath);
                string fileType = Path.GetExtension(filePath);
                string sourceFilePath = context.Request.MapPath(string.Format("OfficeFiles/{0}{1}", fileName, fileType));
                string targetFilePath = context.Request.MapPath(string.Format("PDFFiles/{0}.pdf", fileName.Trim().Replace(" ", "")));
                switch (fileType)
                {
                    case ".doc":
                    case ".docx":
                        Office2PDFHelper.DOCConvertToPDF(sourceFilePath, targetFilePath);
                        break;
                    case ".xlsx":
                        Office2PDFHelper.XLSConvertToPDF(sourceFilePath, targetFilePath);
                        break;
                    case ".ppt":
                        Office2PDFHelper.PPTConvertToPDF(sourceFilePath, targetFilePath);
                        break;
                }
            }
            context.Response.Write("Hello World");
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