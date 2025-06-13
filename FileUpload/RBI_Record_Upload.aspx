<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RBI_Record_Upload.aspx.cs" Inherits="Doha_Rec.FileUpload.RBI_Record_Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .FileInputCss{
            font-weight:500;
            max-width:350px;
            background-color:#E7E7FF;
            border: 1px solid #212529;
            color:#495057;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div>
                <div class="d-flex align-items-center gap-2 mt-2">
                    <asp:Label ID="RecordTypeLB" runat="server" Text="Record Type :" CssClass="fw-bold fs-6" ForeColor="#495057"></asp:Label>
                <asp:RadioButtonList ID="RecordTypeList" 
                    runat="server" 
                    RepeatDirection="Horizontal"
                    CellPadding="4" 
                    CssClass="w-50 fw-bold"
                    CellSpacing="1"
                    ForeColor="#495057"
                    Height="50px">
                    <asp:ListItem Text="TRN Mirror" Value="TRN_Mirror"></asp:ListItem>
                    <asp:ListItem Text="NEFT INW" Value="NEFT_INW"></asp:ListItem>
                    <asp:ListItem Text="NEFT OUT" Value="NEFT_OUT"></asp:ListItem>
                    <asp:ListItem Text="RTGS" Value="RTGS"></asp:ListItem>
                    <asp:ListItem Text="RBI_Statement" Value="RBI_Statement"></asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <div class="d-flex align-items-center gap-2">
                <asp:Label ID="FileInputLB" runat="server" Text="Upload File :" CssClass="fw-bold fs-6" ForeColor="#495057"></asp:Label>
                <asp:FileUpload ID="FileUploadInput" runat="server" CssClass="form-control FileInputCss" onChange="showFileName(this)" />
            </div>

            <div class="mt-2">
                <asp:Label ID="DisplayLB" runat="server" Text="Selected File :" CssClass="fw-bold fs-6" ForeColor="#495057"></asp:Label>
                <asp:Label ID="SelectedFileNameLB" runat="server" CssClass="px-2 fs-6" ForeColor="#495057" Text="Selected file will appear here.."></asp:Label>
            </div>

            <asp:Button ID="UploadButton" runat="server" Text="Upload Excel File"  CssClass="btn btn-outline-dark my-3" OnClick="UploadButton_Click" />

            <br />

            <asp:Label ID="FinalMessageLB" 
                runat="server"></asp:Label>
            
            
        </div>
    </main>
    <script type="text/javascript">
        function showFileName(input) {
            var fileName = input.files.length > 0 ? input.files[0].name : "";
            var label = document.getElementById(`<%= SelectedFileNameLB.ClientID %>`);
            if (label) {
                label.innerText = fileName;
            }
        }
    </script>
</asp:Content>
