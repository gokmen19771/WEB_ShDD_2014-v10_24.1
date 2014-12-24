﻿<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="ShDenetim.Web.AnketUygulama.MainPage" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx1" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallbackPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Scripts/jquery-1.8.2.js"></script>
     <script type="text/javascript">
         // <![CDATA[ 
         function button1_Click(s, e) {
             if (grid.IsCustomizationWindowVisible())
                 grid.HideCustomizationWindow();
             else
                 grid.ShowCustomizationWindow();
             UpdateButtonText();
         }
         function grid_CustomizationWindowCloseUp(s, e) {
             UpdateButtonText();
         }
         function UpdateButtonText() {
             var text = grid.IsCustomizationWindowVisible() ? "Gizle" : "Göster";
             text += " Sutun Seç";
             button1.SetText(text);
         }

         function Uploader_OnUploadStart(args) {
             $("#lblyukleniyor").show();


         }

         function Uploader_OnFileUploadComplete(args) {
             $("#lblyukleniyor").hide();
             alert(args.callbackData);

             __doPostBack("ctl00$ContentPlaceHolder1$cboKurumListesi", 4);

         }

         // ]]> 
    </script>

    <form id="form1" runat="server">
        <p>
            Hoşgeldiniz:
            <asp:LoginName ID="LoginName1" runat="server" />
            -
            <asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="Giriş" LogoutText="Güvenli Çıkış" />
            <br />
            <asp:DropDownList  Font-Bold="True"  ID="cboFormSeç" runat="server" AutoPostBack="True" Height="22px" Width="210px" OnSelectedIndexChanged="cboFormSeç_SelectedIndexChanged">
            </asp:DropDownList>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="KullaniciID" Caption="Aktif Kullanıcı">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="KullaniciID" ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="KullaniciAdSoyad" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Adres" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Tel" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mail" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="KurumKod" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:Label ID="lblUyarı" runat="server" ForeColor="#FF0066" Text="..............................................................................................................................................................................................................................."></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DenetimDbContext %>" SelectCommand="SELECT [KullaniciTc], [KullaniciAdSoyad], [AktifMi], [Adres], [Tel], [Mail], [Unvan], [Brans], [IlgiAlani], [KurumKod] FROM [Kullanicilar]"></asp:SqlDataSource>
            <dx:ASPxRoundPanel ID="panelDaireMenu" runat="server" HeaderText="Daire Menu" Visible="False" Width="407px">
                <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Account/Yonet.aspx">Kullanıcıları Yönet</asp:LinkButton>
    <br />
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/AnketUygulama/Tumu.aspx">Tüm Listeyi/Cevapları  Gör</asp:LinkButton>
    <br />
    <br />
    <asp:LinkButton ID="lnkHastaBilgi" runat="server" PostBackUrl="~/AnketUygulama/HastaBilgi.aspx">**Hasta Kayıt İşlemleri</asp:LinkButton>
    <br />
    <asp:LinkButton ID="lnkFormTanimla" runat="server" PostBackUrl="~/AnketUygulama/FormTanimla.aspx">**Form Tanımla</asp:LinkButton>
    <br />
    <asp:LinkButton ID="lnkSecimDurum" runat="server" PostBackUrl="~/AnketUygulama/SecimDurum.aspx">Dr Seçim Durumu</asp:LinkButton>
    <br />
    <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/AnketUygulama/Pivot.aspx">PivotCevaplar</asp:LinkButton>
    <br />

     <br />
    <asp:LinkButton ID="lnkKurumListesi" runat="server" PostBackUrl="~/AnketUygulama/KurumListesi.aspx">Kurum Listesi</asp:LinkButton>
    <br />

    <br />
    <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/AnketUygulama/Rapor.aspx" style="font-weight: 700">**Denetim Genel Durum</asp:LinkButton>
    <br />
                    </dx:PanelContent>
