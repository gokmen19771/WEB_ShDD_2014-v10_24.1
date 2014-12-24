using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using ShDenetim.Web.Models;
using ShDenetim.Web.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.AnketUygulama
{
    public partial class Formlar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ckys = int.Parse(Request.QueryString["kurumCkys"]);
            string formtipi = Request.QueryString["FormTipi"];


            if (Session["dc"] == null)
                Session["dc"] =new DenetimDbContext();

            DenetimDbContext dc = (DenetimDbContext)Session["dc"];
            ASPxGridView1.DataSource = dc.KURUM_HASTAs.Where(c => c.FormAdi == formtipi && c.KurumCkys == ckys).ToList();


            if (!IsPostBack && !IsCallback)
            {
               
                ASPxGridView1.DataBind(); 
            }

            ASPxGridView1.DataBind(); // kontrol et






      
        }

        protected void sil(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            DenetimDbContext dc = (DenetimDbContext)Session["dc"];
           
            int no = (int)e.Keys["Id"];

            var v = dc.KURUM_HASTAs.Where(c => c.Id == no).Single();
         

            dc.KURUM_HASTAs.Remove(v);
            dc.SaveChanges();

            e.Cancel = true;

           

          
        }

     

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            DenetimDbContext dc = (DenetimDbContext)Session["dc"];
            ASPxGridView gridView = (ASPxGridView)sender;

            int no = (int)e.Keys["Id"];

            var v = dc.KURUM_HASTAs.Where(c => c.Id == no).Single();

          

            ASPxComboBox combo1 = ASPxGridView1.FindEditFormTemplateControl("ASPxComboBox1") as ASPxComboBox;
            e.NewValues["FormAdi"] = combo1.Value.ToString();


            IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
            enumerator.Reset();
            while (enumerator.MoveNext())
                 NesneIslemleri.NesneOzellikDegerAta(v,enumerator.Key.ToString(),enumerator.Value);

            dc.SaveChanges();

            gridView.DataBind();
            gridView.CancelEdit();
            e.Cancel = true;

        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["KurumCkys"] = "108";
            e.NewValues["FormAdi"] = Request.QueryString["FormTipi"];
            e.NewValues["KurumCkys"] = int.Parse(Request.QueryString["kurumCkys"]);
            
            DenetimDbContext dc = (DenetimDbContext)Session["dc"];
            ASPxGridView gridView = (ASPxGridView)sender;

            KURUM_HASTA v = new KURUM_HASTA();

            IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
            enumerator.Reset();
            while (enumerator.MoveNext())
                NesneIslemleri.NesneOzellikDegerAta(v, enumerator.Key.ToString(), enumerator.Value);

            dc.KURUM_HASTAs.Add(v);
            dc.SaveChanges();

        
            gridView.DataBind();
            gridView.CancelEdit();
            e.Cancel = true;

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxButton btn = sender as ASPxButton;
            var v= ASPxGridView.GetDetailRowKeyValue(btn);
        
           

        }

        protected void ASPxGridView1_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {



            //(e.Row.Cells[7].Controls[0] as WebControl).Attributes["disabled"] = "false";
        }

        protected void ASPxGridView1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            //if (e.ButtonType == DevExpress.Web.ASPxGridView.ColumnCommandButtonType.Edit)
            //    e.Visible = false;


        }

        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Load(object sender, EventArgs e)
        {
            ASPxButton btn = sender as ASPxButton;
            btn.Attributes["disabled"] = "true";
            GridViewDataItemTemplateContainer container = btn.NamingContainer as GridViewDataItemTemplateContainer;
            
         
            
            if (!container.Grid.IsNewRowEditing)
                btn.Text = DataBinder.Eval(container.DataItem, "Id").ToString();




        }

        protected void ASPxGridView1_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if ((e.RowType == GridViewRowType.EditForm))
            {
                ASPxComboBox combo1 = ASPxGridView1.FindEditFormTemplateControl("ASPxComboBox1") as ASPxComboBox;

                combo1.Items.Add("bt");
                combo1.Items.Add("mr");

                
            }

        }

        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            

            //combo1.ValueField = "FormAdi";
            
        }
    }
}