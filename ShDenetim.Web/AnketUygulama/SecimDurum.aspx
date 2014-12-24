﻿<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="SecimDurum.aspx.cs" Inherits="ShDenetim.Web.AnketUygulama.SecimDurum" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

            <a href="javascript:history.go(-1)">Geri</a>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1">
            </dx:ASPxGridViewExporter>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Excel Aktar" />
        <br />

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="KurumKod" VisibleIndex="0" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SecimAdet" VisibleIndex="1" Width="20px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Kurum" VisibleIndex="2" Width="400px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="İl" VisibleIndex="3" Width="50px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FormAdi" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager PageSize="500">
                <PageSizeItemSettings Items="500, 1000">
                </PageSizeItemSettings>
            </SettingsPager>
            <Settings ShowFilterRow="True" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DenetimDbContext %>" SelectCommand="SELECT * FROM [vwSecimDurum]"></asp:SqlDataSource>
    </form>
</asp:Content>
