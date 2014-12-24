﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AnketUygulama/App.Master" AutoEventWireup="true" CodeBehind="Formlar.aspx.cs" Inherits="ShDenetim.Web.AnketUygulama.Formlar" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">


        <p>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" KeyFieldName="Id" Width="100%" OnRowDeleting="sil" OnRowInserting="ASPxGridView1_RowInserting" OnRowUpdating="ASPxGridView1_RowUpdating" Theme="Office2003Olive" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize" OnDataBound="ASPxGridView1_DataBound" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared" OnHtmlRowCreated="ASPxGridView1_HtmlRowCreated" OnStartRowEditing="ASPxGridView1_StartRowEditing">
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0">
                          <NewButton Visible="True" >
                        </NewButton>
                        <EditButton Visible="True">
                        </EditButton>
                      
                          <DeleteButton Visible="True">
                          </DeleteButton>
                          <ClearFilterButton Visible="True">
                          </ClearFilterButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Id"  VisibleIndex="1" ReadOnly="True">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DenekTc" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="KurumCkys" VisibleIndex="3" ReadOnly="true">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDropDownEditColumn FieldName="FormAdi" VisibleIndex="2">
                    </dx:GridViewDataDropDownEditColumn>
                    <dx:GridViewDataTextColumn FieldName="DenetleyiciTc" VisibleIndex="4" ReadOnly="true">
                    </dx:GridViewDataTextColumn>




                    <dx:GridViewDataTextColumn Caption="Kargoya Teslim Tarihi" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ulaşma Tarihi" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>




                    <dx:GridViewDataButtonEditColumn Caption="Hasta/Film Ayrıntıları" FieldName="Id" VisibleIndex="8">
                        <DataItemTemplate>
                            <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl='<%# String.Format("AnketForm.aspx?FormAdi={0}&KurumCkys={1}&Denetleyici={2}&Denek={3}", Eval("FormAdi"),Eval("KurumCkys"),Eval("DenetleyiciTc"),Eval("DenekTc")) %>' Text="Form Doldur" Font-Bold="False" ForeColor="Red"  >
                                <Border BorderColor="#CC3300" BorderStyle="Solid" BorderWidth="1px" />
                                <BorderBottom BorderColor="#FFFF66" />
                            </dx:ASPxHyperLink>
                        </DataItemTemplate>
                    </dx:GridViewDataButtonEditColumn>




                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                <SettingsEditing Mode="EditForm" NewItemRowPosition="Bottom" />
              
             
                <Templates>
                      <EditForm>
                            <div style="padding: 4px 4px 3px 4px">
                               <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Text='<%# Bind("DenekTc") %>' Theme="BlackGlass" Width="170px">
                               </dx:ASPxTextBox>
                                <dx:ASPxComboBox ID="ASPxComboBox1"  TextField='<%# Bind("FormAdi") %>' ValueField='<%# Bind("FormAdi") %>' runat="server" ValueType="System.String"></dx:ASPxComboBox>
                            

                            </div>


                            <div style="text-align: right; padding: 2px 2px 2px 2px">
                                <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                    runat="server">
                                </dx:ASPxGridViewTemplateReplacement>
                                <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                    runat="server">
                                </dx:ASPxGridViewTemplateReplacement>
                            </div>
                    
                      </EditForm>
                </Templates>
            </dx:ASPxGridView>
        </p>
    </form>
</asp:Content>