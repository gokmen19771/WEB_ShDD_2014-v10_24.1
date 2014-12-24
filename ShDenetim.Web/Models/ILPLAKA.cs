using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShDenetim.Web.Models
{
    [Table("ILPLAKA")]
    public class ILPLAKA
    {
        [Key]
        public int IlKod { get; set; }
        public string IlAd { get; set; }
        public string UstBolge { get; set; }
        public Nullable<double> GenelToplam { get; set; }
        public Nullable<double> CocukToplam { get; set; }
        public Nullable<double> Erişkin { get; set; }
    }
}
