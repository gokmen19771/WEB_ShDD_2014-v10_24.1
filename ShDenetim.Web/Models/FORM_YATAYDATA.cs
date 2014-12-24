using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShDenetim.Web.Models
{
    
    [Table("FORM_YATAYDATA")]
    public class FORM_YATAYDATA
    {
        [Key]
        public int Id { get; set; }
        public string FormAdi { get; set; }
        public string DenetlemeTar { get; set; }

        [ForeignKey("AnketorId")]
        public virtual Kullanicilar Kullanici { get; set; }

        [ForeignKey("KurumKod")]
        public virtual KURUM_LISTESI KurumBilgi { get; set; }


        public string AnketorId { get; set; }

        public string AnketorId2 { get; set; }
        [ForeignKey("AnketorId2")]
        public virtual Kullanicilar Kullanici2 { get; set; }

        public string DenekAd { get; set; }
        public string KurumKod { get; set; }
        public Guid SatirGuid { get; set; }
        public int IlKod { get; set; }
       
        [ForeignKey("IlKod")]
        public virtual ILPLAKA ILPLAKA { get; set; }

        public string ProtokolNo { get; set; }
        public string GeciciAlan { get; set; }

       
        public bool? CdVarMi { get; set; }
        public bool? KargoyaVerildi { get; set; }

        public DateTime? KayitTar1 { get; set; }

        public string SoruDosyaEkBirleşik { get; set; }

        public DateTime? KayıtTar_Denetleyici1 { get; set; }
        public DateTime? KayıtTar_Denetleyici2 { get; set; }

        public string S01 { get; set; }
        public string S02 { get; set; }
        public string S03 { get; set; }
        public string S04 { get; set; }
        public string S05 { get; set; }
        public string S06 { get; set; }
        public string S07 { get; set; }
        public string S08 { get; set; }
        public string S09 { get; set; }
        public string S10 { get; set; }
        public string S11 { get; set; }
        public string S12 { get; set; }
        public string S13 { get; set; }
        public string S14 { get; set; }
        public string S15 { get; set; }
        public string S16 { get; set; }
        public string S17 { get; set; }
        public string S18 { get; set; }
        public string S19 { get; set; }
        public string S20 { get; set; }
        public string S21 { get; set; }
        public string S22 { get; set; }
        public string S23 { get; set; }
        public string S24 { get; set; }
        public string S25 { get; set; }
        public string S26 { get; set; }
        public string S27 { get; set; }
        public string S28 { get; set; }
        public string S29 { get; set; }
        public string S30 { get; set; }
        public string S31 { get; set; }
        public string S32 { get; set; }
        public string S33 { get; set; }
        public string S34 { get; set; }
        public string S35 { get; set; }
        public string S36 { get; set; }
        public string S37 { get; set; }
        public string S38 { get; set; }
        public string S39 { get; set; }
        public string S40 { get; set; }
        public string S41 { get; set; }
        public string S42 { get; set; }
        public string S43 { get; set; }
        public string S44 { get; set; }
        public string S45 { get; set; }
        public string S46 { get; set; }
        public string S47 { get; set; }
        public string S48 { get; set; }
        public string S49 { get; set; }
        public string S50 { get; set; }
        public string S51 { get; set; }
        public string S52 { get; set; }
        public string S53 { get; set; }
        public string S54 { get; set; }
        public string S55 { get; set; }
        public string S56 { get; set; }
        public string S57 { get; set; }
        public string S58 { get; set; }
        public string S59 { get; set; }
        public string S60 { get; set; }
        public string S61 { get; set; }
        public string S62 { get; set; }
        public string S63 { get; set; }
        public string S64 { get; set; }
        public string S65 { get; set; }
        public string S66 { get; set; }
        public string S67 { get; set; }
        public string S68 { get; set; }
        public string S69 { get; set; }
        public string S70 { get; set; }
        public string S71 { get; set; }
        public string S72 { get; set; }
        public string S73 { get; set; }
        public string S74 { get; set; }
        public string S75 { get; set; }
        public string S76 { get; set; }
        public string S77 { get; set; }
        public string S78 { get; set; }
        public string S79 { get; set; }
        public string S80 { get; set; }
        public string S81 { get; set; }
        public string S82 { get; set; }
        public string S83 { get; set; }
        public string S84 { get; set; }
        public string S85 { get; set; }
        public string S86 { get; set; }
        public string S87 { get; set; }
        public string S88 { get; set; }
        public string S89 { get; set; }
        public string S90 { get; set; }
        public string S91 { get; set; }
        public string S92 { get; set; }
        public string S93 { get; set; }
        public string S94 { get; set; }
        public string S95 { get; set; }
        public string S96 { get; set; }
        public string S97 { get; set; }
        public string S98 { get; set; }
        public string S99 { get; set; }
        public string S100 { get; set; }
        public string S101 { get; set; }
        public string S102 { get; set; }
        public string S103 { get; set; }
        public string S104 { get; set; }
        public string S105 { get; set; }
        public string S106 { get; set; }
        public string S107 { get; set; }
        public string S108 { get; set; }
        public string S109 { get; set; }
        public string S110 { get; set; }
        public string S111 { get; set; }
        public string S112 { get; set; }
        public string S113 { get; set; }
        public string S114 { get; set; }
        public string S115 { get; set; }
        public string S116 { get; set; }
        public string S117 { get; set; }
        public string S118 { get; set; }
        public string S119 { get; set; }
        public string S120 { get; set; }
        public string S121 { get; set; }
        public string S122 { get; set; }
        public string S123 { get; set; }
        public string S124 { get; set; }
        public string S125 { get; set; }
        public string S126 { get; set; }
        public string S127 { get; set; }
        public string S128 { get; set; }
        public string S129 { get; set; }
        public string S130 { get; set; }
        public string S131 { get; set; }
        public string S132 { get; set; }
        public string S133 { get; set; }
        public string S134 { get; set; }
        public string S135 { get; set; }
        public string S136 { get; set; }
        public string S137 { get; set; }
        public string S138 { get; set; }
        public string S139 { get; set; }
        public string S140 { get; set; }
        public string S141 { get; set; }
        public string S142 { get; set; }
        public string S143 { get; set; }
        public string S144 { get; set; }
        public string S145 { get; set; }
        public string S146 { get; set; }
        public string S147 { get; set; }
        public string S148 { get; set; }
        public string S149 { get; set; }
        public string S150 { get; set; }
        public string S151 { get; set; }
        public string S152 { get; set; }
        public string S153 { get; set; }
        public string S154 { get; set; }
        public string S155 { get; set; }
        public string S156 { get; set; }
        public string S157 { get; set; }
        public string S158 { get; set; }
        public string S159 { get; set; }
        public string S160 { get; set; }
        public string S161 { get; set; }
        public string S162 { get; set; }
        public string S163 { get; set; }
        public string S164 { get; set; }
        public string S165 { get; set; }
        public string S166 { get; set; }
        public string S167 { get; set; }
        public string S168 { get; set; }
        public string S169 { get; set; }
        public string S170 { get; set; }
        public string S171 { get; set; }
        public string S172 { get; set; }
        public string S173 { get; set; }
        public string S174 { get; set; }
        public string S175 { get; set; }
        public string S176 { get; set; }
        public string S177 { get; set; }
        public string S178 { get; set; }
        public string S179 { get; set; }
        public string S180 { get; set; }
        public string S181 { get; set; }
        public string S182 { get; set; }
        public string S183 { get; set; }
        public string S184 { get; set; }
        public string S185 { get; set; }
        public string S186 { get; set; }
        public string S187 { get; set; }
        public string S188 { get; set; }
        public string S189 { get; set; }
        public string S190 { get; set; }
        public string S191 { get; set; }
        public string S192 { get; set; }
        public string S193 { get; set; }
        public string S194 { get; set; }
        public string S195 { get; set; }
        public string S196 { get; set; }
        public string S197 { get; set; }
        public string S198 { get; set; }
        public string S199 { get; set; }
        public string S200 { get; set; }

        public string SoruAçıklamaBirleşik { get; set; }
     
    }
}
