﻿<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="Yonet.aspx.cs" Inherits="ShDenetim.Web.Account.Yonet1" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <a href="javascript:history.go(-1)"> Geri</a><br />
    <form id="form1" runat="server">
                    <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Excele Aktar" Width="127px">
                        <Image Url="~/App_Themes/Mavi/images/excel.png">
                        </Image>
                    </dx:ASPxButton>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>
        <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="Id" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="BlackGlass">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                    <NewButton Visible="True">
                    </NewButton>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="KullaniciRol" VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="KullaniciID" VisibleIndex="2">
    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Settings-AutoFilterCondition="Contains" FieldName="KullaniciAdSoyad" VisibleIndex="4">
<Settings AutoFilterCondition="Contains"></Settings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Parola" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Settings-AutoFilterCondition="Contains"  FieldName="Mail" VisibleIndex="6">
<Settings AutoFilterCondition="Contains"></Settings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="AktifMi" VisibleIndex="8">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Adres" VisibleIndex="9" Width="250px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Tel" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Unvan" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Brans" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Settings-AutoFilterCondition="Contains"  FieldName="IlgiAlani" VisibleIndex="13">
<Settings AutoFilterCondition="Contains"></Settings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KurumKod" VisibleIndex="14">
                </dx:GridViewDataTextColumn>

              

                <dx:GridViewDataTextColumn FieldName="IlAd" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IlKod" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AktifFormlar" VisibleIndex="17">
                </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="Kurum" VisibleIndex="18" >
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DenetimDbContext %>" DeleteCommand="DELETE FROM [Kullanicilar] WHERE [KullaniciID] = @original_KullaniciID" InsertCommand="INSERT INTO Kullanicilar(KullaniciRol, KullaniciID, KullaniciAdSoyad, Parola, Mail, AktifMi, Adres, Tel, Unvan, Brans, IlgiAlani, KurumKod, IlAd, IlKod, AktifFormlar) VALUES (@KullaniciRol, @KullaniciID, @KullaniciAdSoyad, @Parola, @Mail, @AktifMi, @Adres, @Tel, @Unvan, @Brans, @IlgiAlani, @KurumKod, @IlAd, @IlKod, @AktifFormlar)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Kullanicilar.KullaniciRol, Kullanicilar.KullaniciID, Kullanicilar.Id, Kullanicilar.KullaniciAdSoyad, Kullanicilar.Parola, Kullanicilar.Mail, Kullanicilar.Kimlik, Kullanicilar.AktifMi, Kullanicilar.Adres, Kullanicilar.Tel, Kullanicilar.Unvan, Kullanicilar.Brans, Kullanicilar.IlgiAlani, Kullanicilar.KurumKod, Kullanicilar.IlAd, Kullanicilar.IlKod, Kullanicilar.AktifFormlar, KURUM_LISTESI.Kurum FROM Kullanicilar LEFT OUTER JOIN KURUM_LISTESI ON Kullanicilar.KurumKod = KURUM_LISTESI.KurumKod" UpdateCommand="UPDATE [Kullanicilar] SET KullaniciId=@KullaniciId, [KullaniciRol] = @KullaniciRol, [KullaniciAdSoyad] = @KullaniciAdSoyad, [Parola] = @Parola, [Mail] = @Mail,[AktifMi] = @AktifMi, [Adres] = @Adres, [Tel] = @Tel, [Unvan] = @Unvan, [Brans] = @Brans, [IlgiAlani] = @IlgiAlani, [KurumKod] = @KurumKod, [IlAd] = @IlAd, [IlKod] = @IlKod, [AktifFormlar] = @AktifFormlar WHERE Id= @original_Id">
            <DeleteParameters>
                <asp:Parameter Name="original_KullaniciID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="KullaniciRol" Type="String" />
                <asp:Parameter Name="KullaniciID" Type="String" />
                <asp:Parameter Name="KullaniciAdSoyad" Type="String" />
                <asp:Parameter Name="Parola" Type="String" />
                <asp:Parameter Name="Mail" Type="String" />
                <asp:Parameter Name="Kimlik" Type="Object" />
                <asp:Parameter Name="AktifMi" Type="Boolean" />
                <asp:Parameter Name="Adres" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Unvan" Type="String" />
                <asp:Parameter Name="Brans" Type="String" />
                <asp:Parameter Name="IlgiAlani" Type="String" />
                <asp:Parameter Name="KurumKod" Type="String" />
                <asp:Parameter Name="IlAd" Type="String" />
                <asp:Parameter Name="IlKod" Type="Int32" />
                <asp:Parameter Name="AktifFormlar" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="KullaniciId" />
                <asp:Parameter Name="KullaniciRol" />
                <asp:Parameter Name="KullaniciAdSoyad" />
                <asp:Parameter Name="Parola" />
                <asp:Parameter Name="Mail" />
                <asp:Parameter Name="AktifMi" />
                <asp:Parameter Name="Adres" />
                <asp:Parameter Name="Tel" />
                <asp:Parameter Name="Unvan" />
                <asp:Parameter Name="Brans" />
                <asp:Parameter Name="IlgiAlani" />
                <asp:Parameter Name="KurumKod" />
                <asp:Parameter Name="IlAd" />
                <asp:Parameter Name="IlKod" />
                <asp:Parameter Name="AktifFormlar" />
                <asp:Parameter Name="original_Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
