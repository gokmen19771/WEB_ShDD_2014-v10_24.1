using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI.WebControls;

namespace ShDenetim.Web.Utils
{

    public static class MyExtensions
    {
        public static string TemizMetin(this String str)
        {
            return str.Replace("\n", "").Replace("\r", "");
        }
    }   

    
    public class NesneIslemleri
    {

     

        public static void NesneOzellikDegerAta(object o, string ozellik, object deger)
        {
            PropertyInfo[] p = o.GetType().GetProperties();
            PropertyInfo pinfo = p.Where(c => c.Name == ozellik).FirstOrDefault();



            pinfo.SetValue(o, deger, null);
        }

        public static object NesneOzellikDegerGetir(object o, string ozellik)
        {
            PropertyInfo[] p = o.GetType().GetProperties();
            PropertyInfo pinfo = p.Where(c => c.Name == ozellik).FirstOrDefault();


            return pinfo.GetValue(o, null);

        }

        public static string CheckListTamCevapGetir(CheckBoxList chkList)
        {
            string cevap = "";
            foreach (ListItem chk in chkList.Items)
            {
                cevap += chk.Selected ? chk.Value + "; " : "";
            }


            return cevap.TrimEnd(';');
        }




    }
}