using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;



public partial class Controls_Contact : System.Web.UI.UserControl
{

    private SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MyCompany"].ConnectionString);
    MyCompany.Rules.SharedBusinessRules ad = new MyCompany.Rules.SharedBusinessRules();
    static string InstituteName;
    static bool IsPrimary;
    static bool HasPrimarySite;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Page.User.Identity.IsAuthenticated)//
            {

                Response.Redirect("~/Pages/Home.aspx");
                return;
            }
            if (!string.IsNullOrEmpty(ad.IsPrimary.ToString()))
            {
                IsPrimary = Convert.ToBoolean(ad.IsPrimary.ToString());
            }
            if (!string.IsNullOrEmpty(ad.InstituteName.ToString()))
            {
                InstituteName = ad.InstituteName.ToString();
            }
            FooterInfo();
            SiteMenu();
            ImportentLink();

            Page.Title = "যোগাযোগ - " + InstituteName;
        }

    }
   
    public void SendEmail(string to, string subject, string body)
    {
        if (to != "" && to != null)
        {
            string smtp_user = System.Configuration.ConfigurationSettings.AppSettings["SMTP_USER"];
            string smtp_pass = System.Configuration.ConfigurationSettings.AppSettings["SMTP_PASSWORD"];
            string smtp_host = System.Configuration.ConfigurationSettings.AppSettings["SMTP_HOST"];
            string smtp_port = System.Configuration.ConfigurationSettings.AppSettings["SMTP_PORT"];
            string mail_from = System.Configuration.ConfigurationSettings.AppSettings["MAIL_FROM"];



            MailMessage mailMsg = new MailMessage();
            mailMsg.From = new MailAddress(mail_from);
            mailMsg.To.Add(to);
            mailMsg.Subject = subject;
            mailMsg.IsBodyHtml = true;
            mailMsg.BodyEncoding = Encoding.UTF8;
            mailMsg.Body = body;
            mailMsg.Priority = MailPriority.Normal;
            SmtpClient client = new SmtpClient();
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential(smtp_user, smtp_pass);
            client.Port = Convert.ToInt32(smtp_port); //587; //or use 465            
            client.Host = smtp_host;
            client.EnableSsl = true;
            client.Send(mailMsg);
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        string Name;
        string Subject;
        string ToEmail;
        string msg;
        string SenderEmail;

        ToEmail = "stamfordcollege1995@yahoo.com";
        
        Name = senderName.Text;
        Subject = senderSubject.Text;
        SenderEmail = senderEmail.Text;
        msg = senderBody.Text;


        if (!string.IsNullOrEmpty(ToEmail))
        {


            string emailinfo = "Hi I am " + Name +".";

            string body1 = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/HTML/User_Feedback_Form.html")))
            {
                body1 = reader.ReadToEnd();
            }
            body1 = body1.Replace("{SenderName}", Name);
            body1 = body1.Replace("{SenderSubject}", Subject);
            body1 = body1.Replace("{SenderEmail}", SenderEmail);
            body1 = body1.Replace("{Message}", msg);
            //body1 = body1.Replace("{Title}", title);
            //body1 = body1.Replace("{Url}", url);
            //body1 = body1.Replace("{Description}", description);
            //return body1;

            try
            {
                SendEmail(ToEmail, Subject, body1);
                PopUp("Successfully send.");
            }
            catch
            {
                PopUp("Error Sending feedback form.");
            }
            //objClsCommon.SendEmail(Email, "Error", "Dear Sir,Your UserID : " + StudentCode + "  and Password : " + Password, "himu410@gmail.com");    
        }
    }
}
