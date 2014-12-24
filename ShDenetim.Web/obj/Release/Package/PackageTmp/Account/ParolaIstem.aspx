<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" AutoEventWireup="true" CodeBehind="ParolaIstem.aspx.cs" Inherits="ShDenetim.Web.Account.ParolaIstem1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 160px;
            height: 41px;
              text-align:right;
        }
        .auto-style2 {
            height: 41px;
          
        }
        .auto-style3 {
            width: 61px;
            height: 52px;
        }
        .auto-style4 {
            width: 257px;
            height: 52px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <table id="IlkParola0" align="center" class="TableParola" style="border: thin solid #A0A0A0; width: 66%;">
                    <tr>
                        <td colspan="2" style="height: 24px">
                            <asp:Label ID="lblParolaBaslik" runat="server" Font-Bold="True" ForeColor="White" Text="Parola İstemi"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="UserNameLabel0" runat="server" ForeColor="#003300">Tanımlı Mail Adresiniz :</asp:Label>
                        </td>
                        <td align="left" class="auto-style2">
                            <asp:TextBox ID="txtMailAdresi" runat="server" Width="70%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2" style="height: 32px">
                            <asp:Button ID="Button2" runat="server" onclick="Button1_Click" Text="Gönder" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table id="tblBasarili" align="center" class="TableIconluUyarı" style="width: 67%">
                    <tr>
                        <td style="width: 48px" class="auto-style3">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Mavi/images/Onay48x48.png" />
                        </td>
                        <td class="auto-style4">
                            <asp:Label ID="lblBasariliText" runat="server" Text="Label"></asp:Label><br />
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="javascript:window.close();">Pencereyi Kapat</asp:LinkButton>
                            <br />
                        </td>
                    </tr>
                </table>
                <br />
            </asp:View>
            <asp:View ID="View3" runat="server">
                <table id="tblBasarili0" align="center" class="TableIconluUyarı" style="width: 66%">
                    <tr>
                        <td style="width: 48px">
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
