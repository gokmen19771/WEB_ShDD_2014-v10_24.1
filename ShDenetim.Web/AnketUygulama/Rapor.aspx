﻿<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="Rapor.aspx.cs" Inherits="ShDenetim.Web.AnketUygulama.Rapor" %>
<%@ Register assembly="DevExpress.XtraCharts.v14.1.Web, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <a href="javascript:history.go(-1)">Geri</a><br /><br />
    <form id="form1" runat="server">
        <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <dx:GridViewDataMemoColumn Caption="Form Adı" FieldName="FormAdı" VisibleIndex="0" Width="100px">
                    <HeaderStyle Wrap="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Toplam Örneklem Sayısı" FieldName="ToplamÖrneklemHastaSayısı" VisibleIndex="1" Width="70px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle Wrap="True">
                    </CellStyle>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Koordinatör Tarafından  Doldurulan Hasta S." FieldName="KoordinatorTarafındanDoldurulanHastaSayısı" VisibleIndex="2" Width="70px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle Wrap="True">
                    </CellStyle>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Cd Si olan Hasta Sayısı" FieldName="CdOlanHastaSayısı" VisibleIndex="3" Width="70px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle Wrap="True">
                    </CellStyle>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Kargoya Verilen Sayı" FieldName="KargoyaVerilenSayı" VisibleIndex="4" Width="70px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle Wrap="True">
                    </CellStyle>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Atanan Denetleyici Sayısı" FieldName="AtananDenetleyiciSayısı" VisibleIndex="5" Width="70px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle Wrap="True">
                    </CellStyle>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Denetleyicinin Doldurduğu Hasta Sayısı" FieldName="DenetleyiciTarafındanDoldurulanHastaSayısı" VisibleIndex="7" Width="70px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle Wrap="True">
                    </CellStyle>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Denetleyicinin Bildirdiği Sorun/Not Sayısı" FieldName="DenetleyicininBildirdiğiNotSorunSayısı" VisibleIndex="6" Width="70px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle Wrap="True">
                    </CellStyle>
                </dx:GridViewDataMemoColumn>
            </Columns>
        </dx:ASPxGridView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</asp:Content>