</PanelCollection>
            </dx:ASPxRoundPanel>
            <br />
    <asp:LinkButton runat="server" PostBackUrl="~/AnketUygulama/HastaBilgi.aspx" ID="lnkKayitListesi">Yapılan Kayıt Listesi</asp:LinkButton>

        </p>
        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" KeyFieldName="KullaniciID" Caption="İl Sağlık Müdürlüğü Sorumlusu">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ILPLAKA.IlAd" VisibleIndex="1" Caption="İl" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KullaniciAdSoyad" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Adres" VisibleIndex="4" Name="colAdres">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Tel" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mail" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
     
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporterAdres" runat="server" GridViewID="gwDenetleyiciDrListe">
        </dx:ASPxGridViewExporter>
     
        <dx:ASPxButton  ID="btnDenetleyiciExcel" ClientInstanceName="button1" runat="server" Text="Excel Aktar" Width="127px" Height="37px" OnClick="btnDenetleyiciExcel_Click">
                <Image Url="~/App_Themes/Mavi/images/excel.png">
            </Image>
                       
        </dx:ASPxButton>
     
        <br />
     
        <dx:ASPxGridView ID="gwDenetleyiciDrListe" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Office2010Blue" Caption="Denetleyici doktorlara ait iletişim ve denetim bilgileri">
            <Columns>
                <dx:GridViewDataTimeEditColumn FieldName="FormAdi" VisibleIndex="0">
                    <PropertiesTimeEdit DisplayFormatString="t">
                    </PropertiesTimeEdit>
                </dx:GridViewDataTimeEditColumn>
                <dx:GridViewDataTextColumn FieldName="KullaniciAdSoyad" VisibleIndex="1" Caption="Denetleyici Ad Soyad">
                    <CellStyle BackColor="Silver">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DenetleyeceğiKurum" VisibleIndex="2">
                    <CellStyle BackColor="Silver">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Adres" VisibleIndex="4" Caption="Denetleyicinin Adresi">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Tel" VisibleIndex="6" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mail" VisibleIndex="7" Caption="Mail">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KendiKurumu" VisibleIndex="8" Caption="Kurumu" Width="150px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hasta Sayısı" FieldName="HastaSayısı" VisibleIndex="3">
                    <CellStyle BackColor="Silver" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Unvan" VisibleIndex="9" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Brans" VisibleIndex="10" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IlgiAlani" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IlAd" VisibleIndex="5" Caption="İli">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager PageSize="100">
            </SettingsPager>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceKurumDurum" runat="server" ConnectionString="<%$ ConnectionStrings:DenetimDbContext %>" SelectCommand="SELECT * FROM [DENETİM_KURUM_DURUM] WHERE (([FormAdi] = @FormAdi) AND ([KurumCkys] = @KurumCkys))" UpdateCommand="UPDATE [DENETİM_KURUM_DURUM] SET [KurumDenetimDurum] = @KurumDenetimDurum, [KurumCkys] = @KurumCkys, [FormAdi] = @FormAdi, [Aciklama] = @Aciklama WHERE [Id] = @Id" DeleteCommand="DELETE FROM [DENETİM_KURUM_DURUM] WHERE [Id] = @Id" InsertCommand="INSERT INTO [DENETİM_KURUM_DURUM] ([KurumDenetimDurum], [KurumCkys], [FormAdi], [Aciklama]) VALUES (@KurumDenetimDurum, @KurumCkys, @FormAdi, @Aciklama)">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="KurumDenetimDurum" Type="String" />
                <asp:Parameter Name="KurumCkys" Type="String" />
                <asp:Parameter Name="FormAdi" Type="String" />
                <asp:Parameter Name="Aciklama" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="cboFormSeç" DefaultValue="0" Name="FormAdi" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="cboKurumListesi" DefaultValue="0" Name="KurumCkys" PropertyName="Value" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="KurumDenetimDurum" Type="String" />
                <asp:ControlParameter ControlID="cboKurumListesi" DefaultValue="0" Name="KurumCkys" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="cboFormSeç" DefaultValue="0" Name="FormAdi" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="Aciklama" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />


        <table style="width:100%;">
            <tr style="height:30px">
                <td>
            <asp:Label Width="130px" CssClass="form-inline"   runat="server" Text="Kurum Tipi " Font-Bold="True" ID="lblKurumTipi"></asp:Label>
                </td>
                <td>
            <asp:DropDownList CssClass="form-inline" ID="cboKurumTipi" runat="server" DataTextField="KURUMTURU_AD"
                 DataValueField="KURUMTURU_KOD" Width="300px" Font-Bold="True" 
                OnSelectedIndexChanged="cboKurumTipi_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
                </td>
            </tr>
            <tr style="height:30px">
                <td>
            <asp:Label Width="130px" CssClass="form-inline"   runat="server" Text="Kurum" Font-Bold="True" ID="lblKurumAdi"></asp:Label>
          

           

                </td>
                <td>
          

           

        <dx:ASPxGridLookup ID="cboKurumListesi" runat="server" AutoGenerateColumns="False" KeyFieldName="KURUMCKYS" 
            Width="800px" Font-Bold="True" Font-Size="10pt" Height="25px" OnValueChanged="cboKurumListesi_ValueChanged" NullText="Seçiniz">
            <GridViewProperties>
                <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" EnableRowHotTrack="True"></SettingsBehavior>
                <Settings ShowFilterRow="True" ColumnMinWidth="500" UseFixedTableLayout="True" />
            </GridViewProperties>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="KURUMCKYS" VisibleIndex="0" Caption="KURUMCKYS" Name="KURUMCKYS" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KURUMAD" VisibleIndex="1" Caption="KURUMAD" Name="KURUMAD" Width="500px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="ILAD" VisibleIndex="1" Caption="ILAD" Name="ILAD" Width="100px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="ILCEAD" VisibleIndex="1" Caption="ILCEAD" Name="ILCEAD" Width="100px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>



            </Columns>
            <ClientSideEvents CloseUp="function(s, e) {
	document.forms[0].submit();
}" />
        </dx:ASPxGridLookup>
    
   
           

                </td>
            </tr>
           
        </table>
    
   
        <br />
