using ShDenetim.Web.Models;
using ShDenetim.Web.Utils;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;
using ShDenetim.Models;
using DevExpress.Web.ASPxUploadControl;
using System.IO;
namespace ShDenetim.Web.AnketUygulama
{
    public partial class AnketForm : System.Web.UI.Page
    {
        public Guid? s_SatirGuid
        {
            get
            {
                if (Session["satirguid"] != null)
                    return (Guid)Session["satirguid"];
                else
                    return null;
            }
            set { Session["satirguid"] = value; }
        }

        public string AktifFormAdi { get; set; }

        public DenetimDbContext Db_Context { get; set; }
        public List<FORM_SORU> FormSoruListe { get; set; }
        public FORM_YATAYDATA YatayData { get; set; }


        public FORM_TANIM FormTanım { get; set; }

        public Kullanicilar AktifKullanıcı { get; set; }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            AktifFormAdi = (string)Session["AktifForm"];
            AktifKullanıcı = (Kullanicilar)Session["Kullanici"];

            Db_Context = new DenetimDbContext();

            string strSeçKurumKod;
            KURUMLAR_FULL secili_kurum = null;

            FormTanım = Db_Context.FORM_TANIMs.Where(c => c.FormAd == AktifFormAdi).First();


            var x = Request.QueryString["SatirGuid"];
            if (x != null) s_SatirGuid = Guid.Parse(x);


            lblUstBaslik.Text = FormTanım.FormUstBaslik;
            lblAltBaslik.Text = FormTanım.FormAltBaslik;


            if (x == null && Page.IsPostBack == false)
            {
                strSeçKurumKod = Session["DenetlenecekKurumCkys"].ToString();

                secili_kurum = Db_Context.KURUMLAR_FULLs.Where(c => c.KurumKod == strSeçKurumKod).FirstOrDefault();



                YatayData = new FORM_YATAYDATA();
                YatayData.SatirGuid = Guid.NewGuid();

                s_SatirGuid = YatayData.SatirGuid;

                YatayData.DenekAd = "";
                YatayData.AnketorId = AktifKullanıcı.KullaniciID;


                if (AktifKullanıcı.KullaniciRol == "Denetleyici2")
                    YatayData.AnketorId2 = AktifKullanıcı.KullaniciID;



                YatayData.KurumKod = (string)Session["DenetlenecekKurumCkys"];
                YatayData.IlKod = secili_kurum.IlKod.Value;


                YatayData.FormAdi = AktifFormAdi;



                Db_Context.FORM_YATAYDATAs.Add(YatayData);
                Db_Context.SaveChanges();
            }
            else
            {
                YatayData = Db_Context.FORM_YATAYDATAs.Where(c => c.SatirGuid == s_SatirGuid).FirstOrDefault();
                AktifFormAdi = YatayData.FormAdi.Trim();
            }


            FormSoruListe = Db_Context.FORM_SORUs.Where(c => c.FormAdi == AktifFormAdi).OrderBy(c => c.SoruSıraNo).ToList();



            string formAdiuzun = FormTanım.FormAdıUzun;


            FormYukle();
            Label1.Text = formAdiuzun + " Denetim Formu";

            Page.MaintainScrollPositionOnPostBack = true;

            if (AktifKullanıcı.AktifFormlar == "Tümü") return;

            string[] formKullanıcıBilgi = AktifKullanıcı.AktifFormlar.Split(';').Where(c => c.ToString().Contains(AktifFormAdi)).First().Split('|');

