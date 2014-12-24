<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormTanimla.aspx.cs" Inherits="ShDenetim.Web.AnketUygulama.FormTanimla" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <a href="javascript:history.go(-1)">Geri</a><br />
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id">
                <Columns>
                    <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="1" ReadOnly="True">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FormAdıUzun" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FormAd" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="FormBitisTar" VisibleIndex="4">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="AltUniteListesi" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="YetkiliRoller" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="DenetimTipi" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>

                </Columns>
                <SettingsPager Visible="False" Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowFilterRow="True" />
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DenetimDbContext %>" SelectCommand="SELECT Id, FormAdıUzun, FormAd, FormBitisTar, AltUniteListesi,DenetimTipi, YetkiliRoller FROM FORM_TANIM" DeleteCommand="DELETE FROM [FORM_TANIM] WHERE [Id] = @Id" InsertCommand="INSERT INTO FORM_TANIM(FormAdıUzun, FormAd, FormBitisTar, AltUniteListesi, YetkiliRoller,DenetimTipi) VALUES (@FormAdıUzun, @FormAd, @FormBitisTar, @AltUniteListesi, @YetkiliRoller,@DenetimTipi)" UpdateCommand="UPDATE [FORM_TANIM] SET [FormAdıUzun] = @FormAdıUzun, [FormAd] = @FormAd, [FormBitisTar] = @FormBitisTar, [AltUniteListesi] = @AltUniteListesi, [YetkiliRoller] = @YetkiliRoller
,DenetimTipi=@DenetimTipi
 WHERE [Id] = @Id" OnInserted="SqlDataSource1_Inserted">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FormAdıUzun" Type="String" />
                    <asp:Parameter Name="FormAd" Type="String" />
                    <asp:Parameter Name="FormBitisTar" Type="DateTime" />
                    <asp:Parameter Name="AltUniteListesi" Type="String" />
                    <asp:Parameter Name="YetkiliRoller" Type="String" />
                     <asp:Parameter Name="DenetimTipi" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FormAdıUzun" Type="String" />
                    <asp:Parameter Name="FormAd" Type="String" />
                    <asp:Parameter Name="FormBitisTar" Type="DateTime" />
                    <asp:Parameter Name="AltUniteListesi" Type="String" />
                    <asp:Parameter Name="YetkiliRoller" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="DenetimTipi" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="FormAdıUzun" DataValueField="FormAd" Width="200px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>

            <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" KeyFieldName="Id">
                <Columns>
                    <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FormKod" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FormSoruGrupKod" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FormSoruGrupBaslik" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="KutuSitil" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BaslikSitil" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="KutuCssSinif" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BaslikCssSinif" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="YetkiliRoller" VisibleIndex="2" Caption="Yetkili Roller">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Settings ShowFilterRow="True" />
            </dx:ASPxGridView>

            <br />

        </div>
        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="Id" OnInitNewRow="ASPxGridView2_InitNewRow">
            <Columns>
                <dx:GridViewDataTextColumn Caption="SoruSıraNo" FieldName="SoruSıraNo" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                    <NewButton Visible="True">
                    </NewButton>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="FormAdi" VisibleIndex="2">
                    <EditFormSettings VisibleIndex="0" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SoruKod" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="AnketorId" Value="AnketorId" />
                            <dx:ListEditItem Text="AnketorId2" Value="AnketorId2" />
                            <dx:ListEditItem Text="DenekAd" Value="DenekAd" />
                            <dx:ListEditItem Text="DenetlemeTar" Value="DenetlemeTar" />
                            <dx:ListEditItem Text="FormAdi" Value="FormAdi" />
                            <dx:ListEditItem Text="KurumKod" Value="KurumKod" />
                            <dx:ListEditItem Text="ProtokolNo" Value="ProtokolNo" />
                            <dx:ListEditItem Text="S01" Value="S01" />
                            <dx:ListEditItem Text="S02" Value="S02" />

                            <dx:ListEditItem Text="S03" Value="S03" />
                            <dx:ListEditItem Text="S04" Value="S04" />
                            <dx:ListEditItem Text="S05" Value="S05" />
                            <dx:ListEditItem Text="S06" Value="S06" />
                            <dx:ListEditItem Text="S07" Value="S07" />
                            <dx:ListEditItem Text="S08" Value="S08" />
                            <dx:ListEditItem Text="S09" Value="S09" />
                            <dx:ListEditItem Text="S10" Value="S10" />
                            <dx:ListEditItem Text="S11" Value="S11" />
                            <dx:ListEditItem Text="S12" Value="S12" />
                            <dx:ListEditItem Text="S13" Value="S13" />
                            <dx:ListEditItem Text="S14" Value="S14" />
                            <dx:ListEditItem Text="S15" Value="S15" />
                            <dx:ListEditItem Text="S16" Value="S16" />
                            <dx:ListEditItem Text="S17" Value="S17" />
                            <dx:ListEditItem Text="S18" Value="S18" />
                            <dx:ListEditItem Text="S19" Value="S19" />
                            <dx:ListEditItem Text="S20" Value="S20" />
                            <dx:ListEditItem Text="S21" Value="S21" />
                            <dx:ListEditItem Text="S22" Value="S22" />
                            <dx:ListEditItem Text="S23" Value="S23" />
                            <dx:ListEditItem Text="S24" Value="S24" />
                            <dx:ListEditItem Text="S25" Value="S25" />
                            <dx:ListEditItem Text="S26" Value="S26" />
                            <dx:ListEditItem Text="S27" Value="S27" />
                            <dx:ListEditItem Text="S28" Value="S28" />
                            <dx:ListEditItem Text="S29" Value="S29" />
                            <dx:ListEditItem Text="S30" Value="S30" />
                            <dx:ListEditItem Text="S31" Value="S31" />
                            <dx:ListEditItem Text="S32" Value="S32" />
                            <dx:ListEditItem Text="S33" Value="S33" />
                            <dx:ListEditItem Text="S34" Value="S34" />
                            <dx:ListEditItem Text="S35" Value="S35" />
                            <dx:ListEditItem Text="S36" Value="S36" />
                            <dx:ListEditItem Text="S37" Value="S37" />
                            <dx:ListEditItem Text="S38" Value="S38" />
                            <dx:ListEditItem Text="S39" Value="S39" />
                            <dx:ListEditItem Text="S40" Value="S40" />
                            <dx:ListEditItem Text="S41" Value="S41" />
                            <dx:ListEditItem Text="S42" Value="S42" />
                            <dx:ListEditItem Text="S43" Value="S43" />
                            <dx:ListEditItem Text="S44" Value="S44" />
                            <dx:ListEditItem Text="S45" Value="S45" />
                            <dx:ListEditItem Text="S46" Value="S46" />
                            <dx:ListEditItem Text="S47" Value="S47" />
                            <dx:ListEditItem Text="S48" Value="S48" />
                            <dx:ListEditItem Text="S49" Value="S49" />
                            <dx:ListEditItem Text="S50" Value="S50" />
                            <dx:ListEditItem Text="S51" Value="S51" />
                            <dx:ListEditItem Text="S52" Value="S52" />
                            <dx:ListEditItem Text="S53" Value="S53" />
                            <dx:ListEditItem Text="S54" Value="S54" />
                            <dx:ListEditItem Text="S55" Value="S55" />
                            <dx:ListEditItem Text="S56" Value="S56" />
                            <dx:ListEditItem Text="S57" Value="S57" />
                            <dx:ListEditItem Text="S58" Value="S58" />
                            <dx:ListEditItem Text="S59" Value="S59" />
                            <dx:ListEditItem Text="S60" Value="S60" />
                            <dx:ListEditItem Text="S61" Value="S61" />
                            <dx:ListEditItem Text="S62" Value="S62" />
                            <dx:ListEditItem Text="S63" Value="S63" />
                            <dx:ListEditItem Text="S64" Value="S64" />
                            <dx:ListEditItem Text="S65" Value="S65" />
                            <dx:ListEditItem Text="S66" Value="S66" />
                            <dx:ListEditItem Text="S67" Value="S67" />
                            <dx:ListEditItem Text="S68" Value="S68" />
                            <dx:ListEditItem Text="S69" Value="S69" />
                            <dx:ListEditItem Text="S70" Value="S70" />
                            <dx:ListEditItem Text="S71" Value="S71" />
                            <dx:ListEditItem Text="S72" Value="S72" />
                            <dx:ListEditItem Text="S73" Value="S73" />
                            <dx:ListEditItem Text="S74" Value="S74" />
                            <dx:ListEditItem Text="S75" Value="S75" />



                            <dx:ListEditItem Text="S76" Value="S76" />
                            <dx:ListEditItem Text="S77" Value="S77" />
                            <dx:ListEditItem Text="S78" Value="S78" />
                            <dx:ListEditItem Text="S79" Value="S79" />
                            <dx:ListEditItem Text="S80" Value="S80" />
                            <dx:ListEditItem Text="S81" Value="S81" />
                            <dx:ListEditItem Text="S82" Value="S82" />
                            <dx:ListEditItem Text="S83" Value="S83" />
                            <dx:ListEditItem Text="S84" Value="S84" />
                            <dx:ListEditItem Text="S85" Value="S85" />
                            <dx:ListEditItem Text="S86" Value="S86" />
                            <dx:ListEditItem Text="S87" Value="S87" />
                            <dx:ListEditItem Text="S88" Value="S88" />
                            <dx:ListEditItem Text="S89" Value="S89" />
                            <dx:ListEditItem Text="S90" Value="S90" />
                            <dx:ListEditItem Text="S91" Value="S91" />
                            <dx:ListEditItem Text="S92" Value="S92" />
                            <dx:ListEditItem Text="S93" Value="S93" />
                            <dx:ListEditItem Text="S94" Value="S94" />
                            <dx:ListEditItem Text="S95" Value="S95" />
                            <dx:ListEditItem Text="S96" Value="S96" />
                            <dx:ListEditItem Text="S97" Value="S97" />
                            <dx:ListEditItem Text="S98" Value="S98" />
                            <dx:ListEditItem Text="S99" Value="S99" />
                            <dx:ListEditItem Text="S100" Value="S100" />
                            <dx:ListEditItem Text="S101" Value="S101" />
                            <dx:ListEditItem Text="S102" Value="S102" />
                            <dx:ListEditItem Text="S103" Value="S103" />
                            <dx:ListEditItem Text="S104" Value="S104" />
                            <dx:ListEditItem Text="S105" Value="S105" />
                            <dx:ListEditItem Text="S106" Value="S106" />
                            <dx:ListEditItem Text="S107" Value="S107" />
                            <dx:ListEditItem Text="S108" Value="S108" />
                            <dx:ListEditItem Text="S109" Value="S109" />
                            <dx:ListEditItem Text="S110" Value="S110" />
                            <dx:ListEditItem Text="S111" Value="S111" />
                            <dx:ListEditItem Text="S112" Value="S112" />
                            <dx:ListEditItem Text="S113" Value="S113" />
                            <dx:ListEditItem Text="S114" Value="S114" />
                            <dx:ListEditItem Text="S115" Value="S115" />
                            <dx:ListEditItem Text="S116" Value="S116" />
                            <dx:ListEditItem Text="S117" Value="S117" />
                            <dx:ListEditItem Text="S118" Value="S118" />
                            <dx:ListEditItem Text="S119" Value="S119" />
                            <dx:ListEditItem Text="S120" Value="S120" />
                            <dx:ListEditItem Text="S121" Value="S121" />
                            <dx:ListEditItem Text="S122" Value="S122" />
                            <dx:ListEditItem Text="S123" Value="S123" />
                            <dx:ListEditItem Text="S124" Value="S124" />
                            <dx:ListEditItem Text="S125" Value="S125" />
                            <dx:ListEditItem Text="S126" Value="S126" />
                            <dx:ListEditItem Text="S127" Value="S127" />
                            <dx:ListEditItem Text="S128" Value="S128" />
                            <dx:ListEditItem Text="S129" Value="S129" />
                            <dx:ListEditItem Text="S130" Value="S130" />
                            <dx:ListEditItem Text="S131" Value="S131" />
                            <dx:ListEditItem Text="S132" Value="S132" />
                            <dx:ListEditItem Text="S133" Value="S133" />
                            <dx:ListEditItem Text="S134" Value="S134" />
                            <dx:ListEditItem Text="S135" Value="S135" />
                            <dx:ListEditItem Text="S136" Value="S136" />
                            <dx:ListEditItem Text="S137" Value="S137" />
                            <dx:ListEditItem Text="S138" Value="S138" />
                            <dx:ListEditItem Text="S139" Value="S139" />
                            <dx:ListEditItem Text="S140" Value="S140" />
                            <dx:ListEditItem Text="S141" Value="S141" />
                            <dx:ListEditItem Text="S142" Value="S142" />
                            <dx:ListEditItem Text="S143" Value="S143" />
                            <dx:ListEditItem Text="S144" Value="S144" />
                            <dx:ListEditItem Text="S145" Value="S145" />
                            <dx:ListEditItem Text="S146" Value="S146" />
                            <dx:ListEditItem Text="S147" Value="S147" />
                            <dx:ListEditItem Text="S148" Value="S148" />
                            <dx:ListEditItem Text="S149" Value="S149" />
                            <dx:ListEditItem Text="S150" Value="S150" />
                            <dx:ListEditItem Text="S151" Value="S151" />
                            <dx:ListEditItem Text="S152" Value="S152" />
                            <dx:ListEditItem Text="S153" Value="S153" />
                            <dx:ListEditItem Text="S154" Value="S154" />
                            <dx:ListEditItem Text="S155" Value="S155" />
                            <dx:ListEditItem Text="S156" Value="S156" />
                            <dx:ListEditItem Text="S157" Value="S157" />
                            <dx:ListEditItem Text="S158" Value="S158" />
                            <dx:ListEditItem Text="S159" Value="S159" />
                            <dx:ListEditItem Text="S160" Value="S160" />
                            <dx:ListEditItem Text="S161" Value="S161" />
                            <dx:ListEditItem Text="S162" Value="S162" />
                            <dx:ListEditItem Text="S163" Value="S163" />
                            <dx:ListEditItem Text="S164" Value="S164" />
                            <dx:ListEditItem Text="S165" Value="S165" />
                            <dx:ListEditItem Text="S166" Value="S166" />
                            <dx:ListEditItem Text="S167" Value="S167" />
                            <dx:ListEditItem Text="S168" Value="S168" />
                            <dx:ListEditItem Text="S169" Value="S169" />
                            <dx:ListEditItem Text="S170" Value="S170" />
                            <dx:ListEditItem Text="S171" Value="S171" />
                            <dx:ListEditItem Text="S172" Value="S172" />
                            <dx:ListEditItem Text="S173" Value="S173" />
                            <dx:ListEditItem Text="S174" Value="S174" />
                            <dx:ListEditItem Text="S175" Value="S175" />
                            <dx:ListEditItem Text="S176" Value="S176" />
                            <dx:ListEditItem Text="S177" Value="S177" />
                            <dx:ListEditItem Text="S178" Value="S178" />
                            <dx:ListEditItem Text="S179" Value="S179" />
                            <dx:ListEditItem Text="S180" Value="S180" />
                            <dx:ListEditItem Text="S181" Value="S181" />
                            <dx:ListEditItem Text="S182" Value="S182" />
                            <dx:ListEditItem Text="S183" Value="S183" />
                            <dx:ListEditItem Text="S184" Value="S184" />
                            <dx:ListEditItem Text="S185" Value="S185" />
                            <dx:ListEditItem Text="S186" Value="S186" />
                            <dx:ListEditItem Text="S187" Value="S187" />
                            <dx:ListEditItem Text="S188" Value="S188" />
                            <dx:ListEditItem Text="S189" Value="S189" />
                            <dx:ListEditItem Text="S190" Value="S190" />
                            <dx:ListEditItem Text="S191" Value="S191" />
                            <dx:ListEditItem Text="S192" Value="S192" />
                            <dx:ListEditItem Text="S193" Value="S193" />
                            <dx:ListEditItem Text="S194" Value="S194" />
                            <dx:ListEditItem Text="S195" Value="S195" />
                            <dx:ListEditItem Text="S196" Value="S196" />
                            <dx:ListEditItem Text="S197" Value="S197" />
                            <dx:ListEditItem Text="S198" Value="S198" />
                            <dx:ListEditItem Text="S199" Value="S199" />
                            <dx:ListEditItem Text="S200" Value="S200" />


                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings VisibleIndex="3" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataMemoColumn FieldName="Soru" VisibleIndex="4">
                    <PropertiesMemoEdit Height="70px">
                    </PropertiesMemoEdit>
                    <EditFormSettings VisibleIndex="3" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn FieldName="KontrolType" VisibleIndex="12" Caption="Kontrol Tip">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="MetinKutusu" Value="MetinKutusu" />
                            <dx:ListEditItem Text="AçılırKutu" Value="AçılırKutu" />
                            <dx:ListEditItem Text="Seçenek" Value="Seçenek" />
                            <dx:ListEditItem Text="OnayKutusu" Value="OnayKutusu" />
                            <dx:ListEditItem Text="TarihKutusu" Value="TarihKutusu" />
                            <dx:ListEditItem Text="CkysKurum" Value="CkysKurum" />
                            <dx:ListEditItem Text="ICD10" Value="ICD10" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings VisibleIndex="4" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="HesapFonksiyon" VisibleIndex="13">
                    <EditFormSettings VisibleIndex="5" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SoruAçıklama" VisibleIndex="14">
                    <EditFormSettings VisibleIndex="6" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn FieldName="Şıklar" VisibleIndex="15">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings VisibleIndex="7" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn FieldName="AltSoruKodlari" VisibleIndex="18">
                    <EditFormSettings VisibleIndex="8" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn FieldName="KutuSitil" VisibleIndex="19">
                    <PropertiesMemoEdit Height="70px">
                    </PropertiesMemoEdit>
                    <EditFormSettings VisibleIndex="9" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn FieldName="KontrolSitil" VisibleIndex="21" Caption="Soru Cevap Sitil">
                    <PropertiesMemoEdit Height="70px">
                    </PropertiesMemoEdit>
                    <EditFormSettings VisibleIndex="10" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn FieldName="KutuCssSinif" VisibleIndex="22">
                    <PropertiesMemoEdit Height="70px">
                    </PropertiesMemoEdit>
                    <EditFormSettings VisibleIndex="11" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn FieldName="KontrolCssSinif" VisibleIndex="23">
                    <EditFormSettings VisibleIndex="12" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn FieldName="SoruBaslikSitil" VisibleIndex="20">
                    <PropertiesMemoEdit Height="70px">
                    </PropertiesMemoEdit>
                    <EditFormSettings VisibleIndex="13" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn Caption="Yetkili Roller" FieldName="YetkiliRoller" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SoruGrup" VisibleIndex="6">
                    <EditFormSettings VisibleIndex="1" />
                </dx:GridViewDataTextColumn>



                <dx:GridViewDataCheckColumn FieldName="SoruAçıklamaOlsunMu" VisibleIndex="7">
                    <EditFormSettings VisibleIndex="1" />
                </dx:GridViewDataCheckColumn>

                 <dx:GridViewDataCheckColumn FieldName="SoruDosyaEkOlsunMu" VisibleIndex="7">
                    <EditFormSettings VisibleIndex="1" />
                </dx:GridViewDataCheckColumn>

                

                <dx:GridViewDataCheckColumn FieldName="ZorunluMu" VisibleIndex="8">
                    <EditFormSettings VisibleIndex="1" />
                </dx:GridViewDataCheckColumn>


                <dx:GridViewDataTextColumn FieldName="ExcelBaşlıkHücreKonum" VisibleIndex="9">
                    <EditFormSettings VisibleIndex="1" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="SoruFiltre" VisibleIndex="11">
                    <EditFormSettings VisibleIndex="1" />
                </dx:GridViewDataTextColumn>

            </Columns>
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" />
            <SettingsPager NumericButtonCount="100" PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm" NewItemRowPosition="Bottom" />
            <Settings ShowFilterRow="True" VerticalScrollableHeight="50" />
            <SettingsPopup>
                <EditForm AllowResize="True" MinWidth="750px" />
            </SettingsPopup>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DenetimDbContext %>" SelectCommand="SELECT * FROM [FORM_SORU] WHERE ([FormAdi] = @FormAdi)" DeleteCommand="DELETE FROM [FORM_SORU] WHERE [Id] = @Id" InsertCommand="INSERT INTO FORM_SORU(FormAdi, SoruGrup, SoruKod, Soru, SoruTip, KontrolType, HesapFonksiyon, SoruAçıklama, SoruTipDonusumYap, GridAnaSutun, GridSutunAltFx, Şıklar, ŞıkKontrolList, Güncelleyen, GüncellenmeTarihi, AltSoruKodlari, KutuSitil, KontrolSitil, KutuCssSinif, KontrolCssSinif, SoruBaslikSitil, SoruSıraNo, YetkiliRoller,SoruAçıklamaOlsunMu,ZorunluMu,ExcelBaşlıkHücreKonum,Uzunluk,SoruFiltre,SoruDosyaEkOlsunMu) VALUES (@FormAdi, @SoruGrup, @SoruKod, @Soru, @SoruTip, @KontrolType, @HesapFonksiyon, @SoruAçıklama, @SoruTipDonusumYap, @GridAnaSutun, @GridSutunAltFx, @Şıklar, @ŞıkKontrolList, @Güncelleyen, @GüncellenmeTarihi, @AltSoruKodlari, @KutuSitil, @KontrolSitil, @KutuCssSinif, @KontrolCssSinif, @SoruBaslikSitil, @SoruSıraNo, @YetkiliRoller,@SoruAçıklamaOlsunMu,@ZorunluMu,@ExcelBaşlıkHücreKonum,@Uzunluk,@SoruFiltre,@SoruDosyaEkOlsunMu)" 
            UpdateCommand="UPDATE FORM_SORU SET FormAdi = @FormAdi, SoruGrup = @SoruGrup, SoruKod = @SoruKod, Soru = @Soru, SoruTip = @SoruTip, KontrolType = @KontrolType, HesapFonksiyon = @HesapFonksiyon, SoruAçıklama = @SoruAçıklama, SoruTipDonusumYap = @SoruTipDonusumYap, GridAnaSutun = @GridAnaSutun, GridSutunAltFx = @GridSutunAltFx, Şıklar = @Şıklar, ŞıkKontrolList = @ŞıkKontrolList, Güncelleyen = @Güncelleyen, GüncellenmeTarihi = @GüncellenmeTarihi, AltSoruKodlari = @AltSoruKodlari, KutuSitil = @KutuSitil, KontrolSitil = @KontrolSitil, KutuCssSinif = @KutuCssSinif, KontrolCssSinif = @KontrolCssSinif, SoruBaslikSitil = @SoruBaslikSitil, SoruSıraNo = @SoruSıraNo, YetkiliRoller= @YetkiliRoller, SoruAçıklamaOlsunMu=@SoruAçıklamaOlsunMu,ZorunluMu=@ZorunluMu,ExcelBaşlıkHücreKonum=@ExcelBaşlıkHücreKonum,Uzunluk=@Uzunluk,SoruFiltre=@SoruFiltre,SoruDosyaEkOlsunMu=@SoruDosyaEkOlsunMu WHERE (Id = @Id)">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FormAdi" Type="String" />
                <asp:Parameter Name="SoruGrup" Type="String" />
                <asp:Parameter Name="SoruKod" Type="String" />
                <asp:Parameter Name="Soru" Type="String" />
                <asp:Parameter Name="SoruTip" Type="String" />
                <asp:Parameter Name="KontrolType" Type="String" />
                <asp:Parameter Name="HesapFonksiyon" Type="String" />
                <asp:Parameter Name="SoruAçıklama" Type="String" />
                <asp:Parameter Name="SoruTipDonusumYap" Type="Boolean" />
                <asp:Parameter Name="GridAnaSutun" Type="Boolean" />
                <asp:Parameter Name="GridSutunAltFx" Type="String" />
                <asp:Parameter Name="Şıklar" Type="String" />
                <asp:Parameter Name="ŞıkKontrolList" Type="String" />
                <asp:Parameter Name="Güncelleyen" Type="String" />
                <asp:Parameter Name="GüncellenmeTarihi" Type="DateTime" />
                <asp:Parameter Name="AltSoruKodlari" Type="String" />
                <asp:Parameter Name="KutuSitil" Type="String" />
                <asp:Parameter Name="KontrolSitil" Type="String" />
                <asp:Parameter Name="KutuCssSinif" Type="String" />
                <asp:Parameter Name="KontrolCssSinif" Type="String" />
                <asp:Parameter Name="SoruBaslikSitil" Type="String" />
                <asp:Parameter Name="SoruSıraNo" />
                <asp:Parameter Name="YetkiliRoller" />
                <asp:Parameter Name="SoruAçıklamaOlsunMu" />
                <asp:Parameter Name="ZorunluMu" />
                <asp:Parameter Name="ExcelBaşlıkHücreKonum" />
                <asp:Parameter Name="Uzunluk" />
                <asp:Parameter Name="SoruFiltre" />
                 <asp:Parameter Name="SoruDosyaEkOlsunMu" />

                
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="FormAdi" PropertyName="SelectedValue" Type="String" DefaultValue="0" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FormAdi" Type="String" />
                <asp:Parameter Name="SoruGrup" Type="String" />
                <asp:Parameter Name="SoruKod" Type="String" />
                <asp:Parameter Name="Soru" Type="String" />
                <asp:Parameter Name="SoruTip" Type="String" />
                <asp:Parameter Name="KontrolType" Type="String" />
                <asp:Parameter Name="HesapFonksiyon" Type="String" />
                <asp:Parameter Name="SoruAçıklama" Type="String" />
                <asp:Parameter Name="SoruTipDonusumYap" Type="Boolean" />
                <asp:Parameter Name="GridAnaSutun" Type="Boolean" />
                <asp:Parameter Name="GridSutunAltFx" Type="String" />
                <asp:Parameter Name="Şıklar" Type="String" />
                <asp:Parameter Name="ŞıkKontrolList" Type="String" />
                <asp:Parameter Name="Güncelleyen" Type="String" />
                <asp:Parameter Name="GüncellenmeTarihi" Type="DateTime" />
                <asp:Parameter Name="AltSoruKodlari" Type="String" />
                <asp:Parameter Name="KutuSitil" Type="String" />
                <asp:Parameter Name="KontrolSitil" Type="String" />
                <asp:Parameter Name="KutuCssSinif" Type="String" />
                <asp:Parameter Name="KontrolCssSinif" Type="String" />
                <asp:Parameter Name="SoruBaslikSitil" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="SoruSıraNo" />
                <asp:Parameter Name="YetkiliRoller" />
                <asp:Parameter Name="SoruAçıklamaOlsunMu" />
                 <asp:Parameter Name="SoruDosyaEkOlsunMu" />
                <asp:Parameter Name="ZorunluMu" />
                <asp:Parameter Name="ExcelBaşlıkHücreKonum" />
                <asp:Parameter Name="Uzunluk" />
                <asp:Parameter Name="SoruFiltre" />
                 
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DenetimDbContext %>" DeleteCommand="DELETE FROM [FORMSORU_GRUP] WHERE [Id] = @Id" InsertCommand="INSERT INTO [FORMSORU_GRUP] ([FormKod], [FormSoruGrupKod], [FormSoruGrupBaslik], [KutuSitil], [BaslikSitil], [KutuCssSinif], [BaslikCssSinif], [YetkiliRoller]) VALUES (@FormKod, @FormSoruGrupKod, @FormSoruGrupBaslik, @KutuSitil, @BaslikSitil, @KutuCssSinif, @BaslikCssSinif, @YetkiliRoller)" SelectCommand="SELECT * FROM [FORMSORU_GRUP] WHERE ([FormKod] = @FormAdi)" UpdateCommand="UPDATE [FORMSORU_GRUP] SET [FormKod] = @FormKod, [FormSoruGrupKod] = @FormSoruGrupKod, [FormSoruGrupBaslik] = @FormSoruGrupBaslik, [KutuSitil] = @KutuSitil, [BaslikSitil] = @BaslikSitil, [KutuCssSinif] = @KutuCssSinif, [BaslikCssSinif] = @BaslikCssSinif, [YetkiliRoller] = @YetkiliRoller WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FormKod" Type="String" />
                <asp:Parameter Name="FormSoruGrupKod" Type="String" />
                <asp:Parameter Name="FormSoruGrupBaslik" Type="String" />
                <asp:Parameter Name="KutuSitil" Type="String" />
                <asp:Parameter Name="BaslikSitil" Type="String" />
                <asp:Parameter Name="KutuCssSinif" Type="String" />
                <asp:Parameter Name="BaslikCssSinif" Type="String" />
                <asp:Parameter Name="YetkiliRoller" />
                <asp:Parameter Name="DenetimTipi" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="FormAdi" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FormKod" Type="String" />
                <asp:Parameter Name="FormSoruGrupKod" Type="String" />
                <asp:Parameter Name="FormSoruGrupBaslik" Type="String" />
                <asp:Parameter Name="KutuSitil" Type="String" />
                <asp:Parameter Name="BaslikSitil" Type="String" />
                <asp:Parameter Name="KutuCssSinif" Type="String" />
                <asp:Parameter Name="BaslikCssSinif" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="YetkiliRoller" />
                <asp:Parameter Name="DenetimTipi" Type="String" />

            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