&nbsp;<br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSourceKurumDurum" Height="50px" Width="600px" Font-Size="10pt">
            <FieldHeaderStyle Font-Bold="True" Width="100px" />
            <Fields>
                <asp:TemplateField HeaderText="Denetim Yapılamadıysa Nedeni" SortExpression="KurumDenetimDurum">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("KurumDenetimDurum") %>'>
                            <asp:ListItem>Seçiniz</asp:ListItem>
                            <asp:ListItem>Yatan Hasta Yok</asp:ListItem>
                            <asp:ListItem>Yoğun Bakım Aktif Değil</asp:ListItem>
                            <asp:ListItem>Diğer</asp:ListItem>

                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("KurumDenetimDurum") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("KurumDenetimDurum") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="200px" />
                    <HeaderStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Aciklama" SortExpression="Aciklama">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Aciklama") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Aciklama") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Aciklama") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="450px" />
                </asp:TemplateField>
                <asp:BoundField DataField="KurumCkys" HeaderText="KurumCkys" SortExpression="KurumCkys" ReadOnly="True" >
                <ControlStyle Width="0px" />
                </asp:BoundField>
                <asp:CommandField ShowEditButton="True" CancelText="İptal" EditText="Denetim Durumunu Düzenle" UpdateText="Kaydet" />
            </Fields>
        </asp:DetailsView>
                <asp:Label ID="lblAnaUyarı" runat="server" ForeColor="#FF6600" Text="..."></asp:Label>
                <br />
             <dx:ASPxRoundPanel ID="PanelYeniForm" runat="server" HeaderText="Form Ekle" Width="200px">
                 <PanelCollection>
<dx:PanelContent runat="server"><span  style="clear:both" />
    <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ClientInstanceName="ASPxUploadControl1" NullText="Hasta Bilgilerini Excelden Al" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" UploadMode="Auto" Width="255px">
        <ValidationSettings AllowedFileExtensions=".xls, .xlsx">
        </ValidationSettings>
        <ClientSideEvents FileUploadComplete="function(s, e){Uploader_OnFileUploadComplete(e);}" FileUploadStart="function(s, e) {Uploader_OnUploadStart(e);}" TextChanged="function(s, e) {ASPxUploadControl1.UploadFile();}" />
        <BrowseButton Text="Dosya Seç">
        </BrowseButton>
        <CancelButton Text="Vazgeç">
        </CancelButton>
    </dx:ASPxUploadControl>
    <br />
    <dx:ASPxButton ID="btnYeniForm" runat="server" Height="35px" OnClick="btnYeniHasta_Click" Text="Yeni Form Oluştur" Width="255px">
    </dx:ASPxButton>
    </span></dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
        <br />
        <dx:ASPxGridViewExporter ID="ASPxGridViewExportYatay" runat="server" GridViewID="gwYatay">
        </dx:ASPxGridViewExporter>
                    <br />
                    <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" style="float:left" Text="Excele Aktar" Width="127px" Height="37px">
                        <Image Url="~/App_Themes/Mavi/images/excel.png">
                        </Image>
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="button1" ClientInstanceName="button1" runat="server" Text="Sutunları Düzenle" Width="127px" Height="37px">
                       
                         <ClientSideEvents Click="button1_Click" />
                    </dx:ASPxButton>
                    <br />
        <br />
        <dx:ASPxGridView ID="gwYatay" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False" Font-Size="9pt" KeyFieldName="Id" OnHtmlRowCreated="gwYatay_HtmlRowCreated" Theme="BlackGlass" ViewStateMode="Enabled" Width="100%" OnDataBinding="gwYatay_DataBinding" style="margin-bottom: 0px" OnRowUpdating="gwYatay_RowUpdating" OnHtmlDataCellPrepared="gwYatay_HtmlDataCellPrepared" OnHtmlRowPrepared="gwYatay_HtmlRowPrepared">
            <Columns>
                <dx:GridViewDataTextColumn Caption="İl Ad" FieldName="IlAd" VisibleIndex="3" Width="50px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn VisibleIndex="0" Name="Duzen" Width="60px">
                    <EditButton Visible="True">
                    </EditButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn  Settings-AutoFilterCondition="Contains" FieldName="Kurum" VisibleIndex="6" Width="150px">
