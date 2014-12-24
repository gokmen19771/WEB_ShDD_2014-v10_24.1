using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ShDenetim.Web.Models
{
      [Table("FORMSORU_GRUP")]
    public class FORMSORU_GRUP
    {
        [Key]
        public int Id { get; set; }
        public string FormKod { get; set; }
        public string FormSoruGrupKod { get; set; }
        public string FormSoruGrupBaslik { get; set; }
        public string KutuSitil { get; set; }
        public string BaslikSitil { get; set; }

        public string KutuCssSinif { get; set; }
        public string BaslikCssSinif { get; set; }

        public string YetkiliRoller { get; set; }
        
    }
}
	