using ShDenetim.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.Account
{
    public partial class ParolaDegistir1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack) return;

            string _guid = Request.QueryString["id"];
            if (_guid == null && Session["Kullanici"] == null) Response.Redirect("UyeGiris.aspx");

            

            Kullanicilar v = null;
            if (_guid != null)
            {
                v = UyelikPersonelBilgi.UyeBilgiGetirFromGuid(new Guid(_guid));
            }
            else
            {
                v = UyelikPersonelBilgi.UyeBilgiGetirFromTc((string)Session["TcKimlikNo"]);
            }

            if (v == null)
            {
                Response.Redirect("UyeGiris.aspx");
                return;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool b;
            if (Session["TcKimlikNo"] != null)
            {
                string tcKimlikNo = (string)Session["TcKimlikNo"];
                b = UyelikPersonelBilgi.sifreDegistirFromTc(txtParola.Text, tcKimlikNo);
            }
            else
            {
                string _guid = Request.QueryString["id"];
                b = UyelikPersonelBilgi.sifreDegistir(txtParola.Text, _guid);
            }


            if (b)
            {
                MultiView1.ActiveViewIndex = 1;
                lblBasariliText.Text = "<strong>Parolanız Başarıyla değiştirildi.<br>Anasayfadan İlgili Uygylamayı Seçerek Giriş Yapınız</strong>";

            }
            else
            {
                MultiView1.ActiveViewIndex = 2;
                lblHataText.Text = "Hata Oluştu";
            }
        }
    }
}