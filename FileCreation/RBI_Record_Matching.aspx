<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RBI_Record_Matching.aspx.cs" Inherits="Doha_Rec.FileCreation.RBI_Record_Matching" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
                <asp:ListItem Text="All" Value="All"></asp:ListItem>
                <asp:ListItem Text="NEFT INW" Value="NEFT_INW"></asp:ListItem>
                <asp:ListItem Text="NEFT OUT" Value="NEFT_OUT"></asp:ListItem>
                <asp:ListItem Text="RTGS" Value="RTGS"></asp:ListItem>
                <asp:ListItem Text="ACH" Value="ACH"></asp:ListItem>
                <asp:ListItem Text="NFS" Value="NFS"></asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <asp:Button ID="MatchButton" runat="server" Text="Match Record"  CssClass="btn btn-outline-dark my-2" OnClick="MatchButton_Click" />

        <br />

        <asp:Label ID="FinalMessageLB" 
            runat="server" CssClass="fw-medium"></asp:Label>
    </div>
</main>
</asp:Content>
