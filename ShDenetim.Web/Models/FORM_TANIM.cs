using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShDenetim.Web.Models
{
      [Table("FORM_TANIM")]
    public class FORM_TANIM
    {
        [Key]
      
        public int Id { get; set; }
        public string FormAdıUzun { get; set; }
    
        public string FormAd { get; set; }
    
        public DateTime FormBitisTar { get; set; }

        public string AltUniteListesi { get; set; }

        public string YetkiliRoller { get; set; }

        public string DenetimTipi { get; set; }



        public string FormUstBaslik { get; set; }
        public string FormAltBaslik { get; set; }
    }
}
