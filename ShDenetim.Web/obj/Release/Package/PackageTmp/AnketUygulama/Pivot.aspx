﻿<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="Pivot.aspx.cs" Inherits="ShDenetim.Web.AnketUygulama.Pivot" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid.Export" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
     <a href="javascript:history.go(-1)">Geri</a>

        <br />
    
        
    
<asp:LinkButton ID="lnkExcel" runat="server" OnClick="lnkExcel_Click">Excel Çıktı</asp:LinkButton>
        <br />
        <dx:ASPxPivotCustomizationControl CssClass="floatLetf"  ID="ASPxPivotCustomizationControl1" runat="server" Height="580px" Width="226px" ASPxPivotGridID="ASPxPivotGrid1">
        </dx:ASPxPivotCustomizationControl>
       <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="Aqua">
            <Fields>
                <dx:PivotGridField ID="fieldId" FieldName="Id" AreaIndex="0" SummaryType="Count" Area="DataArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSatirGuid" AreaIndex="1" FieldName="SatirGuid" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFormAdi" AreaIndex="0" FieldName="FormAdi">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDenetlemeTar" AreaIndex="2" FieldName="DenetlemeTar" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAnketorId" AreaIndex="2" FieldName="AnketorId" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDenekAd" AreaIndex="2" FieldName="DenekAd" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldKurumKod" AreaIndex="2" FieldName="KurumKod" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProtokolNo" AreaIndex="2" FieldName="ProtokolNo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldIlKod" AreaIndex="2" FieldName="IlKod" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldKurum" AreaIndex="2" FieldName="Kurum" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldIlAd" AreaIndex="2" FieldName="IlAd" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldUstBolge" AreaIndex="2" FieldName="UstBolge" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldKurumTur" AreaIndex="2" FieldName="KurumTur" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSaglikBolgesi" AreaIndex="2" FieldName="SaglikBolgesi" Visible="False">
                </dx:PivotGridField>

                 <dx:PivotGridField ID="fieldKullaniciAdSoyad" AreaIndex="2" FieldName="KullaniciAdSoyad" Visible="False">
                </dx:PivotGridField>
                


                <dx:PivotGridField ID="fieldS01" AreaIndex="90" FieldName="S01" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS02" AreaIndex="14" FieldName="S02" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS03" AreaIndex="14" FieldName="S03" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS04" AreaIndex="14" FieldName="S04" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS05" AreaIndex="14" FieldName="S05" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS06" AreaIndex="14" FieldName="S06" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS07" AreaIndex="14" FieldName="S07" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS08" AreaIndex="14" FieldName="S08" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS09" AreaIndex="14" FieldName="S09" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS10" AreaIndex="14" FieldName="S10" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS11" AreaIndex="14" FieldName="S11" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS12" AreaIndex="14" FieldName="S12" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS13" AreaIndex="14" FieldName="S13" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS14" AreaIndex="14" FieldName="S14" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS15" AreaIndex="14" FieldName="S15" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS16" AreaIndex="14" FieldName="S16" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS17" AreaIndex="14" FieldName="S17" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS18" AreaIndex="14" FieldName="S18" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS19" AreaIndex="14" FieldName="S19" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS20" AreaIndex="14" FieldName="S20" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS21" AreaIndex="14" FieldName="S21" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS22" AreaIndex="14" FieldName="S22" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS23" AreaIndex="14" FieldName="S23" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS24" AreaIndex="14" FieldName="S24" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS25" AreaIndex="14" FieldName="S25" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS26" AreaIndex="14" FieldName="S26" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS27" AreaIndex="14" FieldName="S27" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS28" AreaIndex="14" FieldName="S28" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS29" AreaIndex="14" FieldName="S29" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS30" AreaIndex="14" FieldName="S30" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS31" AreaIndex="14" FieldName="S31" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS32" AreaIndex="14" FieldName="S32" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS33" AreaIndex="14" FieldName="S33" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS34" AreaIndex="14" FieldName="S34" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS35" AreaIndex="14" FieldName="S35" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS36" AreaIndex="14" FieldName="S36" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS37" AreaIndex="14" FieldName="S37" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS38" AreaIndex="14" FieldName="S38" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS39" AreaIndex="14" FieldName="S39" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS40" AreaIndex="14" FieldName="S40" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS41" AreaIndex="14" FieldName="S41" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS42" AreaIndex="14" FieldName="S42" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS43" AreaIndex="14" FieldName="S43" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS44" AreaIndex="14" FieldName="S44" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS45" AreaIndex="14" FieldName="S45" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS46" AreaIndex="14" FieldName="S46" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS47" AreaIndex="14" FieldName="S47" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS48" AreaIndex="14" FieldName="S48" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS49" AreaIndex="14" FieldName="S49" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS50" AreaIndex="14" FieldName="S50" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS51" AreaIndex="14" FieldName="S51" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS52" AreaIndex="14" FieldName="S52" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS53" AreaIndex="14" FieldName="S53" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS54" AreaIndex="14" FieldName="S54" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS55" AreaIndex="14" FieldName="S55" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS56" AreaIndex="14" FieldName="S56" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS57" AreaIndex="14" FieldName="S57" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS58" AreaIndex="14" FieldName="S58" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS59" AreaIndex="14" FieldName="S59" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS60" AreaIndex="14" FieldName="S60" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS61" AreaIndex="14" FieldName="S61" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS62" AreaIndex="14" FieldName="S62" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS63" AreaIndex="14" FieldName="S63" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS64" AreaIndex="14" FieldName="S64" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS65" AreaIndex="14" FieldName="S65" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS66" AreaIndex="14" FieldName="S66" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS67" AreaIndex="14" FieldName="S67" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS68" AreaIndex="14" FieldName="S68" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS69" AreaIndex="14" FieldName="S69" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS70" AreaIndex="14" FieldName="S70" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS71" AreaIndex="14" FieldName="S71" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS72" AreaIndex="14" FieldName="S72" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS73" AreaIndex="14" FieldName="S73" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS74" AreaIndex="14" FieldName="S74" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldS75" AreaIndex="14" FieldName="S75" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldKayitTar1" AreaIndex="14" FieldName="KayitTar1" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldKayitTar2" AreaIndex="14" FieldName="KayitTar2" Visible="False">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="100" ShowSeparators="True">
            </OptionsPager>
        </dx:ASPxPivotGrid>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
        </dx:ASPxPivotGridExporter>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DenetimDbContext %>" SelectCommand="SELECT a.Id, a.SatirGuid, a.FormAdi, a.DenetlemeTar, a.AnketorId, a.AnketorId2, a.AnketorAd, a.AnketorAd2, a.DenekAd, a.KurumKod, a.ProtokolNo, a.GeciciAlan, a.IlKod, a.YeniNo, a.KayitTar1, a.KayıtTar_Denetleyici1, a.CdVarMi, a.KargoyaVerildi, a.KayıtTar_Denetleyici2, a.S01, a.S02, a.S03, a.S04, a.S05, a.S06, a.S07, a.S08, a.S09, a.S10, a.S11, a.S12, a.S13, a.S14, a.S15, a.S16, a.S17, a.S18, a.S19, a.S20, a.S21, a.S22, a.S23, a.S24, a.S25, a.S26, a.S27, a.S28, a.S29, a.S30, a.S31, a.S32, a.S33, a.S34, a.S35, a.S36, a.S37, a.S38, a.S39, a.S40, a.S41, a.S42, a.S43, a.S44, a.S45, a.S46, a.S47, a.S48, a.S49, a.S50, a.S51, a.S52, a.S53, a.S54, a.S55, a.S56, a.S57, a.S58, a.S59, a.S60, a.S61, a.S62, a.S63, a.S64, a.S65, a.S66, a.S67, a.S68, a.S69, a.S70, a.S71, a.S72, a.S73, a.S74, a.S75, a.S76, a.S77, a.S78, a.S79, a.S80, a.S81, a.S82, a.S83, a.S84, a.S85, a.S86, a.S87, a.S88, a.S89, a.S90, a.S91, a.S92, a.S93, a.S94, a.S95, a.S96, a.S97, a.S98, a.S99, a.S100, a.S101, a.S102, a.S103, a.S104, a.S105, a.S106, a.S107, a.S108, a.S109, a.S110, a.S111, a.S112, a.S113, a.S114, a.S115, a.S116, a.S117, a.S118, a.S119, a.S120, a.S121, a.S122, a.S123, a.S124, a.S125, a.S126, a.S127, a.S128, a.S129, a.S130, a.S131, a.S132, a.S133, a.S134, a.S135, a.S136, a.S137, a.S138, a.S139, a.S140, a.S141, a.S142, a.S143, a.S144, a.S145, a.S146, a.S147, a.S148, a.S149, a.S150, a.S151, a.S152, a.S153, a.S154, a.S155, a.S156, a.S157, a.S158, a.S159, a.S160, a.S161, a.S162, a.S163, a.S164, a.S165, a.S166, a.S167, a.S168, a.S169, a.S170, a.S171, a.S172, a.S173, a.S174, a.S175, a.S176, a.S177, a.S178, a.S179, a.S180, a.S181, a.S182, a.S183, a.S184, a.S185, a.S186, a.S187, a.S188, a.S189, a.S190, a.S191, a.S192, a.S193, a.S194, a.S195, a.S196, a.S197, a.S198, a.S199, a.S200, a.SoruAçıklamaBirleşik FROM FORM_YATAYDATA AS a LEFT OUTER JOIN Kullanicilar ON a.AnketorId = Kullanicilar.KullaniciID LEFT OUTER JOIN ILPLAKA ON a.IlKod = ILPLAKA.IlKod LEFT OUTER JOIN KURUM_LISTESI ON a.KurumKod = KURUM_LISTESI.KurumKod">
        </asp:SqlDataSource>

        </form>
</asp:Content>