<Settings AutoFilterCondition="Contains" HeaderFilterMode="CheckedList"></Settings>

                    <HeaderStyle Wrap="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Protokol No" Name="ProtokolNo" FieldName="ProtokolNo" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataColumn Settings-AllowAutoFilter="False" HeaderStyle-Wrap="True" Width="50px" Caption="Kayıt Durumu" FieldName="KayitTar1" Name="KayitTar1" VisibleIndex="2" HeaderStyle-CssClass="dxGridColumnHeader">
<Settings AllowAutoFilter="False"></Settings>
                    <DataItemTemplate>
                        <dx:ASPxImage ID="ASPxImage1" runat="server">
                        </dx:ASPxImage>
                    </DataItemTemplate>

<HeaderStyle Wrap="True" CssClass="dxGridColumnHeader"></HeaderStyle>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataColumn>
                
                <dx:GridViewDataColumn Name="CdVarmı"  HeaderStyle-Wrap="True" Width="40px" FieldName="CdVarMi" VisibleIndex="4" Caption="Görüntüsü Var Mı?">
                    <DataItemTemplate>
                        <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" OnInit="ASPxCheckBox1_Init" Value='<%#Eval("CdVarMi")%>' >
                        </dx:ASPxCheckBox>
                    </DataItemTemplate>

<HeaderStyle Wrap="True"></HeaderStyle>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataColumn>

                 <dx:GridViewDataColumn Name="Kargo"  HeaderStyle-Wrap="True" Width="50px" FieldName="KargoyaVerildi" Visible="false" VisibleIndex="14" Caption="Kargoya Verildi Mi?">
                    <DataItemTemplate>
                        <dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" OnInit="ASPxCheckBox2_Init" Value='<%#Eval("KargoyaVerildi")%>' >
                        </dx:ASPxCheckBox>
                    </DataItemTemplate>

<HeaderStyle Wrap="True"></HeaderStyle>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataColumn>

                <dx:GridViewDataTextColumn Settings-AutoFilterCondition="Contains" Caption="Hasta Ad Soyad" FieldName="DenekAd" VisibleIndex="13">
<Settings AutoFilterCondition="Contains"></Settings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KurumKod" ReadOnly="true" VisibleIndex="5" Width="40px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDropDownEditColumn Settings-AutoFilterCondition="Equals" FieldName="FormAdi" VisibleIndex="7" Width="50px">
<Settings AutoFilterCondition="Equals" HeaderFilterMode="CheckedList"></Settings>
                </dx:GridViewDataDropDownEditColumn>
                <dx:GridViewDataTextColumn Settings-AutoFilterCondition="Contains" Name="Denetleyen" Caption="Koordinatör/Denetleyen Dr." FieldName="AnketorAd" ReadOnly="true" VisibleIndex="8" Width="170px">