            if (formKullanıcıBilgi.Length == 2)
            {
                if (formKullanıcıBilgi[1] == "R")
                {
                    if (YatayData.AnketorId != AktifKullanıcı.KullaniciID)
                    {
                        btnKaydet.Enabled = false;
                    }

                }
            }


        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        private void FormYukle()
        {


            Panel1.CssClass = "sorularPanel";

            Kullanicilar kul = (Kullanicilar)Session["Kullanici"];
            if (kul.KullaniciRol == "Ism")
            {
                btnKaydet.Enabled = true;
                Button4.Enabled = true;
            }


            List<FORMSORU_GRUP> listeGrup = Db_Context.FORMSORU_GRUPs.Where(c => c.FormKod == this.AktifFormAdi).ToList();


            foreach (FORMSORU_GRUP item in listeGrup)
            {

                Panel p_level1 = new Panel();
                Label grupBaslik = new Label { Text = item.FormSoruGrupBaslik };

                grupBaslik.CssClass = item.BaslikCssSinif;
                grupBaslik.Style.Value = item.BaslikSitil;
                p_level1.ID = item.FormSoruGrupKod;

                p_level1.Style.Value = item.KutuSitil;
                p_level1.CssClass = item.KutuCssSinif;

                p_level1.Controls.Add(grupBaslik);
                Panel1.Controls.Add(p_level1);



                if (item.YetkiliRoller != null)
                {
                    string[] yetkiler = item.YetkiliRoller.Split(';');
                    var yetkiliMi = yetkiler.Where(c => c.ToString().Split('|')[0] == kul.KullaniciRol).SingleOrDefault();

                    if (yetkiliMi != null)
                    {
                        p_level1.Visible = true;
                        if (yetkiliMi.Contains('|') && yetkiliMi.Split('|')[1] == "R")
                            p_level1.Enabled = false;
                    }
                    else
                        p_level1.Visible = false;

                }

                if (kul.KullaniciRol == "Daire") { p_level1.Visible = true; p_level1.Enabled = true; }


            }


            foreach (var soru in FormSoruListe)
            {


                Panel p = new Panel();
                p.CssClass = "soruPanel";
                p.ID = "Panel_" + soru.SoruKod;


                if (soru.KutuSitil != null)
                {
                    p.Style.Value = soru.KutuSitil;
                    if (soru.KutuSitil.Contains("myReadonly"))
                        p.Enabled = false;
                    else
                        p.Enabled = true;
                }


                Label soruBaslik = new Label();
                soruBaslik.Style.Value = soru.SoruBaslikSitil;

                if (soru.SoruGrup == "FormTemelBilgileri")
                    soruBaslik.Text = soru.Soru;
                else
                    soruBaslik.Text = soru.SoruKod + "." + soru.Soru;


                p.Controls.Add(soruBaslik);


                if (soru.KontrolType == "ICD10" || soru.KontrolType == "CkysKurum")
                {
                    Icd10 icd = LoadControl("Icd10.ascx") as Icd10;
                    icd.VeriTabloAdi = soru.KontrolType;

                    icd.ID = soru.SoruKod;

                    TextBox t = icd.TextBox1x;

                    t.CssClass = "soruFields";

                    if (soru.KontrolSitil != null)
                        t.Style.Value = soru.KontrolSitil;


                    t.Text = (string)NesneIslemleri.NesneOzellikDegerGetir(YatayData, soru.SoruKod);


                    p.Controls.Add(soruBaslik);
                    p.Controls.Add(icd);



                }



                else if (soru.KontrolType == "MetinKutusu")
                {

                    TextBox t = new TextBox();

                    t.CssClass = "soruFields";

                    if (soru.KontrolSitil != null)
                        t.Style.Value = soru.KontrolSitil;

                    t.ID = soru.SoruKod;
                    t.Text = (string)NesneIslemleri.NesneOzellikDegerGetir(YatayData, soru.SoruKod);
                    p.Controls.Add(soruBaslik);

                    p.Controls.Add(t);



                }
                else if (soru.KontrolType == "TarihKutusu")
                {
                    ASPxDateEdit t = new ASPxDateEdit();
                    t.EditFormat = EditFormat.Custom;
                    t.EditFormatString = "dd/MM/yyyy";
                    t.MinDate = new DateTime(2000, 1, 1);
                    t.NullText = "gün/ay/yıl";
                    t.UseMaskBehavior = true;



                    t.CssClass = "soruFields";

                    if (soru.KontrolSitil != null)
                        t.Style.Value = soru.KontrolSitil;

                    t.ID = soru.SoruKod;
                    t.Text = (string)NesneIslemleri.NesneOzellikDegerGetir(YatayData, soru.SoruKod);
                    p.Controls.Add(soruBaslik);

                    p.Controls.Add(t);


                }
                else if (soru.KontrolType == "Seçenek")
                {

                    RadioButtonList radioList = new RadioButtonList();

                    if (soru.KontrolSitil != null)
                    {
                        radioList.Style.Value = soru.KontrolSitil;

                        if (soru.KontrolSitil.Contains("yatay"))
                        {
                            int sutunsayısı = 0;
                            if (soru.KontrolSitil.Contains("yatay1")) sutunsayısı = 1;
                            if (soru.KontrolSitil.Contains("yatay2")) sutunsayısı = 2;
                            if (soru.KontrolSitil.Contains("yatay3")) sutunsayısı = 3;
                            if (soru.KontrolSitil.Contains("yatay4")) sutunsayısı = 4;

                            radioList.RepeatDirection = RepeatDirection.Horizontal;
                            radioList.RepeatColumns = sutunsayısı;
                        }

                        else
                            radioList.RepeatDirection = RepeatDirection.Vertical;
                    }


                    List<string> secenek = soru.Şıklar.Split(';').ToList();


                    foreach (var sec in secenek)
                    {
                        ListItem eleman = new ListItem { Text = sec, Value = sec };
                        radioList.Items.Add(eleman);
                    }
                    radioList.ID = soru.SoruKod;


                    p.Controls.Add(soruBaslik);
                    p.Controls.Add(radioList);


                    var deger = NesneIslemleri.NesneOzellikDegerGetir(YatayData, soru.SoruKod);

                    if (deger != null)
                    {
                        radioList.SelectedValue = deger.ToString();
                    }

                    if (soru.AltSoruKodlari != null)
                    {
                        radioList.Attributes["altSorular"] = soru.AltSoruKodlari;

                        radioList.SelectedIndexChanged += radioList_SelectedIndexChanged;

                        radioList.AutoPostBack = true;
                        radioList.ID = soru.SoruKod;
                    }

                }
                else if (soru.KontrolType == "AçılırKutu")
                {

                    DropDownList combo = new DropDownList();
                    combo.CssClass = "soruFields";

                    if (soru.KontrolSitil != null) combo.Style.Value = soru.KontrolSitil;


                    List<string> secenek = soru.Şıklar.Split(';').ToList();


                    var deger = NesneIslemleri.NesneOzellikDegerGetir(YatayData, soru.SoruKod);

                    // eklerken gizli enter new satır elementleri silinmeli yoksa viewstate seçili kayıdı geri getiremeiyor.



                    foreach (var sec in secenek)
                    {
                        string secdeger = sec.Trim().TemizMetin();

                        string değer_key = secdeger;
                        string değer_text = "";

                        if (secdeger.Contains('|'))
                            değer_text = secdeger.Split('|')[1].ToString();
                        else
                            değer_text = secdeger;

                        ListItem eleman = new ListItem { Text = değer_text, Value = değer_key };
                        combo.Items.Add(eleman);
                    }

                    if (deger != null) combo.SelectedValue = deger.ToString();

                    combo.ID = soru.SoruKod;

                    p.Controls.Add(soruBaslik);

                    p.Controls.Add(combo);
                    p.Controls.Add(new LiteralControl("<br />"));

                    if (soru.AltSoruKodlari != null)
                    {
                        combo.Attributes["altSorular"] = soru.AltSoruKodlari;

                        combo.SelectedIndexChanged += combo_SelectedIndexChanged;

                        combo.AutoPostBack = true;
                        combo.ID = soru.SoruKod;
                    }



                    if (soru.SoruFiltre != null)
                    {
                        Panel grupPanel = Panel1.FindControl(soru.SoruGrup) as Panel;

                        var anaSoruCombo = grupPanel.FindControl(soru.SoruFiltre) as DropDownList;

                        string parentKey = anaSoruCombo.SelectedValue.Split('|')[0].TemizMetin();

                        anaSoruCombo.AutoPostBack = true;

                        List<ListItem> liste = new List<ListItem>();

                        foreach (ListItem item in combo.Items)
                        {
                            if (item.Value.Split('|')[0].TemizMetin() == parentKey)
                            {
                                liste.Add(item);
                            }
                        }

                        combo.Items.Clear();


                        foreach (ListItem item in liste)
                        {
                            combo.Items.Add(new ListItem { Value = item.Value, Text = item.Text });
                        }

                        if (deger != null) combo.SelectedValue = deger.ToString();



                    }




                }
                else if (soru.KontrolType == "OnayKutusu")
                {

                    CheckBoxList checkList = new CheckBoxList();
                    checkList.CssClass = "soruFields";

                    if (soru.KontrolSitil != null)
                    {
                        checkList.Style.Value = soru.KontrolSitil;

                        if (soru.KontrolSitil.Contains("yatay"))
                        {

                            int sutunsayısı = 0;
                            if (soru.KontrolSitil.Contains("yatay1")) sutunsayısı = 1;
                            if (soru.KontrolSitil.Contains("yatay2")) sutunsayısı = 2;
                            if (soru.KontrolSitil.Contains("yatay3")) sutunsayısı = 3;
                            if (soru.KontrolSitil.Contains("yatay4")) sutunsayısı = 4;

                            checkList.RepeatDirection = RepeatDirection.Horizontal;

                            checkList.RepeatColumns = sutunsayısı;

                        }

                        else
                            checkList.RepeatDirection = RepeatDirection.Vertical;
                    }

                    checkList.EnableViewState = true;


                    List<string> secenek = soru.Şıklar.Split(';').ToList();
                    String[] degerOnayListe = null;

                    var degerOnay = NesneIslemleri.NesneOzellikDegerGetir(YatayData, soru.SoruKod);

                    if (degerOnay != null)
                        degerOnayListe = degerOnay.ToString().TrimEnd(';').Split(';');

                    if (soru.AltSoruKodlari != null)
                    {
                        checkList.AutoPostBack = true;
                        checkList.SelectedIndexChanged += checkList_SelectedIndexChanged;
                    }


                    foreach (var sec in secenek)
                    {
                        ListItem eleman = new ListItem { Text = sec, Value = sec };

                        if (degerOnayListe != null)
                        {
                            bool varMi = degerOnayListe.Where(c => c.ToString().Trim() == sec.Trim()).FirstOrDefault() != null;
                            eleman.Selected = varMi;
                        }

                        checkList.Items.Add(eleman);
                    }

                    checkList.ID = soru.SoruKod;

                    p.Controls.Add(soruBaslik);
                    p.Controls.Add(checkList);


                }

                PaneleEkle(soru, p);

                if (soru.YetkiliRoller != null && soru.YetkiliRoller.Length>0)
                {
                    string[] yetkiler = soru.YetkiliRoller.Split(';');
                    var yetkiliMi = yetkiler.Where(c => c.ToString() == kul.KullaniciRol).SingleOrDefault();

                    if (yetkiliMi != null)
                    {
                        p.Visible = true;
                        if (yetkiliMi.Contains('|') && yetkiliMi.Split('|')[1] == "R")
                            p.Enabled = false;
                    }
                    else
                        p.Visible = false;

                }

                if (kul.KullaniciRol == "Daire") { p.Visible = true; p.Enabled = true; }


            }


            List<FORM_SORU> altsoruluSoruListe = FormSoruListe.Where(c => !String.IsNullOrEmpty(c.AltSoruKodlari)).OrderBy(c => c.SoruSıraNo).ToList();


            foreach (FORM_SORU soru in altsoruluSoruListe)
            {
                string soru_cevap = (string)NesneIslemleri.NesneOzellikDegerGetir(YatayData, soru.SoruKod);

                if (soru.KontrolType == "AçılırKutu")
                    AltSoruGorunurlukKontrolEt(soru, soru_cevap, "tekkosul");
                else
                    AltSoruGorunurlukKontrolEt(soru, soru_cevap);
            }



        }

