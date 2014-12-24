<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="KurumsalBilgi.aspx.cs" Inherits="ShDenetim.Web.Kurumsal.KurumsalBilgi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="kutu">
            <div class="kutu-header-uzun-mavi">
                Kurumsal ›
            </div>

            <div class="kutu-content">
                <ul>
                    <li>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Daire Başkanı</asp:LinkButton>
                    </li>

                    <li>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Ana Süreç Sorumluları</asp:LinkButton>
                    </li>

                    <li>
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Dairenin Görevleri</asp:LinkButton>
                    </li>

                </ul>

            </div>

        </div>
        <asp:Panel   ID="Panel1" runat="server"></asp:Panel>
    </form>


</asp:Content>
