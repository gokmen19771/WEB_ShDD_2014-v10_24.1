using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;


namespace ShDenetim.Web.Models
{

      [Table("vwDenetleyiciAtamaBilgi")]
    public class vwDenetleyiciAtamaBilgi
    {
          [Key]
        public Guid Guid { get; set; }
        public string FormAdi { get; set; }
        
        public string KullaniciAdSoyad { get; set; }
        public string DenetleyeceğiKurum { get; set; }
        public int Denetlediğiİl { get; set; }
        public string Adres { get; set; }
        public string Tel { get; set; }
        public string KendiKurumu { get; set; }
        public int HastaSayısı { get; set; }
        public string Unvan { get; set; }
        public string Brans { get; set; }
        public string IlgiAlani { get; set; }
        public int? IlKod { get; set; }
        public string KurumKod { get; set; }
        public string IlAd { get; set; }
        public string Mail { get; set; }

    }
}