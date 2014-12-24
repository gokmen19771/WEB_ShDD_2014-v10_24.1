<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="ShDenetim.Web.Account.Giris1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <table style="width:320px;box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);margin:auto">
            <tr>
                <td class="kutu-header-mavi" colspan="3">Kullanıcı Giriş</td>
            </tr>
            <tr>
                <td style="height: 23px">Kullanıcı E-Posta</td>
                <td style="height: 23px">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td style="height: 23px; width: 20px;"></td>
            </tr>
            <tr>
                <td style="height: 23px">Parola</td>
                <td style="height: 23px">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td style="height: 23px; width: 20px;"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnGiris" runat="server" OnClick="btnGiris_Click" Text="Giriş" />
                </td>
                <td style="width: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:LinkButton ID="lnkSifremiUnuttum" runat="server" onclick="lnkSifremiUnuttum_Click">İlk Giriş / Parolamı Unuttum </asp:LinkButton>
                </td>
                <td style="width: 20px">&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>
