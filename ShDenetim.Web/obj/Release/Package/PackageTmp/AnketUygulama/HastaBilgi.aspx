<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HastaBilgi.aspx.cs" Inherits="ShDenetim.Web.AnketUygulama.HastaBilgi" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx1" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          
            <asp:HiddenField ID="hiddenAnketor" runat="server" />
             <asp:HiddenField ID="hiddenIlPlaka" runat="server" />

            <a href="javascript:history.go(-1)">Geri</a><br />
            <table>
                <tr>
                    <td>
                        <dx:ASPxButton ID="ASPxButton2" runat="server" OnClick="ASPxButton2_Click" Text="Excele Aktar">
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButton3" runat="server" OnClick="ASPxButton3_Click" Text="Excele Aktar (xlsx)">
                        </dx:ASPxButton>
                    </td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td>Form Adını Giriniz</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="22px" Width="210px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList></td>
                </tr>

            </table>



            <br />


        </div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" OnHtmlCommandCellPrepared="ASPxGridView1_HtmlCommandCellPrepared">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowInCustomizationForm="True" Name="Komutlar">
                    <EditButton Visible="True">
                    </EditButton>
                    <NewButton Visible="True">
                    </NewButton>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="FormAdi" VisibleIndex="2" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>

                     <dx:GridViewDataTextColumn FieldName="Kurum" VisibleIndex="3" ShowInCustomizationForm="True">
                         <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DenetlemeTar" VisibleIndex="4" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Denetleyici1" FieldName="AnketorId" VisibleIndex="5" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Caption="Denetleyici2" FieldName="AnketorId2" VisibleIndex="6" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>

                
                <dx:GridViewDataDateColumn Caption="Denetleyici1 KayıtT." FieldName="KayıtTar_Denetleyici1" VisibleIndex="7" ShowInCustomizationForm="True">
                    <PropertiesDateEdit DisplayFormatInEditMode="True"
                        EditFormatString="dd/MM/yyyy HH:mm:ss" DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>

                <dx:GridViewDataDateColumn Caption="Denetleyici2 KayıtT." FieldName="KayıtTar_Denetleyici2" VisibleIndex="8" ShowInCustomizationForm="True">
                    <PropertiesDateEdit DisplayFormatInEditMode="True"
                        EditFormatString="dd/MM/yyyy HH:mm:ss" DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>

                <dx:GridViewDataTextColumn FieldName="DenekAd" VisibleIndex="9" Caption="Hasta/Kurum Ad" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KurumKod" VisibleIndex="10" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProtokolNo" VisibleIndex="11" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IlKod" VisibleIndex="12" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Rol" VisibleIndex="13" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="İl" VisibleIndex="14" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="İlçe" VisibleIndex="15" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KurumTur" VisibleIndex="16" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SaglikBolgesi" VisibleIndex="17" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Kurum" VisibleIndex="18" Width="200px" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>

               
                <dx:GridViewDataMemoColumn FieldName="SoruAçıklamaBirleşik" Caption="Soru Açıklamaları" VisibleIndex="19" ShowInCustomizationForm="True"></dx:GridViewDataMemoColumn>
                
                <dx:GridViewDataDateColumn Caption="KayitTar1" FieldName="KayitTar1" VisibleIndex="20" ShowInCustomizationForm="True">
                    <PropertiesDateEdit DisplayFormatInEditMode="True"
                        EditFormatString="dd/MM/yyyy HH:mm:ss" DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                    </PropertiesDateEdit>

                </dx:GridViewDataDateColumn>




                <dx:GridViewDataCheckColumn FieldName="CdVarMi"  VisibleIndex="21" ShowInCustomizationForm="True"></dx:GridViewDataCheckColumn>

                <dx:GridViewDataCheckColumn FieldName="KargoyaVerildi"  VisibleIndex="22" ShowInCustomizationForm="True"></dx:GridViewDataCheckColumn>

                <dx:GridViewDataTextColumn FieldName="S01" VisibleIndex="23" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S02" VisibleIndex="24" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S03" VisibleIndex="25" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S04" VisibleIndex="26" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S05" VisibleIndex="27" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S06" VisibleIndex="28" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S07" VisibleIndex="29" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S08" VisibleIndex="30" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S09" VisibleIndex="31" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S10" VisibleIndex="32" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S11" VisibleIndex="33" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S12" VisibleIndex="34" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S13" VisibleIndex="35" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S14" VisibleIndex="36" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S15" VisibleIndex="37" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S16" VisibleIndex="38" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S17" VisibleIndex="39" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S18" VisibleIndex="40" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S19" VisibleIndex="41" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S20" VisibleIndex="42" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S21" VisibleIndex="43" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S22" VisibleIndex="44" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S23" VisibleIndex="45" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S24" VisibleIndex="46" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S25" VisibleIndex="47" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S26" VisibleIndex="48" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S27" VisibleIndex="49" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S28" VisibleIndex="50" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S29" VisibleIndex="51" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S30" VisibleIndex="52" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S31" VisibleIndex="53" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S32" VisibleIndex="54" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S33" VisibleIndex="55" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S34" VisibleIndex="56" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S35" VisibleIndex="57" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S36" VisibleIndex="58" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S37" VisibleIndex="59" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S38" VisibleIndex="60" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S39" VisibleIndex="61" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S40" VisibleIndex="62" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S41" VisibleIndex="63" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S42" VisibleIndex="64" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S43" VisibleIndex="65" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S44" VisibleIndex="66" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S45" VisibleIndex="67" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S46" VisibleIndex="68" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S47" VisibleIndex="69" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S48" VisibleIndex="70" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S49" VisibleIndex="71" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S50" VisibleIndex="72" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S51" VisibleIndex="73" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S52" VisibleIndex="74" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S53" VisibleIndex="75" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S54" VisibleIndex="76" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S55" VisibleIndex="77" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S56" VisibleIndex="78" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S57" VisibleIndex="79" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S58" VisibleIndex="80" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S59" VisibleIndex="81" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S60" VisibleIndex="82" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S61" VisibleIndex="83" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S62" VisibleIndex="84" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S63" VisibleIndex="85" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S64" VisibleIndex="86" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S65" VisibleIndex="87" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S66" VisibleIndex="88" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S67" VisibleIndex="89" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S68" VisibleIndex="90" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S69" VisibleIndex="91" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S70" VisibleIndex="92" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S71" VisibleIndex="93" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S72" VisibleIndex="94" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S73" VisibleIndex="95" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S74" VisibleIndex="96" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S75" VisibleIndex="97" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="S76" VisibleIndex="98" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="S77" VisibleIndex="99" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S78" VisibleIndex="100" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S79" VisibleIndex="101" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S80" VisibleIndex="102" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S81" VisibleIndex="103" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S82" VisibleIndex="104" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S83" VisibleIndex="105" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S84" VisibleIndex="106" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S85" VisibleIndex="107" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S86" VisibleIndex="108" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S87" VisibleIndex="109" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S88" VisibleIndex="110" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S89" VisibleIndex="111" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S90" VisibleIndex="112" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S91" VisibleIndex="113" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S92" VisibleIndex="114" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S93" VisibleIndex="115" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S94" VisibleIndex="116" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S95" VisibleIndex="117" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S96" VisibleIndex="118" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S97" VisibleIndex="119" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S98" VisibleIndex="120" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S99" VisibleIndex="121" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S100" VisibleIndex="122" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S101" VisibleIndex="123" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S102" VisibleIndex="124" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S103" VisibleIndex="125" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S104" VisibleIndex="126" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S105" VisibleIndex="127" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S106" VisibleIndex="128" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S107" VisibleIndex="129" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S108" VisibleIndex="130" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S109" VisibleIndex="131" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S110" VisibleIndex="132" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S111" VisibleIndex="133" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S112" VisibleIndex="134" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S113" VisibleIndex="135" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S114" VisibleIndex="136" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S115" VisibleIndex="137" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S116" VisibleIndex="138" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S117" VisibleIndex="139" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S118" VisibleIndex="140" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S119" VisibleIndex="141" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S120" VisibleIndex="142" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S121" VisibleIndex="143" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S122" VisibleIndex="144" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S123" VisibleIndex="145" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S124" VisibleIndex="146" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S125" VisibleIndex="147" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S126" VisibleIndex="148" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S127" VisibleIndex="149" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S128" VisibleIndex="150" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S129" VisibleIndex="151" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S130" VisibleIndex="152" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S131" VisibleIndex="153" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S132" VisibleIndex="154" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S133" VisibleIndex="155" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S134" VisibleIndex="156" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S135" VisibleIndex="157" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S136" VisibleIndex="158" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S137" VisibleIndex="159" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S138" VisibleIndex="160" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S139" VisibleIndex="161" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S140" VisibleIndex="162" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S141" VisibleIndex="163" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S142" VisibleIndex="164" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S143" VisibleIndex="165" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S144" VisibleIndex="166" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S145" VisibleIndex="167" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S146" VisibleIndex="168" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S147" VisibleIndex="169" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S148" VisibleIndex="170" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S149" VisibleIndex="171" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S150" VisibleIndex="172" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S151" VisibleIndex="173" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S152" VisibleIndex="174" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S153" VisibleIndex="175" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S154" VisibleIndex="176" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S155" VisibleIndex="177" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S156" VisibleIndex="178" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S157" VisibleIndex="179" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S158" VisibleIndex="180" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S159" VisibleIndex="181" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S160" VisibleIndex="182" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S161" VisibleIndex="183" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S162" VisibleIndex="184" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S163" VisibleIndex="185" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S164" VisibleIndex="186" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S165" VisibleIndex="187" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S166" VisibleIndex="188" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S167" VisibleIndex="189" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S168" VisibleIndex="190" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S169" VisibleIndex="191" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S170" VisibleIndex="192" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S171" VisibleIndex="193" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S172" VisibleIndex="194" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S173" VisibleIndex="195" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S174" VisibleIndex="196" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S175" VisibleIndex="197" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S176" VisibleIndex="198" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S177" VisibleIndex="199" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S178" VisibleIndex="200" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S179" VisibleIndex="201" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S180" VisibleIndex="202" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S181" VisibleIndex="203" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S182" VisibleIndex="204" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S183" VisibleIndex="205" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S184" VisibleIndex="206" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S185" VisibleIndex="207" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S186" VisibleIndex="208" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S187" VisibleIndex="209" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S188" VisibleIndex="210" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S189" VisibleIndex="211" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S190" VisibleIndex="212" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S191" VisibleIndex="213" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S192" VisibleIndex="214" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S193" VisibleIndex="215" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S194" VisibleIndex="216" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S195" VisibleIndex="217" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S196" VisibleIndex="218" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S197" VisibleIndex="219" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S198" VisibleIndex="220" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S199" VisibleIndex="221" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="S200" VisibleIndex="222" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>


            </Columns>



            <SettingsEditing Mode="PopupEditForm" NewItemRowPosition="Bottom" />
            <Settings ShowFilterRow="True" />
            <SettingsText CommandDelete="Sil" CommandEdit="Düzenle" CommandNew="Yeni" CommandUpdate="Güncelle" ConfirmDelete="Silme işlemini onaylıyor musunuz?" />
            <SettingsPopup>
                <EditForm AllowResize="True" MinWidth="750px" Width="500px" />
            </SettingsPopup>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DenetimDbContext %>" 
            SelectCommand="SELECT a.Id, a.SatirGuid, a.FormAdi, a.DenetlemeTar, a.AnketorId, a.AnketorId2, a.AnketorAd, a.AnketorAd2, a.DenekAd, a.KurumKod, a.ProtokolNo, a.GeciciAlan, a.IlKod, a.YeniNo, a.KayitTar1, a.KayıtTar_Denetleyici1, a.CdVarMi, a.KargoyaVerildi, a.KayıtTar_Denetleyici2, a.S01, a.S02, a.S03, a.S04, a.S05, a.S06, a.S07, a.S08, a.S09, a.S10, a.S11, a.S12, a.S13, a.S14, a.S15, a.S16, a.S17, a.S18, a.S19, a.S20, a.S21, a.S22, a.S23, a.S24, a.S25, a.S26, a.S27, a.S28, a.S29, a.S30, a.S31, a.S32, a.S33, a.S34, a.S35, a.S36, a.S37, a.S38, a.S39, a.S40, a.S41, a.S42, a.S43, a.S44, a.S45, a.S46, a.S47, a.S48, a.S49, a.S50, a.S51, a.S52, a.S53, a.S54, a.S55, a.S56, a.S57, a.S58, a.S59, a.S60, a.S61, a.S62, a.S63, a.S64, a.S65, a.S66, a.S67, a.S68, a.S69, a.S70, a.S71, a.S72, a.S73, a.S74, a.S75, a.S76, a.S77, a.S78, a.S79, a.S80, a.S81, a.S82, a.S83, a.S84, a.S85, a.S86, a.S87, a.S88, a.S89, a.S90, a.S91, a.S92, a.S93, a.S94, a.S95, a.S96, a.S97, a.S98, a.S99, a.S100, a.S101, a.S102, a.S103, a.S104, a.S105, a.S106, a.S107, a.S108, a.S109, a.S110, a.S111, a.S112, a.S113, a.S114, a.S115, a.S116, a.S117, a.S118, a.S119, a.S120, a.S121, a.S122, a.S123, a.S124, a.S125, a.S126, a.S127, a.S128, a.S129, a.S130, a.S131, a.S132, a.S133, a.S134, a.S135, a.S136, a.S137, a.S138, a.S139, a.S140, a.S141, a.S142, a.S143, a.S144, a.S145, a.S146, a.S147, a.S148, a.S149, a.S150, a.S151, a.S152, a.S153, a.S154, a.S155, a.S156, a.S157, a.S158, a.S159, a.S160, a.S161, a.S162, a.S163, a.S164, a.S165, a.S166, a.S167, a.S168, a.S169, a.S170, a.S171, a.S172, a.S173, a.S174, a.S175, a.S176, a.S177, a.S178, a.S179, a.S180, a.S181, a.S182, a.S183, a.S184, a.S185, a.S186, a.S187, a.S188, a.S189, a.S190, a.S191, a.S192, a.S193, a.S194, a.S195, a.S196, a.S197, a.S198, a.S199, a.S200, a.SoruAçıklamaBirleşik, KURUM_LISTESI.KurumKod AS Expr1, KURUM_LISTESI.Rol, KURUM_LISTESI.IlKod AS Expr2, KURUM_LISTESI.İl, KURUM_LISTESI.İlçe, KURUM_LISTESI.KurumTur, KURUM_LISTESI.SaglikBolgesi, KURUM_LISTESI.Kurum FROM FORM_YATAYDATA AS a INNER JOIN KURUM_LISTESI ON a.KurumKod = KURUM_LISTESI.KurumKod
             WHERE (a.FormAdi = @FormAdi or @FormAdi='tumu') and (a.AnketorId = @AnketorId or  @AnketorId='tumu') and (a.IlKod=@IlPlaka or @IlPlaka='0')" 
            DeleteCommand="DELETE FROM [FORM_YATAYDATA] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO FORM_YATAYDATA(FormAdi, DenetlemeTar, AnketorId, DenekAd, KurumKod, ProtokolNo, IlKod, YeniNo, S01, S02, S03, S04, S05, S06, S07, S08, S09, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20, S21, S22, S23, S24, S25, S26, S27, S28, S29, S30, S31, S32, S33, S34, S35, S36, S37, S38, S39, S40, S41, S42, S43, S44, S45, S46, S47, S48, S49, S50, S51, S52, S53, S54, S55, S56, S57, S58, S59, S60, S61, S62, S63, S64, S65, S66, S67, S68, S69, S70, S71, S72, S73, S74, S75, KayitTar1, CdVarMi, KargoyaVerildi, KayıtTar_Denetleyici1, KayıtTar_Denetleyici2, AnketorId2) VALUES (@FormAdi, @DenetlemeTar, @AnketorId, @DenekAd, @KurumKod, @ProtokolNo, @IlKod, @YeniNo, @S01, @S02, @S03, @S04, @S05, @S06, @S07, @S08, @S09, @S10, @S11, @S12, @S13, @S14, @S15, @S16, @S17, @S18, @S19, @S20, @S21, @S22, @S23, @S24, @S25, @S26, @S27, @S28, @S29, @S30, @S31, @S32, @S33, @S34, @S35, @S36, @S37, @S38, @S39, @S40, @S41, @S42, @S43, @S44, @S45, @S46, @S47, @S48, @S49, @S50, @S51, @S52, @S53, @S54, @S55, @S56, @S57, @S58, @S59, @S60, @S61, @S62, @S63, @S64, @S65, @S66, @S67, @S68, @S69, @S70, @S71, @S72, @S73, @S74, @S75, @KayitTar1, @CdVarMi, @KargoyaVerildi, @KayıtTar_Denetleyici1, @KayıtTar_Denetleyici2, @AnketorId2)" UpdateCommand="UPDATE FORM_YATAYDATA SET FormAdi = @FormAdi, KayıtTar_Denetleyici1 = @KayıtTar_Denetleyici1, KayıtTar_Denetleyici2 = @KayıtTar_Denetleyici2, DenetlemeTar = @DenetlemeTar, AnketorId = @AnketorId, AnketorId2 = @AnketorId2, DenekAd = @DenekAd, KurumKod = @KurumKod, ProtokolNo = @ProtokolNo, IlKod = @IlKod, YeniNo = @YeniNo, S01 = @S01, S02 = @S02, S03 = @S03, S04 = @S04, S05 = @S05, S06 = @S06, S07 = @S07, S08 = @S08, S09 = @S09, S10 = @S10, S11 = @S11, S12 = @S12, S13 = @S13, S14 = @S14, S15 = @S15, S16 = @S16, S17 = @S17, S18 = @S18, S19 = @S19, S20 = @S20, S21 = @S21, S22 = @S22, S23 = @S23, S24 = @S24, S25 = @S25, S26 = @S26, S27 = @S27, S28 = @S28, S29 = @S29, S30 = @S30, S31 = @S31, S32 = @S32, S33 = @S33, S34 = @S34, S35 = @S35, S36 = @S36, S37 = @S37, S38 = @S38, S39 = @S39, S40 = @S40, S41 = @S41, S42 = @S42, S43 = @S43, S44 = @S44, S45 = @S45, S46 = @S46, S47 = @S47, S48 = @S48, S49 = @S49, S50 = @S50, S51 = @S51, S52 = @S52, S53 = @S53, S54 = @S54, S55 = @S55, S56 = @S56, S57 = @S57, S58 = @S58, S59 = @S59, S60 = @S60, S61 = @S61, S62 = @S62, S63 = @S63, S64 = @S64, S65 = @S65, S66 = @S66, S67 = @S67, S68 = @S68, S69 = @S69, S70 = @S70, S71 = @S71, S72 = @S72, S73 = @S73, S74 = @S74, S75 = @S75, CdVarMi = @CdVarMi, KargoyaVerildi = @KargoyaVerildi WHERE (Id = @Id)">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FormAdi" Type="String" />
                <asp:Parameter Name="DenetlemeTar" Type="String" />
                <asp:Parameter Name="AnketorId" Type="String" />
                <asp:Parameter Name="DenekAd" Type="String" />
                <asp:Parameter Name="KurumKod" Type="String" />
                <asp:Parameter Name="ProtokolNo" Type="String" />
                <asp:Parameter Name="IlKod" Type="Int32" />
                <asp:Parameter Name="YeniNo" Type="String" />
                <asp:Parameter Name="S01" Type="String" />
                <asp:Parameter Name="S02" Type="String" />
                <asp:Parameter Name="S03" Type="String" />
                <asp:Parameter Name="S04" Type="String" />
                <asp:Parameter Name="S05" Type="String" />
                <asp:Parameter Name="S06" Type="String" />
                <asp:Parameter Name="S07" Type="String" />
                <asp:Parameter Name="S08" Type="String" />
                <asp:Parameter Name="S09" Type="String" />
                <asp:Parameter Name="S10" Type="String" />
                <asp:Parameter Name="S11" Type="String" />
                <asp:Parameter Name="S12" Type="String" />
                <asp:Parameter Name="S13" Type="String" />
                <asp:Parameter Name="S14" Type="String" />
                <asp:Parameter Name="S15" Type="String" />
                <asp:Parameter Name="S16" Type="String" />
                <asp:Parameter Name="S17" Type="String" />
                <asp:Parameter Name="S18" Type="String" />
                <asp:Parameter Name="S19" Type="String" />
                <asp:Parameter Name="S20" Type="String" />
                <asp:Parameter Name="S21" Type="String" />
                <asp:Parameter Name="S22" Type="String" />
                <asp:Parameter Name="S23" Type="String" />
                <asp:Parameter Name="S24" Type="String" />
                <asp:Parameter Name="S25" Type="String" />
                <asp:Parameter Name="S26" Type="String" />
                <asp:Parameter Name="S27" Type="String" />
                <asp:Parameter Name="S28" Type="String" />
                <asp:Parameter Name="S29" Type="String" />
                <asp:Parameter Name="S30" Type="String" />
                <asp:Parameter Name="S31" Type="String" />
                <asp:Parameter Name="S32" Type="String" />
                <asp:Parameter Name="S33" Type="String" />
                <asp:Parameter Name="S34" Type="String" />
                <asp:Parameter Name="S35" Type="String" />
                <asp:Parameter Name="S36" Type="String" />
                <asp:Parameter Name="S37" Type="String" />
                <asp:Parameter Name="S38" Type="String" />
                <asp:Parameter Name="S39" Type="String" />
                <asp:Parameter Name="S40" Type="String" />
                <asp:Parameter Name="S41" Type="String" />
                <asp:Parameter Name="S42" Type="String" />
                <asp:Parameter Name="S43" Type="String" />
                <asp:Parameter Name="S44" Type="String" />
                <asp:Parameter Name="S45" Type="String" />
                <asp:Parameter Name="S46" Type="String" />
                <asp:Parameter Name="S47" Type="String" />
                <asp:Parameter Name="S48" Type="String" />
                <asp:Parameter Name="S49" Type="String" />
                <asp:Parameter Name="S50" Type="String" />
                <asp:Parameter Name="S51" Type="String" />
                <asp:Parameter Name="S52" Type="String" />
                <asp:Parameter Name="S53" Type="String" />
                <asp:Parameter Name="S54" Type="String" />
                <asp:Parameter Name="S55" Type="String" />
                <asp:Parameter Name="S56" Type="String" />
                <asp:Parameter Name="S57" Type="String" />
                <asp:Parameter Name="S58" Type="String" />
                <asp:Parameter Name="S59" Type="String" />
                <asp:Parameter Name="S60" Type="String" />
                <asp:Parameter Name="S61" Type="String" />
                <asp:Parameter Name="S62" Type="String" />
                <asp:Parameter Name="S63" Type="String" />
                <asp:Parameter Name="S64" Type="String" />
                <asp:Parameter Name="S65" Type="String" />
                <asp:Parameter Name="S66" Type="String" />
                <asp:Parameter Name="S67" Type="String" />
                <asp:Parameter Name="S68" Type="String" />
                <asp:Parameter Name="S69" Type="String" />
                <asp:Parameter Name="S70" Type="String" />
                <asp:Parameter Name="S71" Type="String" />
                <asp:Parameter Name="S72" Type="String" />
                <asp:Parameter Name="S73" Type="String" />
                <asp:Parameter Name="S74" Type="String" />
                <asp:Parameter Name="S75" Type="String" />
                <asp:Parameter Name="KayitTar1" Type="DateTime" />
                <asp:Parameter Name="CdVarMi" Type="Boolean" />
                <asp:Parameter Name="KargoyaVerildi" Type="Boolean" />
                <asp:Parameter Name="KayıtTar_Denetleyici1" />
                <asp:Parameter Name="KayıtTar_Denetleyici2" />
                <asp:Parameter Name="AnketorId2" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="tumu" Name="FormAdi" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="hiddenAnketor" DefaultValue="tumu" Name="AnketorId" PropertyName="Value"  Type="String" />  
                 <asp:ControlParameter ControlID="hiddenIlPlaka" DefaultValue="0" Name="IlPlaka" PropertyName="Value"  Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FormAdi" Type="String" />
                <asp:Parameter Name="DenetlemeTar" Type="String" />
                <asp:Parameter Name="AnketorId" Type="String" />
                <asp:Parameter Name="DenekAd" Type="String" />
                <asp:Parameter Name="KurumKod" Type="String" />
                <asp:Parameter Name="ProtokolNo" Type="String" />
                <asp:Parameter Name="IlKod" Type="Int32" />
                <asp:Parameter Name="YeniNo" Type="String" />
                <asp:Parameter Name="S01" Type="String" />
                <asp:Parameter Name="S02" Type="String" />
                <asp:Parameter Name="S03" Type="String" />
                <asp:Parameter Name="S04" Type="String" />
                <asp:Parameter Name="S05" Type="String" />
                <asp:Parameter Name="S06" Type="String" />
                <asp:Parameter Name="S07" Type="String" />
                <asp:Parameter Name="S08" Type="String" />
                <asp:Parameter Name="S09" Type="String" />
                <asp:Parameter Name="S10" Type="String" />
                <asp:Parameter Name="S11" Type="String" />
                <asp:Parameter Name="S12" Type="String" />
                <asp:Parameter Name="S13" Type="String" />
                <asp:Parameter Name="S14" Type="String" />
                <asp:Parameter Name="S15" Type="String" />
                <asp:Parameter Name="S16" Type="String" />
                <asp:Parameter Name="S17" Type="String" />
                <asp:Parameter Name="S18" Type="String" />
                <asp:Parameter Name="S19" Type="String" />
                <asp:Parameter Name="S20" Type="String" />
                <asp:Parameter Name="S21" Type="String" />
                <asp:Parameter Name="S22" Type="String" />
                <asp:Parameter Name="S23" Type="String" />
                <asp:Parameter Name="S24" Type="String" />
                <asp:Parameter Name="S25" Type="String" />
                <asp:Parameter Name="S26" Type="String" />
                <asp:Parameter Name="S27" Type="String" />
                <asp:Parameter Name="S28" Type="String" />
                <asp:Parameter Name="S29" Type="String" />
                <asp:Parameter Name="S30" Type="String" />
                <asp:Parameter Name="S31" Type="String" />
                <asp:Parameter Name="S32" Type="String" />
                <asp:Parameter Name="S33" Type="String" />
                <asp:Parameter Name="S34" Type="String" />
                <asp:Parameter Name="S35" Type="String" />
                <asp:Parameter Name="S36" Type="String" />
                <asp:Parameter Name="S37" Type="String" />
                <asp:Parameter Name="S38" Type="String" />
                <asp:Parameter Name="S39" Type="String" />
                <asp:Parameter Name="S40" Type="String" />
                <asp:Parameter Name="S41" Type="String" />
                <asp:Parameter Name="S42" Type="String" />
                <asp:Parameter Name="S43" Type="String" />
                <asp:Parameter Name="S44" Type="String" />
                <asp:Parameter Name="S45" Type="String" />
                <asp:Parameter Name="S46" Type="String" />
                <asp:Parameter Name="S47" Type="String" />
                <asp:Parameter Name="S48" Type="String" />
                <asp:Parameter Name="S49" Type="String" />
                <asp:Parameter Name="S50" Type="String" />
                <asp:Parameter Name="S51" Type="String" />
                <asp:Parameter Name="S52" Type="String" />
                <asp:Parameter Name="S53" Type="String" />
                <asp:Parameter Name="S54" Type="String" />
                <asp:Parameter Name="S55" Type="String" />
                <asp:Parameter Name="S56" Type="String" />
                <asp:Parameter Name="S57" Type="String" />
                <asp:Parameter Name="S58" Type="String" />
                <asp:Parameter Name="S59" Type="String" />
                <asp:Parameter Name="S60" Type="String" />
                <asp:Parameter Name="S61" Type="String" />
                <asp:Parameter Name="S62" Type="String" />
                <asp:Parameter Name="S63" Type="String" />
                <asp:Parameter Name="S64" Type="String" />
                <asp:Parameter Name="S65" Type="String" />
                <asp:Parameter Name="S66" Type="String" />
                <asp:Parameter Name="S67" Type="String" />
                <asp:Parameter Name="S68" Type="String" />
                <asp:Parameter Name="S69" Type="String" />
                <asp:Parameter Name="S70" Type="String" />
                <asp:Parameter Name="S71" Type="String" />
                <asp:Parameter Name="S72" Type="String" />
                <asp:Parameter Name="S73" Type="String" />
                <asp:Parameter Name="S74" Type="String" />
                <asp:Parameter Name="S75" Type="String" />
                <asp:Parameter Name="KayitTar1" Type="DateTime" />
                <asp:Parameter Name="KayitTar2" Type="DateTime" />
                <asp:Parameter Name="CdVarMi" Type="Boolean" />
                <asp:Parameter Name="KargoyaVerildi" Type="Boolean" />
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="KayıtTar_Denetleyici1" />
                <asp:Parameter Name="KayıtTar_Denetleyici2" />
                <asp:Parameter Name="AnketorId2" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
