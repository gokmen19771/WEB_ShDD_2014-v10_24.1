using DevExpress.Web.ASPxCallbackPanel;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridLookup;
using ShDenetim.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack || !Page.IsCallback)
            {
                DenetimDbContext dc = new DenetimDbContext();

                ASPxGridView1.DataSource = dc.FORM_YATAYDATAs.Take(10).ToList();
                ASPxGridView1.DataBind();
            }
          

        }

        protected void LinqServerModeDataSource1_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
        {
            e.KeyExpression = "Id";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Yukle(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxCallbackPanel cp = (ASPxCallbackPanel)sender;
            ASPxGridLookup lookup = (ASPxGridLookup)cp.FindControl("ASPxGridLookup1");

            Session["filter"]= lookup.GridView.FilterExpression;

         
        }

        protected void ASPxGridLookup1_Init(object sender, EventArgs e)
        {
            ASPxGridLookup lookup = (ASPxGridLookup)sender;

            DenetimDbContext dc = new DenetimDbContext();
            lookup.DataSource = dc.Kullanicilars.ToList();

            if ( Session["filter"]!=null)
            {
                lookup.GridView.FilterExpression = (string)Session["filter"];
            }
            
            lookup.DataBind();



        }

       
   

     
    }
}