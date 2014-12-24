using ShDenetim.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.AnketUygulama
{
    public partial class Icd10 : System.Web.UI.UserControl
    {

        public Panel MyPanel { get; set; }
        public TextBox MyTextBox { get; set; }
        public  string VeriTabloAdi { get; set; }

       //textbo partial clasdan modify değiştirildi
    

        protected void Page_Load(object sender, EventArgs e)
        {
            DenetimDbContext dc = new DenetimDbContext();
            if (TextBox1x.Text.Length == 0) return;






            if (VeriTabloAdi == "ICD10")
            {
                string kodStr = TextBox1x.Text;

                var v = dc.ICD10s.Where(c => c.ICDKOD == kodStr).SingleOrDefault();

                if (v != null)
                {
                    Label1x.Text = v.ICD_HastalikAdi;
                }
                else
                    Label1x.Text = "icd kodundan kayıt bulunamadı";
            }
            else if (VeriTabloAdi == "CkysKurum")
            {
                string kod = TextBox1x.Text;
                var v = dc.KURUM_LISTESIs.Where(c => c.KurumKod == kod).SingleOrDefault();



                if (v != null)
                {
                    Label1x.Text = v.Kurum;
                }
                else
                    Label1x.Text = "kurum kodundan kurum adı bulunamadı";
            }
            

            
        }

    

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
          
        }
     

     

      
    }
}