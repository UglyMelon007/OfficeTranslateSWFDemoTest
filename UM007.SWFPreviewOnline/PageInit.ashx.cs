using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;

namespace UM007.SWFPreviewOnline
{
    /// <summary>
    /// PageInit 的摘要说明
    /// </summary>
    public class PageInit : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string fileNames = GetFileNames();
            context.Response.Write(fileNames);
        }

        private string GetFileNames()
        {
            string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "SWFFiles");
            string[] strFilesPath = Directory.GetFiles(path);
            List<string> lstFileNames = new List<string>();
            foreach (string strFilePath in strFilesPath)
            {
                lstFileNames.Add(Path.GetFileNameWithoutExtension(strFilePath));
            }
            string[] fileNames = new string[lstFileNames.Count];
            for (int i = 0; i < fileNames.Length; i++)
            {
                fileNames[i] = lstFileNames[i];
            }
            string strfileNames = string.Join(",", fileNames);
            return strfileNames;
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