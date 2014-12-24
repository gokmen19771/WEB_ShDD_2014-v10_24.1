using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShDenetim.Web.Models
{
    [Table("FORM_SORU")]
    public class FORM_SORU
    {
        [Key]
        
        public int Id { get; set; }
        public string FormAdi { get; set; }
        public string SoruKod { get; set; }
        public string Soru { get; set; }
        public string SoruTip { get; set; }
        public bool? GridAnaSutun { get; set; }
        public int SoruSıraNo { get; set; }

        public string KontrolType { get; set; }
        public string HesapFonksiyon { get; set; }
        public string SoruAçıklama { get; set; }
        public string Şıklar { get; set; }
        public string ŞıkKontrolList { get; set; }
        public string Güncelleyen { get; set; }
        public Nullable<System.DateTime> GüncellenmeTarihi { get; set; }

        public string AltSoruKodlari { get; set; }

        public string KutuSitil { get; set; }
        public string KontrolSitil { get; set; }

        public string SoruGrup { get; set; }

        public string KutuCssSinif { get; set; }
        public string KontrolCssSinif { get; set; }

        public string SoruBaslikSitil { get; set; }

        public string YetkiliRoller { get; set; }

        public bool? SoruaçıklamaOlsunMu { get; set; }

        public string ExcelBaşlıkHücreKonum { get; set; }

        public bool? ZorunluMu { get; set; }

        public int? Uzunluk { get; set; }

        public string SoruFiltre { get; set; }

        public bool? SoruDosyaEkOlsunMu { get; set; }

      
        


    }
}
