using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ShDenetim.Web.Models
{
    [Table("KURUM_LISTESI")]
    public class KURUM_LISTESI
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Key]
        public string KurumKod { get; set; }
        public string Rol { get; set; }
        public int IlKod { get; set; }
        public string İl { get; set; }
        public string İlçe { get; set; }
        public string KurumTur { get; set; }
        public string SaglikBolgesi { get; set; }
        public string Kurum { get; set; }
        public string İlliKurum { get; set; }
        public string İlliKurumT { get; set; }

        public int KURUMTURU_KOD { get; set; }
        public string KURUMTURU_AD { get; set; }
    }
}