using System;
using System.Collections.Generic;
using System.Web;
using System.IO;

namespace WebSiteForTest.Handle
{
    /// <summary>
    /// Summary description for Handler
    /// </summary>
    public class Handler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Params["flag"] == "FirstLoad" && context.Request.Params["type"] == "WinPhone")
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write(GetWindowPhoneLanguage());
                context.Response.End();
            }

            if (context.Request.Params["flag"] == "FirstLoad" && context.Request.Params["type"] == "WinPhoneDNN")
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write(GetWindowPhoneDNNLanguage());
                context.Response.End();
            }
            if (context.Request.Params["flag"] == "FirstLoad" && context.Request.Params["type"] == "WinPhone16k")
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write(GetWindowPhone16kLanguage());
                context.Response.End();
            }

            if (context.Request.Params["flag"] == "SubService" && context.Request.Params["type"] == "WinPhone")
            {
                context.Response.Write(GetWPSubService());
                context.Response.End();
            }
            if (context.Request.Params["flag"] == "SubService" && context.Request.Params["type"] == "WinPhoneDNN")
            {
                context.Response.Write(GetWPDNNSubService());
                context.Response.End();
            }
            if (context.Request.Params["flag"] == "SubService" && context.Request.Params["type"] == "WinPhone16k")
            {
                context.Response.Write(GetWP16kSubService());
                context.Response.End();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        /// <summary>
        /// Get the languages of WindowPhone
        /// </summary>
        /// <returns></returns>
        public string GetWindowPhoneLanguage()
        {
            DirectoryInfo dir = new DirectoryInfo(@"D:\TempForWeb");
            IEnumerable<FileInfo> listXML = dir.EnumerateFiles("*.xml", SearchOption.TopDirectoryOnly);
            string strLanguage = "";
            foreach (var file in listXML)
            {
                if (file.Name.Split(new string[] { "_" }, StringSplitOptions.RemoveEmptyEntries)[5] == "WinPhone")
                {
                    var languageName = file.Name.Split(new string[] { "_" }, StringSplitOptions.RemoveEmptyEntries)[1];
                    strLanguage = strLanguage + "<input type='checkbox' class='WP' name='" + languageName + "' value='" + languageName + "' />" + languageName + "<p id='WP_" + languageName + "'></p>";
                }
            }
            return strLanguage;
        }

        public string GetWindowPhoneDNNLanguage()
        {
            DirectoryInfo dir = new DirectoryInfo(@"D:\TempForWeb");
            IEnumerable<FileInfo> listXML = dir.EnumerateFiles("*.xml", SearchOption.TopDirectoryOnly);
            string strLanguage = "";
            foreach (var file in listXML)
            {
                if (file.Name.Split(new string[] { "_" }, StringSplitOptions.RemoveEmptyEntries)[5] == "WinPhoneDNN")
                {
                    var languageName = file.Name.Split(new string[] { "_" }, StringSplitOptions.RemoveEmptyEntries)[1];
                    strLanguage = strLanguage + "<input type='checkbox' class='WPDNN' name='" + languageName + "' value='" + languageName + "' />" + languageName + "<p id='WPDNN_" + languageName + "'></p>";
                }
            }
            return strLanguage;
        }

        public string GetWindowPhone16kLanguage()
        {
            DirectoryInfo dir = new DirectoryInfo(@"D:\TempForWeb");
            IEnumerable<FileInfo> listXML = dir.EnumerateFiles("*.xml", SearchOption.TopDirectoryOnly);
            string strLanguage = "";
            foreach (var file in listXML)
            {
                if (file.Name.Split(new string[] { "_" }, StringSplitOptions.RemoveEmptyEntries)[5] == "WinPhone16k")
                {
                    var languageName = file.Name.Split(new string[] { "_" }, StringSplitOptions.RemoveEmptyEntries)[1];
                    strLanguage = strLanguage + "<input type='checkbox' class='WP16k' name='" + languageName + "' value='" + languageName + "' />" + languageName + "<p id='WP16k_" + languageName + "'></p>";
                }
            }
            return strLanguage;
        }

        public string GetWP16kSubService()
        {
            string strSubService = "<input type='checkbox' name='VS' value='VS' />VS";
            return strSubService;
        }

        public string GetWPSubService()
        {
            string strSubService = "<input type='checkbox' name='SMDandVS' value='SMDandVS' />SMDandVS";
            return strSubService;
        }

        public string GetWPDNNSubService()
        {
            string strSubService = "<input type='checkbox' name='SMDandVS' value='SMDandVS' />SMDandVS";
            return strSubService;
        }
    }
}