        private void combo_SelectedIndexChanged_Filtre(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        private void PaneleEkle(FORM_SORU soru, Panel p)
        {
            if (soru.SoruaçıklamaOlsunMu != null && soru.SoruaçıklamaOlsunMu.Value)
            {
                string metinKutuDeğeri = "";

                if (YatayData.SoruAçıklamaBirleşik != null)
                {
                    string[] soruAçıklamaBirleşik = YatayData.SoruAçıklamaBirleşik.Split('|');

                    string soruAciklamasi = soruAçıklamaBirleşik.Where(c => c.ToString().Split(':')[0] == soru.SoruKod).SingleOrDefault();
                    if (soruAciklamasi != null)
                    {
                        metinKutuDeğeri = soruAciklamasi.Replace(soru.SoruKod + ":", "");
                    }


                }


                TextBox t = new TextBox();


                t.TextMode = TextBoxMode.MultiLine;
                t.Wrap = true;

                t.ID = soru.SoruKod + "A";



                t.Text = metinKutuDeğeri;

                t.Width = 400;
                t.Height = 35;
                p.Controls.Add(t);


            }


            if (soru.SoruDosyaEkOlsunMu != null && soru.SoruDosyaEkOlsunMu.Value)
            {
                string metinKutuDeğeri = "";

                if (YatayData.SoruDosyaEkBirleşik != null)
                {
                    string[] soruEkAçıklamaBirleşik = YatayData.SoruDosyaEkBirleşik.Split('|');

                    string soruEkAciklamasi = soruEkAçıklamaBirleşik.Where(c => c.ToString().Split(':')[0] == soru.SoruKod).SingleOrDefault();
                    if (soruEkAciklamasi != null)
                    {
                        metinKutuDeğeri = soruEkAciklamasi.Replace(soru.SoruKod + ":", "");
                    }

                }

                Label lblUploadSonuc = new Label();
                lblUploadSonuc.ID = "lblDosyaEk_" + soru.SoruKod;
                lblUploadSonuc.ClientIDMode = ClientIDMode.Static;
                lblUploadSonuc.Text = metinKutuDeğeri;

                HiddenField hidlblUploadSonuc = new HiddenField();
                hidlblUploadSonuc.ID = "hidDosyaEk_" + soru.SoruKod;
                hidlblUploadSonuc.ClientIDMode = ClientIDMode.Static;
                hidlblUploadSonuc.Value = lblUploadSonuc.Text;

                ASPxUploadControl up_cnt = new ASPxUploadControl();
                up_cnt.ID = "upload_" + soru.SoruKod;
                up_cnt.UploadMode = UploadControlUploadMode.Auto;
                up_cnt.ClientSideEvents.FileUploadComplete = "function(s, e){clientASPxUploadControl1_OnFileUploadComplete(e," + lblUploadSonuc.ID + ");}";
                up_cnt.ClientSideEvents.TextChanged = "function(s, e){clientASPxUploadControl1_OnTextChanged(s,e);}";
                up_cnt.ValidationSettings.AllowedFileExtensions = ".jpg,.jpeg,.jpe,.gif,.png,.pdf".Split(',');
                up_cnt.TextBoxStyle.CssClass = "UploadTextBoxHide";
                up_cnt.CssClass = "UploadControlDosyaEk";
                up_cnt.Width = new Unit("1%");
                up_cnt.TextBoxStyle.HorizontalAlign = HorizontalAlign.Right;
                up_cnt.BrowseButton.Text = "Dosya Ekle/Değiştir";


                string UploadDirectory = "~/AnketUygulama/UploadFiles/";

                up_cnt.FileUploadComplete += new EventHandler<FileUploadCompleteEventArgs>((s, arg) =>
                {


                    string guid5Hane = YatayData.SatirGuid.ToString().Substring(0, 6);
                    
                    string extension = Path.GetExtension(arg.UploadedFile.FileName);
                    string yeniDesen = "_" + soru.FormAdi + "_" + guid5Hane + "_" + soru.SoruKod;


                    string sadecefileName = arg.UploadedFile.FileName.ToLower().Replace(' ', '_').Replace('+','_').Replace('(','_').Replace(')','_');

                    sadecefileName=sadecefileName.ToLower().Replace('ç', 'c').Replace('ö', 'o').Replace('ğ', 'g').Replace('ı', 'i').Replace('ş','s').Replace('ü','u');

                    string newUploadFileName = sadecefileName.Replace(extension, yeniDesen + extension);

                    string fileName = Path.Combine(Server.MapPath(UploadDirectory), newUploadFileName);


                    up_cnt.SaveAs(fileName);

                    string linkFilePath = UploadDirectory.TrimStart('~') + newUploadFileName;
                    string donusDeger = "<a href=" + linkFilePath + " target=_blank>" + newUploadFileName + "</a>";
                    arg.CallbackData = donusDeger;

                });

                p.Controls.Add(up_cnt);
                p.Controls.Add(lblUploadSonuc);
                p.Controls.Add(hidlblUploadSonuc);

            }


            Panel grupPanel = Panel1.FindControl(soru.SoruGrup) as Panel;
            if (grupPanel != null)
            {
                grupPanel.Controls.Add(p);
            }
            else
                Panel1.Controls.Add(p);
        }






        private void AltSoruGorunurlukKontrolEt(FORM_SORU soru, string kontrolTamDeger, string kosultip = "")
        {
            if (soru.AltSoruKodlari == null || soru.AltSoruKodlari.Length==0) return;
            string[] altSoruDizi = soru.AltSoruKodlari.Split('|');

            foreach (var item in altSoruDizi)
            {
                string[] altSoruKodlari = item.Split(':')[1].Split(';');
                string kosulCevap = item.Split(':')[0].Trim();

                bool kosulSaglandi = false;

                if (kontrolTamDeger != null) kosulSaglandi = kontrolTamDeger.Contains(kosulCevap);

                foreach (var soruKod in altSoruKodlari)
                {
                    WebControl t = Panel1.FindControl("Panel_" + soruKod) as WebControl;
                    if (t == null) return;
                    t.Enabled = kosulSaglandi;
                }

                if (kosulSaglandi && kosultip == "tekkosul") return;

            }

        }

        void combo_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList parentCombo = sender as DropDownList;
            FORM_SORU soru = FormSoruListe.Where(c => c.SoruKod == parentCombo.ID).FirstOrDefault();
            AltSoruGorunurlukKontrolEt(soru, parentCombo.Text, "tekkosul");


            FORM_SORU soruFiltrelenecek = FormSoruListe.Where(c => c.SoruFiltre == parentCombo.ID).FirstOrDefault();

            if (soruFiltrelenecek != null)
            {
                Panel grupPanel = Panel1.FindControl(soruFiltrelenecek.SoruGrup) as Panel;

                var childCombo = grupPanel.FindControl(soruFiltrelenecek.SoruKod) as DropDownList;

                List<string> secenekChildList = soruFiltrelenecek.Şıklar.Split(';').ToList();


                var parentKeyValue = parentCombo.SelectedValue.Split('|')[0].ToString().TemizMetin();


                secenekChildList = secenekChildList.Where(c => c.Split('|')[0].ToString().TemizMetin() == parentKeyValue).ToList();

                childCombo.Items.Clear();

                foreach (var item in secenekChildList)
                {
                    childCombo.Items.Add(new ListItem
                    {
                        Text = item.Split('|')[1].ToString().TemizMetin(),
                        Value = item.TemizMetin()
                    });
                }


            }

        }


