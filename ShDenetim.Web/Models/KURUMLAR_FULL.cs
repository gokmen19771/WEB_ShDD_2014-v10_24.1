using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShDenetim.Web.Models
{
    public partial class KURUMLAR_FULL
    {
        [Key]
        public int Id { get; set; }
        public string KurumKod { get; set; }
        public string Kurum { get; set; }
        public string Rol { get; set; }
        public Nullable<int> IlKod { get; set; }
        public string İl { get; set; }
        public string İlçe { get; set; }
        public string KurumTur { get; set; }
        public string SaglikBolgesi { get; set; }
        public string İlliKurum { get; set; }
        public string İlliKurumT { get; set; }
        public Nullable<int> KOD_ILCE { get; set; }
        public Nullable<int> TIPI_SAHIBI { get; set; }
        public Nullable<int> KURUMTURU_KOD { get; set; }
        public string KURUMTURU_AD { get; set; }
        public Nullable<int> KURUM_TIPI_KOD { get; set; }
        public string KURUM_TIPI_AD { get; set; }
        public string FAALDURUM { get; set; }

     

        public string GörüneceğiFormlar { get; set; }
        public string GörüneceğiFormlar1 { get; set; }
        
    }
}