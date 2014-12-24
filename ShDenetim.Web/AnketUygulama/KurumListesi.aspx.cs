using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.AnketUygulama
{
    public partial class KurumListesi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton4_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse("KurumListesi");
        }
    }
}