<Settings AutoFilterCondition="Contains"></Settings>
                    <EditItemTemplate>
                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" OnCallback="Yukle" Width="200px" ClientInstanceName="cp">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server" AutoGenerateColumns="False" IncrementalFilteringMode="Contains" KeyFieldName="KullaniciID" OnInit="ASPxGridLookup1_Init" TextFormatString="{4}" Width="170px" AllowMouseWheel="False">
                                        <GridViewProperties>
                                         
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" EnableRowHotTrack="True" />
                                            <SettingsPager Mode="ShowAllRecords" RenderMode="Lightweight">
                                            </SettingsPager>
                                            <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRow="True" ShowFooter="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="400" />
                                        </GridViewProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn  Settings-AutoFilterCondition="Contains" FieldName="AktifFormlar" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Settings-AutoFilterCondition="Contains" FieldName="IlgiAlani" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px">
                                                <Settings AutoFilterCondition="Contains" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="KurumKod" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataProgressBarColumn FieldName="HastaSayisi"  ShowInCustomizationForm="true" SortIndex="0" SortOrder="Descending" VisibleIndex="4" Width="150px">
                                                <PropertiesProgressBar Maximum="25" DisplayMode="Position" Height="15px">
                                                    <IndicatorStyle BackColor="#CC99FF">
                                                        <Border BorderColor="#CC00CC" BorderStyle="Solid" BorderWidth="8px" />
                                                    </IndicatorStyle>
                                                    <Style ForeColor="#CCCCCC">
                                                    </Style>
                                                </PropertiesProgressBar>
                                            </dx:GridViewDataProgressBarColumn>
                                            <dx:GridViewDataTextColumn Caption="KullaniciAdSoyad" FieldName="KullaniciAdSoyad" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <ClientSideEvents CloseUp="function(s, e)  {cp.PerformCallback();}"  />
                                    </dx:ASPxGridLookup>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </EditItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S28" Visible="False" VisibleIndex="44">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S27" Visible="False" VisibleIndex="42">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S01" Visible="False" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S02" Visible="False" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S03" Visible="False" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S04" Visible="False" VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S05" Visible="False" VisibleIndex="31">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S06" Visible="False" VisibleIndex="32">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S07" Visible="False" VisibleIndex="33">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S08" Visible="False" VisibleIndex="34">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S09" Visible="False" VisibleIndex="35">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S10" Visible="False" VisibleIndex="36">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataButtonEditColumn Caption="Form Ayrıntıları" FieldName="Id" VisibleIndex="15" Name="colAyrinti">
                    <PropertiesButtonEdit>
                        <Style HorizontalAlign="Center" Wrap="True">
                        </Style>
                    </PropertiesButtonEdit>
                    <DataItemTemplate>
                        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Font-Bold="False" ForeColor="Red" NavigateUrl='<%# String.Format("AnketForm.aspx?SatirGuid={0}", Eval("SatirGuid")) %>' Text="Form Doldur / Değiştir">
                            <Border BorderColor="#CC3300" BorderStyle="Solid" BorderWidth="1px" />
                            <BorderBottom BorderColor="#FFFF66" />
                        </dx:ASPxHyperLink>
                    </DataItemTemplate>
                </dx:GridViewDataButtonEditColumn>
                <dx:GridViewDataColumn Settings-AllowAutoFilter="False" Caption="S.No"  VisibleIndex="1" Width="40px">
<Settings AllowAutoFilter="False"></Settings>
                    <DataItemTemplate>
                        <%# Container.ItemIndex + 1 %> 
                    </DataItemTemplate>

                </dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn FieldName="S29" Visible="False" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Denetleyici2" Settings-AutoFilterCondition="Contains"  FieldName="AnketorAd2" VisibleIndex="10">
                    <Settings AutoFilterCondition="Contains"></Settings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Denetleyici2 Kayıt" FieldName="KayıtTar_Denetleyici2" VisibleIndex="11">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Denetleyici1 Kayıt" FieldName="KayıtTar_Denetleyici1" VisibleIndex="9">
                </dx:GridViewDataDateColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" EnableRowHotTrack="True" ColumnResizeMode="Control" />
            <SettingsPager PageSize="1000" NumericButtonCount="20">
            </SettingsPager>
            <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
            <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
            <Styles>
                <Header Wrap="True">
                </Header>
                <HeaderPanel Wrap="False">
                </HeaderPanel>
            </Styles>
            <Templates>
                <EditForm>
                    <div style="padding: 4px 4px 3px 4px">
                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Text='<%# Bind("DenekAd") %>' Theme="BlackGlass" Width="170px">
                        </dx:ASPxTextBox>
                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" TextField='<%# Bind("FormAdi") %>' ValueField='<%# Bind("FormAdi") %>' ValueType="System.String">
                        </dx:ASPxComboBox>
                    </div>
                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" runat="server" ReplacementType="EditFormUpdateButton" />
                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" runat="server" ReplacementType="EditFormCancelButton" />
                    </div>
                </EditForm>
            </Templates>
              <SettingsBehavior EnableCustomizationWindow="true" />
              <ClientSideEvents CustomizationWindowCloseUp="grid_CustomizationWindowCloseUp" />
        </dx:ASPxGridView>
        <p>
            <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="cb" OnCallback="ASPxCallback1_Callback">
            </dx:ASPxCallback>
            <dx:ASPxCallback ID="ASPxCallback2" runat="server" ClientInstanceName="cb2" OnCallback="ASPxCallback2_Callback">
            </dx:ASPxCallback>
        </p>
    </form>
     </span>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    </asp:Content>
