using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShDenetim.Web.Models
{
    [Table("Kullanicilar")]
    public class Kullanicilar
    {
        
        public int Id { get; set; }

        [Key]
        public string KullaniciID { get; set; }
        public string KullaniciAdSoyad { get; set; }
        public string Parola { get; set; }
        public string Mail { get; set; }
        public string KullaniciRol { get; set; }
        public Nullable<System.Guid> Kimlik { get; set; }
        public Nullable<bool> AktifMi { get; set; }
        public string Adres { get; set; }
        public string Tel { get; set; }
        public string Unvan { get; set; }
        public string Brans { get; set; }
        public string IlgiAlani { get; set; }
        public string KurumKod { get; set; }
        public int? IlKod{get;set;}
        public string AktifFormlar { get; set; }

        [ForeignKey("IlKod")]
        public virtual ILPLAKA ILPLAKA { get; set; }

    }
}
