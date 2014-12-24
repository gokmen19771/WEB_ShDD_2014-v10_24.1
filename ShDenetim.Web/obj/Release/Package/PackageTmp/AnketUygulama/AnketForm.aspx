<%@ Page Title="" Language="C#" MasterPageFile="~/App.Master" ValidateRequest="false"   AutoEventWireup="true"  CodeBehind="AnketForm.aspx.cs" Inherits="ShDenetim.Web.AnketUygulama.AnketForm" %>
<%@ Register src="Icd10.ascx" tagname="Icd10" tagprefix="uc1" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .UploadTextBoxHide
        {
            opacity: 0;
            filter: alpha(opacity=0);
            
        }
        .UploadControlDosyaEk
        {
           width:1%;
           margin-top:8px;
         
           
        }
    </style>
    
    <script>

        function clientASPxUploadControl1_OnFileUploadComplete(args, lblUploadMetinObjAdi) {
            lblUploadMetinObjAdi.innerHTML = args.callbackData;
            var hidUploadMetinObjId = lblUploadMetinObjAdi.id;
            hidUploadMetinObjId = hidUploadMetinObjId.replace("lbl", 'hid');

            var hid = document.getElementById(hidUploadMetinObjId);
            hid.value = args.callbackData;


            alert('Dosya Başarıyla Yüklendi')
        }

        function clientASPxUploadControl1_OnTextChanged(s, e) {
            s.Upload();
        }

        function Uploader_OnFileUploadComplete(args) {
            alert(args.callbackData);
        }

</script>
</asp:Content>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
       <div>
         <div class="kutu-header-uzun">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> ›   <br />      
 
        </div>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Left">
           
            <asp:Button ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" Text="Kaydet" Width="143px" />
            <asp:Button ID="btnVazgec" runat="server" OnClick="btnVazgec_Click" Text="&lt; Geri" Width="68px" />
             <asp:Label ID="lblSonuc" runat="server"></asp:Label>
            <asp:Button ID="btnYazdır" runat="server" Text="Yazdır" CssClass="right" />
            <br />
              <asp:Label ID="lblUstBaslik" runat="server"></asp:Label>
            <br />
          
           
            <br />    <br />       
          
        </asp:Panel>

            <asp:Label ID="lblAltBaslik" runat="server"></asp:Label>
        <p>
           
            <asp:Button ID="Button4" runat="server" OnClick="btnKaydet_Click" Text="Kaydet" Width="143px" />
            <asp:Button ID="btnVazgec0" runat="server" OnClick="btnVazgec_Click" Text="&lt; Geri" Width="68px" />
           
            </p>
     </div>
    </form>
</asp:Content>
