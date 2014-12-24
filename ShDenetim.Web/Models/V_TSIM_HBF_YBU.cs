using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ShDenetim.Models
{
    public partial class V_TSIM_HBF_YBU
    {
        [Key]
        public int ID { get; set; }
        public int? KURUMCKYS { get; set; }
        public string KURUMAD { get; set; }

        public string YBU { get; set; }
      

        public string ILAD { get; set; }

        public string ILKOD { get; set; }
    }
}
