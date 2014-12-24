using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShDenetim.Web.Models
{
    public class DENETİM_KURUM_DURUM
    {
        [Key]
        public int Id { get; set; }
        public string KurumDenetimDurum { get; set; }
        public string KurumCkys { get; set; }
        public string FormAdi { get; set; }

        public string Aciklama { get; set; }


    }
}