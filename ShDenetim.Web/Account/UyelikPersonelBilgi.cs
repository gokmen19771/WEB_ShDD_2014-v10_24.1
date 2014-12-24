using ShDenetim.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PersonelBilgi
/// </summary>
/// 
namespace ShDenetim.Web.Account
{
    public class UyelikPersonelBilgi
    {
        public static Kullanicilar PersonelBilgiGetir(string TcKimlik)
        {
            DenetimDbContext db = new DenetimDbContext();
            return db.Kullanicilars.Where(c => c.KullaniciID == TcKimlik).FirstOrDefault();
        }

        public static Kullanicilar UyeBilgiGetirFromAktifMail(string aktifMail)
        {
            DenetimDbContext db = new DenetimDbContext();
            return db.Kullanicilars.Where(c => c.Mail == aktifMail).FirstOrDefault();
        }

        public static Kullanicilar UyeBilgiGetirFromGuid(Guid row_guid)
        {
            DenetimDbContext db = new DenetimDbContext();
            return db.Kullanicilars.Where(c => c.Kimlik == row_guid).FirstOrDefault();
        }

        public static Kullanicilar UyeBilgiGetirFromTc(string tcKimlikNo)
        {
            DenetimDbContext db = new DenetimDbContext();
            return db.Kullanicilars.Where(c => c.KullaniciID == tcKimlikNo).FirstOrDefault();
        }

        public static bool sifreDegistir(string yeniSifre, string row_guid)
        {
            DenetimDbContext db = new DenetimDbContext();



            Guid g = new Guid(row_guid);

            try
            {
                var v = db.Kullanicilars.Where(c => c.Kimlik == g).FirstOrDefault();
            
                v.Parola = yeniSifre;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        public static bool sifreDegistirFromTc(string yeniSifre, string tcKimlikNo)
        {
            DenetimDbContext db = new DenetimDbContext();


            try
            {
                var v = db.Kullanicilars.Where(c => c.KullaniciID == tcKimlikNo).FirstOrDefault();
               

                v.Parola= yeniSifre;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

    }
}
