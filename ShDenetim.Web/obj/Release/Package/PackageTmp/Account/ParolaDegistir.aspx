<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="ParolaDegistir.aspx.cs" Inherits="ShDenetim.Web.Account.ParolaDegistir1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <table id="IlkParola" align="center" class="TableParola" style="border: thin solid #A2A2A2; width: 40%;">
                    <tr>
                        <td align="center" colspan="2" style="height: 26px">
                            <asp:Label ID="lblParolaIstemBaslik" runat="server" Font-Bold="True" ForeColor="White" Text="Parola Değiştir"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="height: 21px; width: 114px;">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtParola" ForeColor="#003300">Yeni Parola :</asp:Label>
                        </td>
                        <td align="left" style="height: 21px; width: 278px;">
                            <asp:TextBox ID="txtParola" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="height: 18px; width: 114px;">
                            <asp:Label ID="UserNameLabel0" runat="server" AssociatedControlID="txtParolaTekrar" ForeColor="#003300">Parola Tekrar :</asp:Label>
                        </td>
                        <td align="left" style="height: 18px; width: 278px;">
                            <asp:TextBox ID="txtParolaTekrar" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtParola" ControlToValidate="txtParolaTekrar" ErrorMessage="Parolalar Uyuşmuyor"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2" style="height: 32px">
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Gönder" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table id="tblBasarili" align="center" class="TableIconluUyarı" style="width: 58%">
                    <tr>
                        <td style="width: 61px">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Mavi/images/Onay48x48.png" />
                        </td>
                        <td style="width: 257px">
                            <asp:Label ID="lblBasariliText" runat="server" Text="Label"></asp:Label>
                            <br />

                            

                            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="http://212.175.169.86/Account/Giris.Aspx?ReturnUrl=%2fAnketUygulama%2fMainPage.aspx">Ana Sayfaya Dön</asp:LinkButton>
                            <br />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <table id="tblBasarili0" align="center" class="TableIconluUyarı" style="width: 58%">
                    <tr>
                        <td style="width: 61px">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/App_Themes/Mavi/images/Hata48x48.png" />
                        </td>
                        <td style="width: 265px">
                            <asp:Label ID="lblHataText" runat="server" Text="Label"></asp:Label>
                            <br />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </form>
</asp:Content>
