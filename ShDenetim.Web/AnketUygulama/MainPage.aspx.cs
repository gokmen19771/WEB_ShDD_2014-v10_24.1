using DevExpress.Web.ASPxCallbackPanel;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridLookup;
using DevExpress.Web.ASPxGridView;
using ShDenetim.Models;
using ShDenetim.Web.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DevExpress.Spreadsheet;
using System.IO;

namespace ShDenetim.Web.AnketUygulama
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected override void OnInit(System.EventArgs e)
        {
            base.OnInit(e);

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DenetimDbContext dc = new DenetimDbContext();
            lnkKayitListesi.Visible = false;

            Kullanicilar kul = (Kullanicilar)Session["Kullanici"];



            if (cboKurumTipi.Items.Count == 0)
            {
                var q = dc.KURUMTIPKODLARIs.Where(c => c.SEC == true);
                cboKurumTipi.DataSource = q.OrderBy(c => c.KURUMTURU_AD).ToList();
                cboKurumTipi.DataBind();
                cboKurumTipi.Items.Insert(0, new ListItem { Text = "Seçiniz", Value = "0" });
            }




            lnkHastaBilgi.Visible = false;
            lnkFormTanimla.Visible = false;

            gwDenetleyiciDrListe.Visible = false;
            btnDenetleyiciExcel.Visible = false;




            if (kul != null && kul.KullaniciRol == "Daire")
            {
                lnkHastaBilgi.Visible = true;
            }

            if ((string)Session["ExcelYuklemeYapıldıMı"] == "evet")
            {
                cboKurumListesi_ValueChanged(null, null);
                Session["ExcelYuklemeYapıldıMı"] = "hayır";
            }

            if (!Page.IsPostBack)
            {
                gwYatay.Columns["Duzen"].Visible = false;
                ASPxGridView3.Visible = false;



                List<Kullanicilar> liste = new List<Kullanicilar>();

                if (kul.KullaniciRol == "Daire") panelDaireMenu.Visible = true;



                if (kul.KullaniciRol == "Daire")
                {
                    gwYatay.SettingsPager.PageSize = 100;
                    gwYatay.Columns["Duzen"].Visible = true;
                    gwDenetleyiciDrListe.Visible = false;
                    lnkHastaBilgi.Visible = true;
                    lnkFormTanimla.Visible = true;
                    cboKurumListesi.Visible = true;

                }


                liste.Add(kul);

                ASPxGridView1.DataSource = liste;
                ASPxGridView1.DataBind();

                List<string> formListeleri_ilk = kul.AktifFormlar.Split(';').ToList();

                List<string> formListeleri = new List<string>();


                foreach (var item in formListeleri_ilk)
                {
                    formListeleri.Add(item.Split('|')[0]);
                }



                if (kul.AktifFormlar == "Tümü" && kul.KullaniciRol == "Daire")
                {
                    formListeleri = dc.FORM_TANIMs.
                        Select(c => c.FormAd).ToList();
                }

                cboFormSeç.AutoPostBack = true;
                cboFormSeç.DataSource = formListeleri;
                cboFormSeç.DataBind();

                if (Session["KaydetKapat"] != null && (bool)Session["KaydetKapat"] == true)
                {
                    cboFormSeç.SelectedValue = (string)Session["AktifForm"];
                    cboKurumTipi.SelectedValue = (string)Session["SeçiliKurumTip"];

                    FORM_TANIM form_tanım = dc.FORM_TANIMs.Where(c => c.FormAd == cboFormSeç.Text).SingleOrDefault();
                    int kurumTipKod = int.Parse(cboKurumTipi.SelectedValue.ToString());


                    cboKurumListesi.DataSource = DenetlenecekKurumListesiGetir(kurumTipKod, kul, form_tanım);
                    cboKurumListesi.DataBind();



                    cboKurumListesi.Value = (string)Session["DenetlenecekKurumCkys"];




                }

                cboFormSeç_SelectedIndexChanged(null, null);


                if (kul.KurumKod == null) kul.KurumKod = "0";

                string ckys = kul.KurumKod.ToString();
                string formtipi = (cboFormSeç.SelectedItem as ListItem).Text;



                gwDenetleyiciDrListe.Visible = false;
                DenetleyiciBilgiGuncelle();

                if (Session["dc"] == null)
                    Session["dc"] = dc;



                var v = dc.FORM_TANIMs.Where(c => c.FormAd == cboFormSeç.Text).Single();
                if (v.FormBitisTar < DateTime.Now)
                {
                    lblUyarı.Text = "Süre Aşımı:Form için kayıt giriş süresi dolmuştur.Kayıtlarınızı sadece okunur şeklinde görebilirsiniz";
                    gwYatay.Enabled = kul.KullaniciRol == "Daire";
                }

            }

            if (!IsPostBack)
            {


                gwYatay.DataBind();


            }


            if (kul.KullaniciRol != "Denetleyici")
            {
                DenetleyiciBilgiGuncelle();

            }

            if (kul.KullaniciRol == "HastaneKoordinatör")
            {
                gwYatay.Columns["Kargo"].Visible = false;
                gwYatay.Columns["CdVarmı"].Visible = false;
                gwYatay.Columns["Denetleyen"].Visible = false;

                gwYatay.Columns["ProtokolNo"].Width = 75;
                gwDenetleyiciDrListe.Visible = false;



            }

            gwDenetleyiciDrListe.Visible = false;
            btnDenetleyiciExcel.Visible = false;


            if (kul.KullaniciRol == "Denetleyici")
            {
                btnYeniForm.Visible = false;

            }

            if (kul.KullaniciRol == "IsmKoordinatör")
            {
                lnkKayitListesi.Visible = true;
            }

            //ASPxUploadControl1.Visible = kul.KullaniciRol == "Daire";




            if (Page.IsPostBack == true)
            {
                FORM_TANIM form_tanım = dc.FORM_TANIMs.Where(c => c.FormAd == cboFormSeç.Text).SingleOrDefault();
                int kurumTipKod = int.Parse(cboKurumTipi.SelectedValue.ToString());


                cboKurumListesi.DataSource = DenetlenecekKurumListesiGetir(kurumTipKod, kul, form_tanım);
                cboKurumListesi.DataBind();

                Session["DenetlenecekKurumCkys"] = cboKurumListesi.Value;

                gwYatay.DataBind();
            }


            lnkKurumListesi.Visible = kul.KullaniciRol == "Daire";
            DetailsView1.Visible = true;


            var son = Session["DenetlenecekKurumCkys"];

            if (son == null)
            {
                PanelYeniForm.Enabled = false;
                lblAnaUyarı.Text = "Form eklemek için bir kurum seçmelisiniz";
            }
            else
            {
                PanelYeniForm.Enabled = true;
                lblAnaUyarı.Text = "";
            }
               


        }




        public void DenetimDurumYükle()
        {
            DenetimDbContext dc_kDurum = new DenetimDbContext();

            string kCkys = (string)cboKurumListesi.Value;
            string kForm = cboFormSeç.Text;

            var x = (string)Session["DenetlenecekKurumCkys"];


            DENETİM_KURUM_DURUM dDurum = dc_kDurum.DENETİM_KURUM_DURUMs.Where(c => c.KurumCkys == kCkys && c.FormAdi == kForm).SingleOrDefault();

            if (dDurum == null)
            {
                SqlDataSourceKurumDurum.InsertParameters["FormAdi"].DefaultValue = kForm;
                SqlDataSourceKurumDurum.InsertParameters["KurumCkys"].DefaultValue = kCkys;
                SqlDataSourceKurumDurum.InsertParameters["KurumDenetimDurum"].DefaultValue = "Seçiniz";

                SqlDataSourceKurumDurum.Insert();
                DetailsView1.DataBind();
            }


        }


        private void DenetleyiciBilgiGuncelle()
        {
            DenetimDbContext dc = new DenetimDbContext();
            Kullanicilar kul = (Kullanicilar)Session["Kullanici"];



            var x = from c in dc.vwDenetleyiciAtamaBilgis
                    where c.Denetlediğiİl == kul.IlKod && c.FormAdi == cboFormSeç.Text
                    select c;

            gwDenetleyiciDrListe.DataSource = x.OrderBy(c => c.KullaniciAdSoyad).ToList();
            gwDenetleyiciDrListe.DataBind();

            gwDenetleyiciDrListe.Caption = cboFormSeç.Text + " Formları için atanan Denetleyici doktorlara ait iletişim ve denetim bilgileri";


            if (kul.KullaniciRol == "Daire")
            {
                gwDenetleyiciDrListe.Visible = false;
                btnDenetleyiciExcel.Visible = false;
            }
        }


        protected void cboFormSeç_SelectedIndexChanged(object sender, EventArgs e)
        {
            gwYatay.Enabled = true;
            Session["AktifForm"] = cboFormSeç.Text;

            lblUyarı.Text = "";

            DenetimDbContext dc = new DenetimDbContext();
            FORM_TANIM form_tanım = dc.FORM_TANIMs.Where(c => c.FormAd == cboFormSeç.Text).SingleOrDefault();
            Kullanicilar kul = (Kullanicilar)Session["Kullanici"];

            if (form_tanım.FormBitisTar != null && form_tanım.FormBitisTar < DateTime.Now)
            {
                lblUyarı.Text = "Süre Aşımı:Form için kayıt giriş süresi dolmuştur.Kayıtlarınızı sadece okunur şeklinde görebilirsiniz";
                gwYatay.Enabled = kul.KullaniciRol == "Daire";

            }

            lnkFormTanimla.Visible = kul.KullaniciRol == "Daire";
            gwYatay.DataBind();


            sqlGetirDenetlenecekler(kul, form_tanım);
            gwDenetleyiciDrListe.Visible = false;


            cboKurumListesi_ValueChanged(null, null);




        }





        protected void ASPxCheckBox1_Init(object sender, EventArgs e)
        {
            ASPxCheckBox chk = sender as ASPxCheckBox;
            GridViewDataItemTemplateContainer container = chk.NamingContainer as GridViewDataItemTemplateContainer;

            chk.ClientSideEvents.CheckedChanged = String.Format("function (s, e) {{ cb.PerformCallback('{0}|' + s.GetChecked()); }}", container.KeyValue);


        }

        protected void ASPxCallback1_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String[] p = e.Parameter.Split('|');

            DenetimDbContext dc = new DenetimDbContext();
            int _id = int.Parse(p[0]);


            var v = dc.FORM_YATAYDATAs.Where(c => c.Id == _id).FirstOrDefault();
            v.CdVarMi = Convert.ToBoolean(p[1]);


            gwYatay.Selection.SelectRowByKey(_id);

            dc.SaveChanges();
        }



        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            gwYatay.Columns["colAyrinti"].Visible = false;
            ASPxGridViewExportYatay.WriteXlsToResponse("HastaListesi");

            gwYatay.Columns["colAyrinti"].Visible = true;

        }



        protected void ASPxGridLookup1_Init(object sender, EventArgs e)
        {


            var lookup = (sender as ASPxGridLookup);
            DenetimDbContext dc = new DenetimDbContext();



            var z = from s in dc.Kullanicilars
                    where s.KullaniciRol == "Denetleyici"
                    join y in dc.FORM_YATAYDATAs on s.KullaniciID equals y.AnketorId into Yeni
                    from x in Yeni.DefaultIfEmpty()

                    group x by new
                    {
                        s.KullaniciID,
                        s.KullaniciAdSoyad,
                        s.KurumKod,
                        s.IlgiAlani,
                        s.AktifFormlar

                    } into kulGrup
                    select new
                    {
                        KullaniciID = kulGrup.Key.KullaniciID,
                        KullaniciAdSoyad = kulGrup.Key.KullaniciAdSoyad,
                        IlgiAlani = kulGrup.Key.IlgiAlani,
                        KurumKod = kulGrup.Key.KurumKod,
                        HastaSayisi = kulGrup.Count(),
                        AktifFormlar = kulGrup.Key.AktifFormlar
                    };

            lookup.DataSource = z.ToList();

            var filtre = Session["filter"];

            lookup.GridView.FilterExpression = filtre == null ? "" : filtre.ToString();

            lookup.DataBind();
            lookup.GridView.DataBind();


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DenetleyiciBilgiGuncelle();
        }

        protected void ASPxCheckBox2_Init(object sender, EventArgs e)
        {
            ASPxCheckBox chk = sender as ASPxCheckBox;
            GridViewDataItemTemplateContainer container = chk.NamingContainer as GridViewDataItemTemplateContainer;

            chk.ClientSideEvents.CheckedChanged = String.Format("function (s, e) {{ cb2.PerformCallback('{0}|' + s.GetChecked()); }}", container.KeyValue);

        }

        protected void ASPxCallback2_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            String[] p = e.Parameter.Split('|');

            DenetimDbContext dc = new DenetimDbContext();
            int _id = int.Parse(p[0]);


            var v = dc.FORM_YATAYDATAs.Where(c => c.Id == _id).FirstOrDefault();
            v.KargoyaVerildi = Convert.ToBoolean(p[1]);


            gwYatay.Selection.SelectRowByKey(_id);

            dc.SaveChanges();
        }



        protected void Yukle(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxCallbackPanel cp = (ASPxCallbackPanel)sender;
            ASPxGridLookup lookup = (ASPxGridLookup)cp.FindControl("ASPxGridLookup1");

            Session["filter"] = lookup.GridView.FilterExpression;
        }

        protected void gwYatay_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

        }

        protected void gwYatay_DataBinding(object sender, EventArgs e)
        {
            if (Session["dc"] == null) return;

            string aktifKurumCkys = (string)Session["DenetlenecekKurumCkys"];

            DenetimDbContext dc = Session["dc"] as DenetimDbContext;
            Kullanicilar kul = (Kullanicilar)Session["Kullanici"];
            string kurumKod = kul.KurumKod.ToString();
            string formAdi = (cboFormSeç.SelectedItem as ListItem).Text;

            FORM_TANIM form_tanım = dc.FORM_TANIMs.Where(c => c.FormAd == formAdi).SingleOrDefault();


            var q1 = from c in dc.FORM_YATAYDATAs
                     orderby c.Id
                     select new
                     {
                         c.Id,
                         c.KurumKod,
                         c.CdVarMi,
                         c.KargoyaVerildi,
                         AnketorId = c.Kullanici.KullaniciID,
                         AnketorAd = c.Kullanici.KullaniciAdSoyad,

                         AnketorId2 = c.Kullanici2.KullaniciID,
                         AnketorAd2 = c.Kullanici2.KullaniciAdSoyad,

                         KayıtTar_Denetleyici1 = c.KayıtTar_Denetleyici1,
                         KayıtTar_Denetleyici2 = c.KayıtTar_Denetleyici2,

                         c.DenekAd,
                         c.FormAdi,
                         c.ProtokolNo,
                         c.KayitTar1,
                         c.IlKod,
                         IlAd = c.ILPLAKA.IlAd,
                         c.SatirGuid,
                         Kurum = c.KurumBilgi.Kurum,
                         c.S01,
                         c.S02,
                         c.S03,
                         c.S04,
                         c.S05,
                         c.S06,
                         c.S07,
                         c.S08,
                         c.S09,
                         c.S10,
                         c.S24,
                         c.S25,
                         c.S26,
                         c.S27,
                         c.S28,
                         c.S29


                     };


            if (kul.KullaniciRol == "Daire")
            {
                q1 = q1.Where(c => c.KurumKod == aktifKurumCkys);

                gwYatay.DataSource = q1.Where(c => c.FormAdi == formAdi).ToList();
            }
            else if (kul.KullaniciRol == "Koordinatör")
            {
                q1 = q1.Where(c => c.KurumKod == aktifKurumCkys);
                gwYatay.DataSource = q1.Where(c => c.FormAdi == formAdi && c.KurumKod == kurumKod).ToList();
                var kurumIl = dc.KURUM_LISTESIs.Where(c => c.KurumKod == kul.KurumKod).FirstOrDefault();

                if (kurumIl != null)   //  ism deki sorumlu kişi listesi
                {
                    ASPxGridView3.Visible = true;

                    ASPxGridView3.DataSource = dc.Kullanicilars.Where(c => c.IlKod == kurumIl.IlKod && c.KullaniciRol == "Ism").ToList();
                    ASPxGridView3.DataBind();
                }
            }

            else if (kul.KullaniciRol == "IsmKoordinatör")
            {
                q1 = q1.Where(c => c.KurumKod == aktifKurumCkys);
                gwYatay.DataSource = q1.Where(c => c.FormAdi == formAdi).ToList();

                ASPxGridView3.Visible = false;


            }
            else if (kul.KullaniciRol == "IsmYonetici")
            {
                q1 = q1.Where(c => c.FormAdi == formAdi && c.IlKod == kul.IlKod);
                gwYatay.DataSource = q1.ToList();

                ASPxGridView3.Visible = false;
                lnkKayitListesi.Visible = true;


            }
            else if (kul.KullaniciRol == "Ism")
            {
                q1 = q1.Where(c => c.KurumKod == aktifKurumCkys);


                if (form_tanım.DenetimTipi.Contains("TıbbiDenetim"))
                {
                    gwYatay.DataSource = q1.Where(c => c.FormAdi == formAdi && c.KurumKod == aktifKurumCkys).ToList();

                    btnYeniForm.Visible = true;
                }
                else
                {
                    gwYatay.DataSource = q1.Where(c => c.FormAdi == formAdi && c.IlKod == kul.IlKod).ToList();
                    btnYeniForm.Visible = true;

                }

            }
            else if (kul.KullaniciRol == "Denetleyici" || kul.KullaniciRol == "Denetleyici2")
            {
                List<int> dr_ilkodlari = new List<int>();

                if (kul.KullaniciRol == "Denetleyici")
                {
                    var x = q1.Where(c => c.FormAdi == formAdi && c.AnketorId == kul.KullaniciID).ToList();
                    gwYatay.DataSource = x;
                    foreach (var item in x)
                    {
                        List<int> var_mi = dr_ilkodlari.Where(c => c == item.IlKod).ToList();
                        if (var_mi.Count == 0) dr_ilkodlari.Add(item.IlKod);
                    }

                }

                if (kul.KullaniciRol == "Denetleyici2")
                {
                    var y = q1.Where(c => c.FormAdi == formAdi && c.AnketorId2 == kul.KullaniciID).ToList();

                    gwYatay.DataSource = y;
                    foreach (var item in y)
                    {
                        List<int> var_mi = dr_ilkodlari.Where(c => c == item.IlKod).ToList();
                        if (var_mi.Count == 0) dr_ilkodlari.Add(item.IlKod);
                    }

                    gwYatay.Columns["AnketorAd"].Visible = false;


                }



                List<Kullanicilar> dr_ismKulListe = new List<Kullanicilar>();

                foreach (var item in dr_ilkodlari)
                {
                    var veri = dc.Kullanicilars.Where(c => c.IlKod == item && c.KullaniciRol == "Ism").ToList();
                    if (veri != null)
                        dr_ismKulListe.AddRange(veri);
                }


                gwDenetleyiciDrListe.Visible = false;


                ASPxGridView3.Columns["colAdres"].Visible = false;
                ASPxGridView3.Caption = "İl Sağlık Müdürlüğü Denetim Sorumluları ve İletişim Bilgileri" + "<br/>" + "(Bozuk CD veya gönderim ile ilgili sorunlarda temas kurunuz)";
                ASPxGridView3.Visible = true;
                ASPxGridView3.DataSource = dr_ismKulListe;
                ASPxGridView3.DataBind();

                btnDenetleyiciExcel.Visible = false;
            }


        }

        protected void gwYatay_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {



        }

        protected void gwYatay_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            GridViewDataColumn col = gwYatay.Columns["AnketorAd"] as GridViewDataColumn;

            ASPxCallbackPanel call_panel = gwYatay.FindEditRowCellTemplateControl(col, "ASPxCallbackPanel1") as ASPxCallbackPanel;

            ASPxGridLookup cbo = call_panel.FindControl("ASPxGridLookup1") as ASPxGridLookup;

            DenetimDbContext dc = new DenetimDbContext();

            int _id = (int)e.Keys[0];


            var v = dc.FORM_YATAYDATAs.Where(c => c.Id == _id).FirstOrDefault();

            if (cbo.Value == null)
                v.AnketorId = null;
            else
                v.AnketorId = cbo.Value.ToString();


            dc.SaveChanges();

            gwYatay.CancelEdit();

            e.Cancel = true;
            gwYatay.DataBind();



            DenetleyiciBilgiGuncelle();
        }

        protected void btnDenetleyiciBilgiGuncelle_Click(object sender, EventArgs e)
        {

        }

        protected void btnDenetleyiciExcel_Click(object sender, EventArgs e)
        {
            DenetleyiciBilgiGuncelle();
            ASPxGridViewExporterAdres.WriteXlsToResponse("ListeIletisim");
        }

        protected void btnDenetleyiciAdresBilgi_Click(object sender, EventArgs e)
        {
            DenetleyiciBilgiGuncelle();
        }

        protected void gwYatay_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            ASPxImage image = gwYatay.FindRowCellTemplateControl(e.VisibleIndex, ASPxGridView1.Columns["KayitTar1"] as GridViewDataColumn, "ASPxImage1") as ASPxImage;

            if (image == null) return;

            DateTime? dt = e.GetValue("KayitTar1") as DateTime?;

            if (dt == null)
                image.ImageUrl = @"\App_Themes\Mavi\images\gv_IncFalse.png";
            else
                image.ImageUrl = @"\App_Themes\Mavi\images\gv_IncTrue.png";




            if (e.Row.Cells.Count < 5) return;

            int i = -1;
            int cellIndex_KayıtTar_Denetleyici1 = 0;
            int cellIndex_KayıtTar_Denetleyici2 = 0;

            foreach (var item in gwYatay.VisibleColumns)
            {
                i++;
                var col = item as GridViewDataColumn;
                if (col == null) continue;

                if (col.FieldName == "KayıtTar_Denetleyici1") cellIndex_KayıtTar_Denetleyici1 = i;
                if (col.FieldName == "KayıtTar_Denetleyici2") cellIndex_KayıtTar_Denetleyici2 = i;


            }


            DateTime? dt2 = e.GetValue("KayıtTar_Denetleyici1") as DateTime?;
            if (dt2 != null)
            {
                e.Row.Cells[cellIndex_KayıtTar_Denetleyici1].Style.Add("background-color", "LightGreen");
                e.Row.Cells[cellIndex_KayıtTar_Denetleyici1 - 1].Style.Add("background-color", "LightGreen");
            }



            DateTime? dt3 = e.GetValue("KayıtTar_Denetleyici2") as DateTime?;
            if (dt3 != null)
            {
                e.Row.Cells[cellIndex_KayıtTar_Denetleyici2].Style.Add("background-color", "SeaGreen");
                //e.Row.Cells[cellIndex_KayıtTar_Denetleyici2-1].Style.Add("background-color", "SeaGreen");
            }



        }

        protected void btnYeniHasta_Click(object sender, EventArgs e)
        {


            Session["DenetlenecekKurumCkys"] = cboKurumListesi.Value;
            Session["SeçiliKurumTip"] = cboKurumTipi.SelectedValue;

            Response.Redirect(@"~/AnketUygulama/AnketForm.aspx");


        }


        public List<KURUMDTO> DenetlenecekKurumListesiGetir(int kurumTurKod, Kullanicilar kul, FORM_TANIM form_tanım)
        {
            DenetimDbContext dc = new DenetimDbContext();

            int ilkodu = kul.IlKod.Value;


            if (form_tanım.DenetimTipi == "TıbbiDenetimYeni" ||
                form_tanım.DenetimTipi == "KardiyolojiTakip" ||
                form_tanım.DenetimTipi == "TıbbiDenetim2")
            {
                var x = from c in dc.KURUMLAR_FULLs
                        where (c.IlKod == ilkodu || ilkodu == 0) && (c.GörüneceğiFormlar.Contains(form_tanım.FormAd) || c.GörüneceğiFormlar1.Contains(form_tanım.FormAd))
                        select new KURUMDTO { KURUMAD = c.Kurum, KURUMCKYS = c.KurumKod, ILAD = c.İl, ILCEAD = c.İlçe };


                List<KURUMDTO> x1 = x.OrderBy(c => c.KURUMAD).ToList();
                return x1;

            }



            if (form_tanım.DenetimTipi == "KurumDenetimi")
            {
                var x = from c in dc.KURUM_LISTESIs
                        where (c.IlKod == ilkodu || ilkodu == 0) && c.KURUMTURU_KOD == kurumTurKod
                        select new KURUMDTO { KURUMAD = c.Kurum, KURUMCKYS = c.KurumKod, ILAD = c.İl, ILCEAD = c.İlçe };



                List<KURUMDTO> x1 = x.OrderBy(c => c.KURUMAD).ToList();
                return x1;

            }

            if (form_tanım.DenetimTipi == "TıbbiDenetim")
            {


                List<V_TSIM_HBF_YBU> listeYBU = new List<V_TSIM_HBF_YBU>();

                string altÜniteListesi = form_tanım.AltUniteListesi;

                string[] aranacakListe = altÜniteListesi.Split(';');


                string ilKoşul = " where ILKOD='" + ilkodu.ToString().PadLeft(2, '0') + "'";

                if (kul.KullaniciRol == "Daire") ilKoşul = "";

                foreach (var aranacak in aranacakListe)
                {
                    string sql = "select rtrim(substring(YBU,charindex('|{0}',YBU,1)+1,len('{0}')+10)) as YBU,* from [dbo].[V_TSIM_HBF_YBU]";

                    sql = sql.Replace("{0}", aranacak);

                    sql += ilKoşul;

                    var x = dc.Database.SqlQuery<V_TSIM_HBF_YBU>(sql).
                            Where(c => !c.YBU.Contains(aranacak + ";0;0;0")).ToList();

                    listeYBU.AddRange(x);
                }


                var z = from c in listeYBU
                        select new KURUMDTO { KURUMCKYS = c.KURUMCKYS.ToString(), KURUMAD = c.KURUMAD.Trim(), ILAD = c.ILAD };

                return z.ToList();

            }



            if (form_tanım.DenetimTipi == "İzleme")
            {
                var x = from c in dc.KURUM_LISTESIs
                        where c.IlKod == kul.IlKod
                        select new KURUMDTO { KURUMAD = c.Kurum, KURUMCKYS = c.KurumKod, ILAD = c.İl, ILCEAD = c.İlçe };

                var x1 = x.OrderBy(c => c.KURUMAD).ToList().Distinct();
                return x1.ToList();


            }


            return null;




        }



        public void sqlGetirDenetlenecekler(Kullanicilar kul, FORM_TANIM form_tanım)
        {
            DenetimDbContext dc = new DenetimDbContext();
            DetailsView1.Visible = true;

            int kurumTurKod = int.Parse(cboKurumTipi.SelectedValue);

            int ilkodu = kul.IlKod.Value;

            gwYatay.Columns["AnketorAd2"].Visible = true;
            gwYatay.Columns["KayıtTar_Denetleyici2"].Visible = true;
            gwYatay.Columns["ProtokolNo"].Visible = true;
            gwYatay.Columns["DenekAd"].Visible = true;
            gwYatay.Columns["CdVarMi"].Visible = true;




            if (form_tanım.DenetimTipi == "KurumDenetimi")
            {
                if (kul.KullaniciRol == "IsmKoordinatör" || kul.KullaniciRol == "Daire")
                {
                    gwDenetleyiciDrListe.Visible = false;

                    cboKurumTipi.Visible = true;
                    lblKurumTipi.Visible = true;


                    //cboKurumListesi.Items.Insert(0, new ListItem { Text = "Seçiniz", Value = "0" });

                    gwYatay.Columns["AnketorAd2"].Visible = false;
                    gwYatay.Columns["KayıtTar_Denetleyici2"].Visible = false;
                    gwYatay.Columns["ProtokolNo"].Visible = false;
                    gwYatay.Columns["DenekAd"].Visible = false;
                    gwYatay.Columns["CdVarMi"].Visible = false;


                }


            }

            if (form_tanım.DenetimTipi == "TıbbiDenetim")
            {



                cboKurumListesi.Visible = true;
                cboKurumTipi.Visible = false;
                gwDenetleyiciDrListe.Visible = false;
                lblKurumTipi.Visible = false;

            }

            if (form_tanım.DenetimTipi == "TıbbiDenetimYeni")
            {


                cboKurumListesi.Visible = true;
                cboKurumTipi.Visible = false;
                gwDenetleyiciDrListe.Visible = false;
                lblKurumTipi.Visible = false;

            }



            if (form_tanım.DenetimTipi == "TıbbiDenetim2")
            {


                cboKurumListesi.Visible = true;
                cboKurumTipi.Visible = false;
                gwDenetleyiciDrListe.Visible = false;
                lblKurumTipi.Visible = false;


                if (kul.KullaniciRol == "Ism")
                {

                    PanelYeniForm.Visible = true;
                    ASPxUploadControl1.Visible = false;



                }
            }


            if (form_tanım.DenetimTipi == "İzleme")
            {

                gwDenetleyiciDrListe.Visible = false;

                //cboKurumListesi.Items.Insert(0, new ListItem { Text = "Seçiniz", Value = "0" });

                gwYatay.Columns["AnketorAd2"].Visible = false;
                gwYatay.Columns["KayıtTar_Denetleyici2"].Visible = false;
                gwYatay.Columns["ProtokolNo"].Visible = false;
                gwYatay.Columns["DenekAd"].Visible = false;
                gwYatay.Columns["CdVarMi"].Visible = false;



            }


            if (form_tanım.DenetimTipi == "KardiyolojiTakip")
            {



                cboKurumListesi.Visible = true;
                cboKurumTipi.Visible = false;
                gwDenetleyiciDrListe.Visible = false;
                lblKurumTipi.Visible = false;




                PanelYeniForm.Visible = false;
                lblKurumTipi.Visible = false;
                lblKurumAdi.Visible = false;

                if (kul.KullaniciRol == "Denetleyici2")
                {
                    gwDenetleyiciDrListe.Visible = false;


                    cboKurumListesi.Visible = false;
                    cboKurumTipi.Visible = false;

                    gwYatay.Columns["AnketorAd"].Visible = false;
                    gwYatay.Columns["AnketorAd2"].Visible = true;
                    gwYatay.Columns["KayıtTar_Denetleyici2"].Visible = true;
                    gwYatay.Columns["ProtokolNo"].Visible = true;
                    gwYatay.Columns["DenekAd"].Visible = true;

                }

                if (kul.KullaniciRol == "Denetleyici")
                {
                    gwDenetleyiciDrListe.Visible = false;


                    cboKurumListesi.Visible = false;
                    cboKurumTipi.Visible = false;

                    gwYatay.Columns["AnketorAd"].Visible = true;
                    gwYatay.Columns["AnketorAd2"].Visible = false;
                    gwYatay.Columns["KayıtTar_Denetleyici2"].Visible = true;
                    gwYatay.Columns["ProtokolNo"].Visible = true;
                    gwYatay.Columns["DenekAd"].Visible = true;

                    cboKurumListesi.Visible = false;
                    cboKurumTipi.Visible = false;


                }
            }


        }




        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
        {
            string kCkys = (string)Session["DenetlenecekKurumCkys"];
            string kForm = (string)Session["AktifForm"]; ;
            Kullanicilar kul = (Kullanicilar)Session["Kullanici"];




            DenetimDbContext dc = new DenetimDbContext();


            List<FORM_SORU> soru_liste = dc.FORM_SORUs.Where(c => c.FormAdi == kForm && c.ExcelBaşlıkHücreKonum != null).ToList();
            if (soru_liste == null)
            {
                e.CallbackData = "Bu Excel dosyası ile ilgili herhangi bir bağlantı tanımı yapılmamış";
                return;
            }





            var kurum = dc.KURUM_LISTESIs.Where(c => c.KurumKod == kCkys).FirstOrDefault();


            Workbook workbook = new DevExpress.Spreadsheet.Workbook();

            Byte[] by = ASPxUploadControl1.UploadedFiles[0].FileBytes;


            MemoryStream ms = new MemoryStream(by);

            DocumentFormat format = FormatGetir(ASPxUploadControl1.UploadedFiles[0].FileName);
            workbook.LoadDocument(ms, format);


            Worksheet worksheet1 = workbook.Worksheets[0];


            string soruExcelBaşlıklarıYerindeMi = SoruExcelBaşlıklarıKonumuYerindeMi(kForm, worksheet1);



            if (soruExcelBaşlıklarıYerindeMi != "")
            {
                e.CallbackData = soruExcelBaşlıklarıYerindeMi;
                return;
            }


            var kurumKodHücreKontrol = soru_liste.Where(c => c.SoruKod == "KurumKod").FirstOrDefault();

            if (kurumKodHücreKontrol != null)
            {
                var kurumKodHücre = worksheet1.Cells[kurumKodHücreKontrol.ExcelBaşlıkHücreKonum];

                string excelKurumKodDeğer = worksheet1.Cells[kurumKodHücre.RowIndex + 1, kurumKodHücre.ColumnIndex].Value.ToString();

                if (excelKurumKodDeğer != kCkys)
                {
                    e.CallbackData = "Excel Dosyası ile Seçilen Kurum Eşleşmiyor";
                    return;
                }
            }


            var HastaAdSoyadHücreKontrol = soru_liste.Where(c => c.SoruKod == "DenekAd").FirstOrDefault().ExcelBaşlıkHücreKonum;

            var hastaAdSoyadSutunKonumExcel = worksheet1.Cells[HastaAdSoyadHücreKontrol];

            // rowindex 0 tabanlı olduğundan 1 eklendi bir alt satır için ayrıca 1 eklendi
            var satırBaşlangıçIndex = hastaAdSoyadSutunKonumExcel.RowIndex + 1 + 1;
            var hastaAdSoyadSutunIndex = hastaAdSoyadSutunKonumExcel.ColumnIndex;

            var maxSatır = 1000000;


            for (int satirId = satırBaşlangıçIndex; satirId < maxSatır; satirId++)
            {

                string kontrol1 = worksheet1.Cells[satirId - 1, hastaAdSoyadSutunIndex + 1].Value.ToString();
                string kontrol2 = worksheet1.Cells[satirId, hastaAdSoyadSutunIndex + 1].Value.ToString();
                string kontrol3 = worksheet1.Cells[satirId + 1, hastaAdSoyadSutunIndex + 1].Value.ToString();

                bool b = (kontrol1 == kontrol2) && (kontrol2 == kontrol3);

                if (b == true && kontrol1 == "") break;



                FORM_YATAYDATA yatay = new FORM_YATAYDATA();


                yatay.FormAdi = kForm;
                yatay.SatirGuid = Guid.NewGuid();
                yatay.KurumKod = kCkys;
                yatay.IlKod = kurum.IlKod;

                if (kul.KullaniciRol == "Denetleyici2") yatay.AnketorId2 = kul.KullaniciID;
                if (kul.KullaniciRol == "Denetleyici") yatay.AnketorId = kul.KullaniciID;


                foreach (var soru in soru_liste)
                {

                    string hücreKonumHarf = soru.ExcelBaşlıkHücreKonum.Substring(0, 1);
                    string hücreKonum = hücreKonumHarf + satirId.ToString();

                    if (soru.ExcelBaşlıkHücreKonum.Contains('$'))
                    {
                        hücreKonum = soru.ExcelBaşlıkHücreKonum.Split('$')[0] + (int.Parse(soru.ExcelBaşlıkHücreKonum.Split('$')[1]) + 1).ToString();
                    }

                    string satırDeğer = worksheet1.Cells[hücreKonum].Value.ToString();

                    string tipUyarıSatırBilgi = satirId.ToString() + ". Satır " + yatay.DenekAd + " isimli Hasta Kaydı\r\n" + soru.Soru + " Sutunu : ";

                    string şıklar = soru.Şıklar ?? "";



                    string uyarıTip = DataHatalarıGetir(satırDeğer, tipUyarıSatırBilgi, soru);

                    if (uyarıTip.Length > 0)
                    {
                        e.CallbackData = uyarıTip;
                        return;
                    }

                    Utils.NesneIslemleri.NesneOzellikDegerAta(yatay, soru.SoruKod, satırDeğer);


                }


                dc.FORM_YATAYDATAs.Add(yatay);


            }

            dc.SaveChanges();
            e.CallbackData = dc.FORM_YATAYDATAs.Local.Count.ToString() + " Adet Kayıt Eklendi";

            Session["ExcelYuklemeYapıldıMı"] = "evet";

        }


        public string SoruExcelBaşlıklarıKonumuYerindeMi(string formAdı, Worksheet workSheet1)
        {
            DenetimDbContext dc = new DenetimDbContext();
            List<FORM_SORU> soru_liste = dc.FORM_SORUs.Where(c => c.FormAdi == formAdı && c.ExcelBaşlıkHücreKonum != null).ToList();



            string sonuc = "";

            foreach (var soru in soru_liste)
            {
                string sutunBaslik = workSheet1.Cells[soru.ExcelBaşlıkHücreKonum].Value.ToString();

                if (sutunBaslik != soru.Soru)
                {
                    string sonucBilgi = soru.Soru + " Sutun Başlığı veya Hücre Konumu Değiştirilemez" +
                        "\r\nBaşlığın Bulunması Gereken Hücre: " + soru.ExcelBaşlıkHücreKonum +
                         "\r\n(Orjinal Excel Dosyasına Bakınız)";
                    sonuc = sonucBilgi; break;
                }
            }

            return sonuc;

        }


        public string DataHatalarıGetir(string satir_değer, string tipUyarıSatırBilgi, FORM_SORU soru)
        {
            string strUyumlulukDurum = "";





            if (soru.ZorunluMu == true && satir_değer.Length == 0)
            {
                strUyumlulukDurum = tipUyarıSatırBilgi + "\r\nDeğer Girilmesi Zorunlu";
                return strUyumlulukDurum;
            }

            if (soru.Uzunluk != null && soru.Uzunluk != 0)
            {
                if (satir_değer.Length != soru.Uzunluk)
                {
                    strUyumlulukDurum = tipUyarıSatırBilgi + "\r\nGirilen Metnin Uzunluğu" + soru.Uzunluk + " Kadar Olmalıdır";
                    return strUyumlulukDurum;
                }

            }



            if (soru.Şıklar != null && soru.Şıklar.Length > 0)
            {

                string[] şıkListe = soru.Şıklar.Split(';');

                var listedeVarMı = şıkListe.Where(c => c.ToString() == satir_değer).SingleOrDefault();
                if (listedeVarMı == null)
                {
                    if (soru.ZorunluMu == false && satir_değer.Length == 0)
                        strUyumlulukDurum = "";
                    else
                    {
                        strUyumlulukDurum = tipUyarıSatırBilgi + satir_değer + " değeri \r\n" + soru.Şıklar + "\r\nSeçeneklerinden Biri Olmalı";
                        return strUyumlulukDurum;
                    }

                }
            }


            if (soru.SoruTip == "Sayı")
            {
                float output;
                bool sonuc = float.TryParse(satir_değer, out output);
                if (sonuc != true) strUyumlulukDurum = tipUyarıSatırBilgi + satir_değer + " Değeri Sayı Olmalı";

            }

            if (soru.SoruTip == "Tarih")
            {
                DateTime output;
                bool sonuc = DateTime.TryParse(satir_değer, out output);
                if (sonuc != true) strUyumlulukDurum = tipUyarıSatırBilgi + satir_değer + " Değeri Tarih Olmalı";

            }


            return strUyumlulukDurum;

        }

        public DocumentFormat FormatGetir(string strFile)
        {
            string[] s = strFile.Split('.');

            string dosyaUzantısı = s[s.Length - 1];

            if (dosyaUzantısı == "xls") return DocumentFormat.Xls;



            if (dosyaUzantısı == "xlsx") return DocumentFormat.OpenXml;

            return DocumentFormat.Undefined;

        }

        protected void cboKurumTipi_SelectedIndexChanged(object sender, EventArgs e)
        {
            DenetimDbContext dc = new DenetimDbContext();
            FORM_TANIM form_tanım = dc.FORM_TANIMs.Where(c => c.FormAd == cboFormSeç.Text).SingleOrDefault();
            Kullanicilar kul = (Kullanicilar)Session["Kullanici"];
            Session["SeçiliKurumTip"] = cboKurumTipi.SelectedValue;
            sqlGetirDenetlenecekler(kul, form_tanım);


        }

        protected void cboKurumListesi_ValueChanged(object sender, EventArgs e)
        {
            if (cboKurumListesi.Value != null)
            {
                Session["DenetlenecekKurumCkys"] = cboKurumListesi.Value;
            }


            gwYatay.DataBind();

            DenetimDurumYükle();
        }





    }



}