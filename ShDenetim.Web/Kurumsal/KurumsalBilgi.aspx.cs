using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.Kurumsal
{
    public partial class KurumsalBilgi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Controls.Clear();
            //Panel1.Controls.Add(LoadControl("~/Kurumsal/Baskan.ascx"));
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Panel1.Controls.Clear();
            Panel1.Controls.Add(LoadControl("~/Kurumsal/Baskan.ascx"));

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Panel1.Controls.Clear();
            Panel1.Controls.Add(LoadControl("~/Kurumsal/AnaSurecSorumlulari.ascx"));
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Panel1.Controls.Clear();
            Panel1.Controls.Add(LoadControl("~/Kurumsal/DaireninGorevleri.ascx"));
        }
    }
}