        void radioList_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList cnt = sender as RadioButtonList;
            FORM_SORU sor = FormSoruListe.Where(c => c.SoruKod == cnt.ID).FirstOrDefault();
            AltSoruGorunurlukKontrolEt(sor, cnt.Text);


        }

        void checkList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckBoxList cnt = sender as CheckBoxList;
            FORM_SORU sor = FormSoruListe.Where(c => c.SoruKod == cnt.ID).FirstOrDefault();
            AltSoruGorunurlukKontrolEt(sor, NesneIslemleri.CheckListTamCevapGetir(cnt));


        }



        protected void btnKaydet_Click(object sender, EventArgs e)
        {


            List<FORM_SORU> liste = FormSoruListe.Where(c => c.FormAdi == AktifFormAdi).ToList();
            string cevapAçıklamaBirleşik = "";
            string cevapDosyaEkBirleşik = "";

            foreach (var item in liste)
            {
                string cevap = "";

                if (item.SoruaçıklamaOlsunMu != null && item.SoruaçıklamaOlsunMu == true)
                {
                    TextBox t = Panel1.FindControl(item.SoruKod + "A") as TextBox;
                    string sorucevap = t.Text.Replace(Environment.NewLine, " ");

                    if (sorucevap != "")
                    {
                        cevapAçıklamaBirleşik += item.SoruKod + ":" + sorucevap + "|";
                    }


                }

                if (item.SoruDosyaEkOlsunMu != null && item.SoruDosyaEkOlsunMu == true)
                {

                    HiddenField t = Panel1.FindControl("hidDosyaEk_" + item.SoruKod) as HiddenField;
                    string sorucevap = t.Value.Replace(Environment.NewLine, " ");

                    if (sorucevap != "")
                    {
                        cevapDosyaEkBirleşik += item.SoruKod + ":" + sorucevap + "|";
                    }


                }

                if (item.KontrolType == "MetinKutusu")
                {
                    TextBox t = Panel1.FindControl(item.SoruKod) as TextBox;
                    cevap = t.Text;
                }

                if (item.KontrolType == "TarihKutusu")
                {
                    ASPxDateEdit t = Panel1.FindControl(item.SoruKod) as ASPxDateEdit;
                    cevap = t.Text;
                }

                if (item.KontrolType == "ICD10" || item.KontrolType == "CkysKurum")
                {
                    var t = Panel1.FindControl(item.SoruKod) as Icd10;

                    cevap = t.TextBox1x.Text;
                }

                if (item.KontrolType == "OnayKutusu")
                {
                    cevap = "";
                    CheckBoxList chkList = Panel1.FindControl(item.SoruKod) as CheckBoxList;
                    cevap = NesneIslemleri.CheckListTamCevapGetir(chkList);
                    if (cevap.Length == 0) cevap = "Boş Geçildi";

                }

                if (item.KontrolType == "Seçenek")
                {
                    RadioButtonList rbl = (RadioButtonList)Panel1.FindControl(item.SoruKod);

                    if (rbl.SelectedItem == null)
                        cevap = "Boş Geçildi";
                    else
                        cevap = rbl.SelectedItem.Text;

                }

                if (item.KontrolType == "AçılırKutu")
                {
                    DropDownList cbo = (DropDownList)Panel1.FindControl(item.SoruKod);

                    if (cbo.SelectedItem == null)
                        cevap = "Boş Geçildi";
                    else
                    {
                        if (cbo.SelectedItem.Text != cbo.SelectedItem.Value)
                        {
                            cevap = cbo.SelectedItem.Value;
                        }
                        else
                            cevap = cbo.SelectedItem.Text;

                    }

                }

                NesneIslemleri.NesneOzellikDegerAta(YatayData, item.SoruKod, cevap);



            }


            try
            {


                YatayData.SoruAçıklamaBirleşik = cevapAçıklamaBirleşik.TrimEnd('|');
                YatayData.SoruDosyaEkBirleşik = cevapDosyaEkBirleşik.TrimEnd('|');

                YatayData.KayitTar1 = DateTime.Now;
                Kullanicilar kul = (Kullanicilar)Session["Kullanici"];

                if (kul.KullaniciRol == "Denetleyici")
                    YatayData.KayıtTar_Denetleyici1 = DateTime.Now;

                if (kul.KullaniciRol == "Denetleyici2")
                    YatayData.KayıtTar_Denetleyici2 = DateTime.Now;





                Db_Context.SaveChanges();

            }
            catch (Exception ex)
            {
                lblSonuc.Text = "Hata:" + ex.Message;
            }


            Session["KaydetKapat"] = true;
            Response.Redirect("~/AnketUygulama/MainPage.aspx");


        }

        protected void btnVazgec_Click(object sender, EventArgs e)
        {
            var x = Request.QueryString["SatirGuid"];
            if (x == null)
            {
                YatayData = Db_Context.FORM_YATAYDATAs.Where(c => c.SatirGuid == s_SatirGuid).FirstOrDefault();
                Db_Context.FORM_YATAYDATAs.Remove(YatayData);
                Db_Context.SaveChanges();

            }

            Session["KaydetKapat"] = true;
            Response.Redirect("~/AnketUygulama/MainPage.aspx");

        }






    }
}