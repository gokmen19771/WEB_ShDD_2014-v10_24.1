<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KurumListesi.aspx.cs" Inherits="ShDenetim.Web.AnketUygulama.KurumListesi" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <a href="javascript:history.go(-1)">Geri</a>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DenetimDbContext %>" 
            DeleteCommand="DELETE FROM [KURUMLAR_FULL] WHERE [KurumKod] = @KurumKod" 
            InsertCommand="INSERT INTO [KURUMLAR_FULL] ([KurumKod], [Kurum], [Rol], [IlKod], [İl], [İlçe], [KurumTur], [SaglikBolgesi], [İlliKurum], [İlliKurumT], [KOD_ILCE], [TIPI_SAHIBI], [KURUMTURU_KOD], [KURUMTURU_AD], [KURUM_TIPI_KOD], [KURUM_TIPI_AD], [FAALDURUM], [GörüneceğiFormlar],[GörüneceğiFormlar1]) VALUES (@KurumKod, @Kurum, @Rol, @IlKod, @İl, @İlçe, @KurumTur, @SaglikBolgesi, @İlliKurum, @İlliKurumT, @KOD_ILCE, @TIPI_SAHIBI, @KURUMTURU_KOD, @KURUMTURU_AD, @KURUM_TIPI_KOD, @KURUM_TIPI_AD, @FAALDURUM, @GörüneceğiFormlar,@GörüneceğiFormlar1)" SelectCommand="SELECT * FROM [KURUMLAR_FULL]" 
            UpdateCommand="UPDATE [KURUMLAR_FULL] SET  [Kurum] = @Kurum, [Rol] = @Rol, [IlKod] = @IlKod, [İl] = @İl, [İlçe] = @İlçe, [KurumTur] = @KurumTur, [SaglikBolgesi] = @SaglikBolgesi, [İlliKurum] = @İlliKurum, [İlliKurumT] = @İlliKurumT, [KOD_ILCE] = @KOD_ILCE, [TIPI_SAHIBI] = @TIPI_SAHIBI, [KURUMTURU_KOD] = @KURUMTURU_KOD, [KURUMTURU_AD] = @KURUMTURU_AD, [KURUM_TIPI_KOD] = @KURUM_TIPI_KOD, [KURUM_TIPI_AD] = @KURUM_TIPI_AD, [FAALDURUM] = @FAALDURUM, [GörüneceğiFormlar] = @GörüneceğiFormlar,[GörüneceğiFormlar1] = @GörüneceğiFormlar1 WHERE [KurumKod] = @KurumKod">
            <DeleteParameters>
                <asp:Parameter Name="KurumKod" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="KurumKod" Type="String" />
                <asp:Parameter Name="Kurum" Type="String" />
                <asp:Parameter Name="Rol" Type="String" />
                <asp:Parameter Name="IlKod" Type="Int32" />
                <asp:Parameter Name="İl" Type="String" />
                <asp:Parameter Name="İlçe" Type="String" />
                <asp:Parameter Name="KurumTur" Type="String" />
                <asp:Parameter Name="SaglikBolgesi" Type="String" />
                <asp:Parameter Name="İlliKurum" Type="String" />
                <asp:Parameter Name="İlliKurumT" Type="String" />
                <asp:Parameter Name="KOD_ILCE" Type="Int32" />
                <asp:Parameter Name="TIPI_SAHIBI" Type="Int32" />
                <asp:Parameter Name="KURUMTURU_KOD" Type="Int32" />
                <asp:Parameter Name="KURUMTURU_AD" Type="String" />
                <asp:Parameter Name="KURUM_TIPI_KOD" Type="Int32" />
                <asp:Parameter Name="KURUM_TIPI_AD" Type="String" />
                <asp:Parameter Name="FAALDURUM" Type="String" />
                <asp:Parameter Name="GörüneceğiFormlar" Type="String" />
                <asp:Parameter Name="GörüneceğiFormlar1" Type="String" />

            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="Kurum" Type="String" />
                <asp:Parameter Name="Rol" Type="String" />
                <asp:Parameter Name="IlKod" Type="Int32" />
                <asp:Parameter Name="İl" Type="String" />
                <asp:Parameter Name="İlçe" Type="String" />
                <asp:Parameter Name="KurumTur" Type="String" />
                <asp:Parameter Name="SaglikBolgesi" Type="String" />
                <asp:Parameter Name="İlliKurum" Type="String" />
                <asp:Parameter Name="İlliKurumT" Type="String" />
                <asp:Parameter Name="KOD_ILCE" Type="Int32" />
                <asp:Parameter Name="TIPI_SAHIBI" Type="Int32" />
                <asp:Parameter Name="KURUMTURU_KOD" Type="Int32" />
                <asp:Parameter Name="KURUMTURU_AD" Type="String" />
                <asp:Parameter Name="KURUM_TIPI_KOD" Type="Int32" />
                <asp:Parameter Name="KURUM_TIPI_AD" Type="String" />
                <asp:Parameter Name="FAALDURUM" Type="String" />
                <asp:Parameter Name="GörüneceğiFormlar" Type="String" />
                  <asp:Parameter Name="GörüneceğiFormlar1" Type="String" />
                <asp:Parameter Name="KurumKod" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <dx:ASPxButton ID="ASPxButton4" runat="server" OnClick="ASPxButton4_Click" Text="Excele Aktar">
        </dx:ASPxButton>
        <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="KurumKod">
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KurumKod" ReadOnly="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Kurum" VisibleIndex="3">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Rol" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IlKod" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="İl" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="İlçe" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KurumTur" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SaglikBolgesi" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="İlliKurum" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="İlliKurumT" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KOD_ILCE" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TIPI_SAHIBI" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KURUMTURU_KOD" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KURUMTURU_AD" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KURUM_TIPI_KOD" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KURUM_TIPI_AD" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FAALDURUM" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn FieldName="GörüneceğiFormlar" VisibleIndex="19">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataMemoColumn>

                <dx:GridViewDataMemoColumn FieldName="GörüneceğiFormlar1" VisibleIndex="19">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataMemoColumn>

            </Columns>
            <Settings ShowFilterRow="True" />
        </dx:ASPxGridView>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
