using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.AnketUygulama
{
    public partial class Pivot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                 ASPxPivotGrid1.DataBind();
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
          
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
          
        }

        protected void lnkExcel_Click(object sender, EventArgs e)
        {
                ASPxPivotGridExporter1.ExportXlsToResponse("pivotdata", true);
        }
    }
}