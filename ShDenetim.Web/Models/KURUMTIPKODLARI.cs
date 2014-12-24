using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShDenetim.Web.Models
{
    public partial class KURUMTIPKODLARI
    {
        [Key]
        public int KURUMTURU_KOD { get; set; }
        public string KURUMTURU_AD { get; set; }
        public Nullable<bool> SEC { get; set; }
    }
}