using DevExpress.Web.ASPxGridView;
using ShDenetim.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.AnketUygulama
{
    public partial class HastaBilgi : System.Web.UI.Page
    {
       

        public Kullanicilar Kullanici
        {
            get
            {
                //DenetimDbContext dc1 = new DenetimDbContext();
                //Kullanicilar kul = dc1.Kullanicilars.Where(c => c.KullaniciID == @"makbulerdem@gmail.com").FirstOrDefault();
                //Kullanicilar kul = dc1.Kullanicilars.Where(c => c.KullaniciID == @"necati").FirstOrDefault();
                Kullanicilar kul = (Kullanicilar)Session["Kullanici"];

                return kul;

             

            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DenetimDbContext dc = new DenetimDbContext();

            bool b = Kullanici.KullaniciRol != "Daire" || Kullanici.KullaniciRol != "IsmKoordinatör" || Kullanici.KullaniciRol != "IsmYonetici";

            if (b==false) return;


            hiddenAnketor.Value = "tumu";
            hiddenIlPlaka.Value = "0";
          

            if (Kullanici.KullaniciRol == "IsmYonetici")
            {
                hiddenIlPlaka.Value = Kullanici.IlKod.Value.ToString();
                hiddenAnketor.Value = "tumu";

            }
            else if (Kullanici.KullaniciRol=="IsmKoordinatör")
            {
                hiddenAnketor.Value = Kullanici.KullaniciID;
               
                hiddenIlPlaka.Value = "0";

                ((DevExpress.Web.ASPxGridView.GridViewCommandColumn)(ASPxGridView1.Columns[0])).CustomButtons.Column.DeleteButton.Visible = false;

              
               
            }

            else if (Kullanici.KullaniciRol == "Daire")
            {
                hiddenAnketor.Value = "tumu";
            }
           





            if (!this.IsPostBack)
            {
                hiddenAnketor.Value = Kullanici.KullaniciID;
                Kullanici.AktifFormlar = "Seçiniz;" + Kullanici.AktifFormlar;
                String[] formListeleri =Kullanici.AktifFormlar.Split(';');

                if (Kullanici.AktifFormlar == "Tümü" || Kullanici.KullaniciRol == "Daire")
                {
                    formListeleri = dc.FORM_TANIMs.
                        Select(c => c.FormAd).ToArray();

                    hiddenAnketor.Value = "tumu";
                }
                DropDownList1.DataSource = formListeleri;
                DropDownList1.DataBind();
            }

            List<GridViewColumn> soruKolonları = new List<GridViewColumn>();

            foreach (GridViewColumn item in ASPxGridView1.Columns)
            {
                item.Visible = false;

                var data_col = item as GridViewDataTextColumn;
                if (data_col == null) continue;
                bool soruSutunMu = data_col.FieldName.Length <= 4 && data_col.FieldName.StartsWith("S");
                soruKolonları.Add(item);


            }

            List<FORM_SORU> sorular = dc.FORM_SORUs.Where(c => c.FormAdi == DropDownList1.SelectedValue).ToList();


            foreach (var item in sorular)
            {
                var x = soruKolonları.Where(c => (c as GridViewDataTextColumn).FieldName == item.SoruKod).SingleOrDefault();
                if (x != null)
                {
                    x.Visible = true;
                }

            }

            ASPxGridView1.Columns["Denetleyici1"].Visible = true;
            ASPxGridView1.Columns["KayıtTar_Denetleyici1"].Visible = true;


            ASPxGridView1.Columns["KayıtTar_Denetleyici2"].Visible = true;

            ASPxGridView1.Columns["Rol"].Visible = true;
            ASPxGridView1.Columns["İl"].Visible = true;
            ASPxGridView1.Columns["İlçe"].Visible = true;
            ASPxGridView1.Columns["KurumTur"].Visible = true;
            ASPxGridView1.Columns["SaglikBolgesi"].Visible = true;
            ASPxGridView1.Columns["SoruAçıklamaBirleşik"].Visible = true;
            ASPxGridView1.Columns["Kurum"].Visible = true;
            ASPxGridView1.Columns["KayitTar1"].Visible = true;

            ASPxGridView1.Columns[0].Visible = true;


        }

        protected void Button1_Click(object sender, EventArgs e)
        {




        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse("TümVeri");
        }

        protected void ASPxButton3_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse("TümVeri");

           
        }

        protected void ASPxGridView1_HtmlCommandCellPrepared(object sender, ASPxGridViewTableCommandCellEventArgs e)
        {
           

          
        }
    }
}