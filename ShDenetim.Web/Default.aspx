<%@ Page Title="" Language="C#" MasterPageFile="~/site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShDenetim.Web.Default" %>


<asp:Content ID="Content0" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="demo-slideshow.css" rel="stylesheet" />

    <script src="Scripts/jquery-1.8.2.js"></script>
    <script src="Scripts/jquery.cycle2.js"></script>
    <script src="Scripts/jquery.cycle2.caption2.js"></script>
    <script src="Scripts/jquery.elevatezoom.js"></script>

    <script>
        function openWindow() {
            var availableScreenHeight = 600;
            var scrollbar = "no";
            if (typeof (screen.availHeight) != 'undefined')
                availableScreenHeight = screen.availHeight - 80;
            //alert(availableScreenHeight);
            if (availableScreenHeight <= 960)
            { scrollbar = "yes"; }

            var websubem = window.open("AnketUygulama/MainPage.aspx", "Denetim", "height=" + availableScreenHeight + "px, width=1010px, top=0px; left=0px; status=yes,scrollbars=" + scrollbar + ", toolbar=no, menubar=no, location=no, resizable=yes");
            websubem.focus();
        }

    </script>
</asp:Content>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="ana-sutun">
        <iframe class="iframe1" src="hideshow.html"></iframe>

        <div>

            <div class="kutu">
                <div class="kutu-header-uzun-mavi" style="font-size: medium">
                    Haberler ›
                </div>
                <ul class="ulDuyuru">

                    <li><strong>Kolesistektomi (Safra Kesesi) Ameliyatlarının Değerlendirilmesi Çalışması Ekleri ;  </strong>

                        <br />
                        <a href="docs/EklerSafra/safrakesesi_resmiyazi.pdf" target="_blank"><strong>Resmi Yazı</strong></a>
                        <br />
                        <a href="docs/EklerSafra/safrakesesi_ameliyatlari_listesi.xls" target="_blank"><strong>Safra Kesesi Ameliyatları Veri Giriş Formu</strong></a>
                        <br />
                        <a href="docs/EklerSafra/Genel Cerrah_BeyinVeSinirCerrahi.xls" target="_blank"><strong>Genel Cerrah,Beyin ve Sinir Cerrahı İletişim Bilgileri Formu</strong></a>
                        <br />
                        <strong>Verilerin son gönderim tarihi: 22.08.2014</strong>
                        <br />
                        25.07.2014
                          <br />
                        <br />
                    </li>


                    <li><strong>Lomber Disk Hernisi (Bel Fıtığı) Ameliyatlarının Değerlendirilmesi Çalışması Ekleri ;  </strong>

                        <br />
                        <a href="docs/EklerLomber/belfitigi_resmiyazi.pdf" target="_blank"><strong>Resmi Yazı</strong></a>
                        <br />
                        <a href="docs/EklerLomber/belfitigi_ameliyatlari_listesi.xls" target="_blank"><strong>Bel Fıtığı Ameliyatları Veri Giriş Formu</strong></a>
                        <br />
                        <a href="docs/EklerLomber/Genel Cerrah_BeyinVeSinirCerrahi.xls" target="_blank"><strong>Genel Cerrah,Beyin ve Sinir Cerrahı İletişim Bilgileri Formu</strong></a>
                        <br />
                        <strong>Verilerin son gönderim tarihi: 22.08.2014</strong>
                        <br />
                        25.07.2014
                          <br />
                        <br />
                    </li>



                    <li><strong>Radyoloji hizmetlerinin etkin bir şekilde yürütülmesine yönelik genelge </strong><a href="docs/RADYOLOJİ GENELGE 2014-19.pdf" target="_blank"><strong>tıklayınız</strong></a>
                        <br />
                        27.05.2014
                          <br />
                        <br />
                    </li>

                    <li><strong>Görme Keskinliği İzleme Formu"na ulaşmak için </strong><a href="docs/GörmeKeskinliğiİzlemeFormu.xls" target="_blank"><strong>tıklayınız</strong></a>
                        <br />
                        12.02.2014
                          <br />
                        <br />
                    </li>

                    <li><strong>Yoğun Bakım Ünitelerinde uygunsuz yatışların tespit ve takibinin yapılması için
                        denetimler başlatılmıştır. 28.10.2013

                    </strong>
                        <br />
                        <br />
                        Ayrıntılar için  <a href="Haberler/YbuDenetim.aspx" target="_blank">tıklayınız</a><br />

                        <br />
                        <br />
                    </li>

                    <li><strong>Şikayet Başvurularının İncelenmesinde Uyulması Gereken Usul Ve Esaslar Hakkında İl Sağlık Müdürlüklerine Yönelik Eğitim Çalışması (Muhakkiklik Eğitimi)</strong><br />
                        <br />
                        Ayrıntılar için  <a href="Haberler/MuhakkikDuyuru.aspx" target="_blank">tıklayınız</a><br />

                        Tarih:15.04.2013 
                        <br />
                        <br />
                    </li>

                    <li><strong>&quot;Koroner Anjiyografi Denetimi&quot; 15.04.2013 tarihi itibariyle başlatılmıştır.</strong><br />
                        <br />
                        Eki için ("Elektronik imzalı Makam Onayı")  <a href="Docs/Denetimkoroner.pdf" target="_blank">tıklayınız</a><br />

                        Tarih:15.04.2013 
                        <br />
                    </li>

                    <br />

                    <li><strong>&quot;MR, BT ve MG görüntüleme hizmetlerinin değerlendirme süresi 31/05/2013 tarihine kadar uzatılmıştır. </strong>
                        <br />
                        <br />
                        Eki için ("Elektronik imzalı Makam Onayı")  <a href="Docs/DenetimUz.pdf" target="_blank">tıklayınız</a><br />

                        Tarih:07.03.2013
                        <br />
                    </li>

                    <br />

                </ul>
            </div>



        </div>

    </div>

    <div class="sag-sutun">
        <div class="kutu">
            <div class="kutu-header">
                Uygulamalar ›
            </div>

            <div>

                <ul id="uygulamaListe">

                     <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/kalcaeklem.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Kalça ve Diz Protez Uyg. </a></span>

                    </li>

                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/histerektomi.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Histerektomi Uygulaması</a></span>

                    </li>

                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/safra.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Safra Kesesi Uygulaması</a></span>

                    </li>
                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/lomber.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Bel Fıtığı Uygulaması</a></span>

                    </li>

                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/goz.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Katarakt Uygulaması</a></span>

                    </li>

                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/Radyoloji.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Radyoloji Uygulaması</a></span>

                    </li>

                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/Kardio.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Kardiyoloji Uygulaması</a></span>

                    </li>

                    <li>
                        <span><a href="AnketUygulama/HastaneForm.aspx">
                            <img alt="" src="images/Uygulama/Denetim.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Performans Yönetim Sistemi</a></span>

                    </li>



                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/DenetimYBU.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Yoğun Bakım Uygulaması</a></span>

                    </li>



                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/izleme.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />KVC İzleme</a></span>

                    </li>


                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/izleme.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Katarakt İzleme</a></span>

                    </li>
                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/izleme.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Radyoterapi izleme İzleme</a></span>

                    </li>

                    <li>
                        <span><a href="#" onclick="javascript:openWindow();">
                            <img alt="" src="images/Uygulama/izleme.png" style="vertical-align: middle; width: 32px; height: 32px; margin-right: 10px;" />Antibiyotik İzleme</a></span>


                    </li>

                    <li></li>

                    <li><span><a href="http://shdenetim.saglik.gov.tr/#" onclick="javascript:openWindow();">
                        <img alt="" src="http://shdenetim.saglik.gov.tr/images/Uygulama/izleme.png" style="width: 32px; height: 32px; margin-right: 10px; vertical-align: middle;" />İl Denetim Uygulamaları</a></span> </li>
                    <li><span><a href="http://shdenetim.saglik.gov.tr/#" onclick="javascript:openWindow();">
                        <img alt="" src="http://shdenetim.saglik.gov.tr/images/Uygulama/izleme.png" style="width: 32px; height: 32px; margin-right: 10px; vertical-align: middle;" />Kurumsal Karne</a></span> </li>



                </ul>





            </div>
        </div>
        <div>
            <div class="kutu">
                <div class="kutu-header">
                    Basından Haberler ›
                </div>

                <div>

                    <ul id="Ul1">

                        <li>
                            <a href="http://www.takvim.com.tr/Ekonomi/2014/08/19/ozel-hastanelere-cat-kapi-denetim"
                                target="_blank">Özel hastanelere çat kapı denetim
                                <br />
                                (19/08/2014)

                            </a>
                            <br />

                            &nbsp

                        </li>
                        <li>
                            <a href="http://gundem.milliyet.com.tr/gereksiz-sezaryen-ve-anjiyoya-ceza/gundem/detay/1826952/default.htm"
                                target="_blank">Gereksiz sezaryen ve anjiyoya ceza
                                <br />
                                (25/01/2014)

                            </a>
                            <br />

                            &nbsp

                        </li>

                        <li>
                            <a href="http://www.haberler.com/saglik-bakanligi-hekim-ve-hastanelere-2014-sonunda-5584873-haberi/"
                                target="_blank">Sağlık Bakanlığı, Hekim ve Hastanelere 2014 Sonunda Performans Karnesi Verecek
                                <br />
                                (24/01/2014)

                            </a>
                            <br />

                            &nbsp

                        </li>






                        <li>
                            <a href="http://www.hurriyet.com.tr/ekonomi/25376660.asp"
                                target="_blank">"Katarakt Operasyonu"
                                <br />
                                Bakanlık vurgun iddiaları sonrası katarakt ameliyatlarını incelemeye aldı"
                                <br />
                                (Hürriyet-17/12/2013)

                            </a>
                            <br />

                            &nbsp

                        </li>

                        <li>

                            <a href="http://www.memurlar.net/haber/434613/"
                                target="_blank">Katarakt ameliyatları mercek altına alındı (29/11/2013)
                          

                            </a>
                            <br />

                            &nbsp

                        </li>


                        <li>

                            <a href="http://www.medimagazin.com.tr/ana-sayfa/guncel/tr-turkiyede-en-cok-beyin-tomografisi-cekiliyor-1-11-53731.html"
                                target="_blank">Genel müdürümüz Prof.Dr. İrfan ŞENCAN'ın radyoloji denetimleri sonuçlarına ilişkin röpörtajı

                            </a>



                        </li>



                    </ul>





                </div>
            </div>

        </div>

        <div>
            <div class="kutu">
                <div class="kutu-header">
                    Yayınlarımız ›
                </div>

                <div class="cycle-slideshow"
                    data-cycle-fx="scrollHorz"
                    data-cycle-timeout="5000"
                    data-cycle-caption-plugin="caption2"
                    data-cycle-overlay-fx-out="slideUp"
                    data-cycle-overlay-fx-in="slideDown"
                    data-cycle-caption-template="{{slideNum}} / {{slideCount}}">


                    <div class="cycle-pager"></div>

                    <img src="images/Yayinlarimiz/p1.jpg" data-cycle-desc="Sonnenberg Gardens" />
                    <img src="images/Yayinlarimiz/p2.jpg" data-cycle-desc="Sonnenberg Gardens" />
                    <img src="images/Yayinlarimiz/p3.jpg" data-cycle-desc="Sonnenberg Gardens" />
                    <img src="images/Yayinlarimiz/p4.jpg" data-cycle-desc="Sonnenberg Gardens" />
                    <img src="images/Yayinlarimiz/p5.jpg" data-cycle-desc="Sonnenberg Gardens" />
                    <img src="images/Yayinlarimiz/p6.jpg" data-cycle-desc="Sonnenberg Gardens" />


                    <%--    <div class="cycle-overlay"></div>--%>
                </div>




                <script>
                    //$(".cycle-slideshow>img").elevateZoom({
                    //    zoomType: "lens",
                    //    lensShape: "round",
                    //    lensSize: 150,
                    //    zindex: 0,
                    //});
                </script>

            </div>
        </div>
    </div>
</asp:Content>
