using ShDenetim.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.Account
{
    public partial class Giris1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            DenetimDbContext dc = new DenetimDbContext();

            var v = dc.Kullanicilars.Where(c => c.KullaniciID == TextBox1.Text && c.Parola == TextBox2.Text).FirstOrDefault();
            if (v != null)
            {
                Session["Kullanici"] = v;
                FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, false);
            }

        }


        protected void lnkSifremiUnuttum_Click(object sender, EventArgs e)
        {
            Response.Redirect("ParolaIstem.aspx");
        }
    }
}