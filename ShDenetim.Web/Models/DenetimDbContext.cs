using ShDenetim.Models;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace ShDenetim.Web.Models
{
    public class DenetimDbContext : DbContext
    {
        static DenetimDbContext()
        {
            Database.SetInitializer<DenetimDbContext>(null);
        }

		public DenetimDbContext()
			: base("Name=DenetimDbContext")
		{
		}

   
        public DbSet<FORM_SORU> FORM_SORUs { get; set; }
        public DbSet<FORM_TANIM> FORM_TANIMs { get; set; }
        public DbSet<FORM_YATAYDATA> FORM_YATAYDATAs { get; set; }
        public DbSet<ILPLAKA> ILPLAKAs { get; set; }
        public DbSet<Kullanicilar> Kullanicilars { get; set; }
        public DbSet<FORMSORU_GRUP> FORMSORU_GRUPs { get; set; }
        public DbSet<ICD10> ICD10s { get; set; }
        public DbSet<KURUM_LISTESI> KURUM_LISTESIs { get; set; }
        public DbSet<vwDenetleyiciAtamaBilgi> vwDenetleyiciAtamaBilgis { get; set; }

        public DbSet<V_TSIM_HBF_YBU> V_TSIM_HBF_YBUs { get; set; }

        public DbSet<DENETİM_KURUM_DURUM> DENETİM_KURUM_DURUMs { get; set; }

        public DbSet<KURUMLAR_FULL> KURUMLAR_FULLs { get; set; }

        public DbSet<KURUMTIPKODLARI> KURUMTIPKODLARIs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

        }
    }
}
