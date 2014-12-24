using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using ShDenetim.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace ShDenetim.Web.AnketUygulama
{
    public partial class FormTanimla : System.Web.UI.Page
    {
        Kullanicilar kullanici;

        public Kullanicilar Kullanici
        {
            get { return (Kullanicilar)Session["Kullanici"]; }

        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Kullanici.KullaniciRol != "Daire")
                return;

            bool? eklendi = Session["eklendi"] as bool?;

            if (eklendi!=null)
            {
                if (eklendi == true)
                {
                    DropDownList1.DataBind();
                    Session["eklendi"] = false;
                }
            }
        }

        protected void ASPxGridView2_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            DateTime now = DateTime.Now;
            e.NewValues["FormAdi"] = DropDownList1.Text;
          
        }

        protected void ASPxComboBox2_Init(object sender, EventArgs e)
        {
            var x = sender as ASPxComboBox;
            x.Items.Add("test");
            x.DataBind();
        }

       

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            DenetimDbContext dc = new DenetimDbContext();

            FORMSORU_GRUP grup = new FORMSORU_GRUP();


            var x1 = dc.FORMSORU_GRUPs.Where(c => c.FormSoruGrupKod == "FormTemelBilgileri").FirstOrDefault();
            var x2 = dc.FORMSORU_GRUPs.Where(c => c.FormSoruGrupKod == "FormBilgileri").FirstOrDefault();


            string FormAd = e.Command.Parameters["@FormAd"].Value.ToString();

            FORMSORU_GRUP grup1 = new FORMSORU_GRUP();

            grup1.BaslikCssSinif = x1.BaslikCssSinif;
            grup1.BaslikSitil = x1.BaslikSitil;
            grup1.FormKod = FormAd;
            grup1.FormSoruGrupBaslik = x1.FormSoruGrupBaslik;
            grup1.FormSoruGrupKod = x1.FormSoruGrupKod;
            grup1.KutuCssSinif = x1.KutuCssSinif;
            grup1.KutuSitil = x1.KutuSitil;
            grup1.YetkiliRoller = x1.YetkiliRoller;


            FORMSORU_GRUP grup2 = new FORMSORU_GRUP();

            grup2.BaslikCssSinif = x2.BaslikCssSinif;
            grup2.BaslikSitil = x2.BaslikSitil;
            grup2.FormKod = FormAd;
            grup2.FormSoruGrupBaslik = x2.FormSoruGrupBaslik;
            grup2.FormSoruGrupKod = x2.FormSoruGrupKod;
            grup2.KutuCssSinif = x2.KutuCssSinif;
            grup2.KutuSitil = x2.KutuSitil;
            grup2.YetkiliRoller = x2.YetkiliRoller;

            dc.FORMSORU_GRUPs.Add(grup1);
            dc.FORMSORU_GRUPs.Add(grup2);
            dc.SaveChanges();

            DenetimDbContext dc2 = new DenetimDbContext();
            var ilkSoruListe = (from c in dc2.FORM_SORUs
                                where c.FormAdi == "BT"
                                select c).Take(5).AsNoTracking().ToList();


            int i = 0;
            foreach (var item in ilkSoruListe)
            {
                item.FormAdi = FormAd;
                item.SoruSıraNo = i++;
                dc2.FORM_SORUs.Add(item);

            }

            dc2.SaveChanges();



            FORM_YATAYDATA y = new FORM_YATAYDATA();

            y.IlKod = 6;
            y.SatirGuid = Guid.NewGuid();
            y.FormAdi = FormAd;
            y.DenekAd = "Test Hasta";
            y.KurumKod = "177049";

            dc.FORM_YATAYDATAs.Add(y);
            dc.SaveChanges();
           
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}