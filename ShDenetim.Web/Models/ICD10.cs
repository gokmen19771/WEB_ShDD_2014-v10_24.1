using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShDenetim.Web.Models
{
    [Table("ICD10")]
    public class ICD10
    {
        [Key]
        public string ICDKOD { get; set; }
        public string ICD_HastalikAdi { get; set; }
        public string Aciklama { get; set; }
      
    }
}
