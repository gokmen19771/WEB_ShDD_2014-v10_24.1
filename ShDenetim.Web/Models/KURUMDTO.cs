using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShDenetim.Web.Models
{
    public class KURUMDTO
    {
        [Key]
        public string  KURUMCKYS { get; set; }
        public string KURUMAD { get; set; }

        public string ILAD { get; set; }
        public string ILCEAD { get; set; }
    }
}