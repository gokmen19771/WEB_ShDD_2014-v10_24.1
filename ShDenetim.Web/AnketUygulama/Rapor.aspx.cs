using DevExpress.XtraCharts;
using ShDenetim.Web.App_Code;
using ShDenetim.Web.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.AnketUygulama
{
    public class RaporIcerik
    {
        [Display(Name="Formun Adı")]
        public string FormAdı { get; set; }
        public int ToplamÖrneklemHastaSayısı { get; set; }
        public int KoordinatorTarafındanDoldurulanHastaSayısı { get; set; }
        public int CdOlanHastaSayısı { get; set; }
        public int KargoyaVerilenSayı { get; set; }

        public int AtananDenetleyiciSayısı { get; set; }

        public int DenetleyicininBildirdiğiNotSorunSayısı { get; set; }
        public int DenetleyiciTarafındanDoldurulanHastaSayısı { get; set; }
    
    
    }




    public partial class Rapor : System.Web.UI.Page
    {

        List<RaporIcerik> raporParamListe;
        protected void Page_Load(object sender, EventArgs e)
        {

            

            DenetimDbContext dc = new DenetimDbContext();

            List<Kullanicilar> liste = new List<Kullanicilar>();
            Kullanicilar kul = (Kullanicilar)Session["Kullanici"];

            raporParamListe = new List<RaporIcerik>();

            List<FORM_TANIM> formlar = dc.FORM_TANIMs.ToList();

            foreach (var item in formlar)
            {
                RaporIcerik formRapor = new RaporIcerik();

                formRapor.FormAdı = item.FormAd;
                formRapor.KoordinatorTarafındanDoldurulanHastaSayısı = dc.FORM_YATAYDATAs.Where(c => c.KayitTar1 != null && c.FormAdi == item.FormAd).Count();
                formRapor.DenetleyiciTarafındanDoldurulanHastaSayısı = dc.FORM_YATAYDATAs.Where(c => c.KayıtTar_Denetleyici1 != null && c.FormAdi == item.FormAd).Count();
                formRapor.AtananDenetleyiciSayısı = dc.FORM_YATAYDATAs.Where(c => c.AnketorId != null && c.FormAdi == item.FormAd).Count();
                formRapor.CdOlanHastaSayısı = dc.FORM_YATAYDATAs.Where(c => c.CdVarMi == true && c.FormAdi == item.FormAd).Count();
                formRapor.ToplamÖrneklemHastaSayısı = dc.FORM_YATAYDATAs.Where(c=>c.FormAdi==item.FormAd).Count();
                formRapor.KargoyaVerilenSayı = dc.FORM_YATAYDATAs.Where(c => c.KargoyaVerildi == true && c.FormAdi==item.FormAd).Count();

                var öneriSoruKod = dc.FORM_SORUs.Where(c => c.Soru.Contains("Varsa Önerileriniz?") && c.FormAdi==item.FormAd).FirstOrDefault();
              
                if (öneriSoruKod != null)
                {
                        string sql="select sayi=count(*) from FORM_YATAYDATA where " + 
                                    öneriSoruKod.SoruKod + "<>'' and FormAdi='" + öneriSoruKod.FormAdi + "'";

                        var c =dc.Database.SqlQuery(typeof(int), sql);

                        formRapor.DenetleyicininBildirdiğiNotSorunSayısı = c.OfType<int>().First();
                    
                }

                raporParamListe.Add(formRapor);


            }


            ASPxGridView1.DataSource = raporParamListe;
            ASPxGridView1.DataBind();
      

       

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
        }
    }



}