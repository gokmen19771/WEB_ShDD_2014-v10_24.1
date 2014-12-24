using ShDenetim.Web.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.Account
{
    public partial class ParolaIstem1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["islem"] == "ilkParola")
            {
                lblParolaBaslik.Text = "İlk Parola İstemi";
            }
            else
            {
                lblParolaBaslik.Text = "Şifremi Unuttum";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var v = UyelikPersonelBilgi.UyeBilgiGetirFromAktifMail(txtMailAdresi.Text);

            if (v == null)
            {
                MultiView1.ActiveViewIndex = 2;
                lblHataText.Text = "Bu mail adresi ile ilgili kayıt bulunamadı";
                return;
            }

            string mail = v.Mail;
            string kimlik_guid = v.Kimlik.ToString();

            string unuttumIcerik = "Sayın " + v.KullaniciAdSoyad;

            string strPathAndQuery = HttpContext.Current.Request.Url.PathAndQuery;
            string strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "");


            unuttumIcerik += "\r\nParola değişikliği için linke tıklayınız. " + strUrl + "/Account/ParolaDegistir.aspx?id=" + kimlik_guid;


            try
            {
                MailGonder.mailgonder(mail, "Parola İstemi", unuttumIcerik);
                MultiView1.ActiveViewIndex = 1;
                lblBasariliText.Text = "Mail adresinize parola ile ilgili link gönderilmiştir.";
            }
            catch (Exception ex)
            {
                MultiView1.ActiveViewIndex = 2;
                lblHataText.Text = "Mail gönderme işlemi sırasında hata oluştu. Daha sonra tekrar deneyiniz.";
            }
        }
    }
}