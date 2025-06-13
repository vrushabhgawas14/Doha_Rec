<%@ Page Title="House Keeping" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HouseKeeping.aspx.cs" Inherits="Doha_Rec.Admin.HouseKeeping" %>

<asp:Content ID="HouseKeepingHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Css/HouseKeeping.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="mt-4 d-flex justify-content-between align-items-end">
            <div class="fs-5 fw-bolder text-dark-emphasis">House Keeping</div>
            <div class="d-flex flex-column align-items-end gap-2 w-75">
                <a class="btn btn-outline-dark px-2 py-1" href="AddEditUser.aspx">Add New</a>
                <div class="input-group-sm d-flex align-content-center">
                    <asp:TextBox
                        ID="SearchInput"
                        runat="server"
                        TextMode="search"
                        placeholder="Search here..."
                        CssClass="px-2 form-control rounded-end-0 border-1 border-dark border-opacity-75"
                        Width="300px"
                        BackColor="#E7E7FF"></asp:TextBox>

                    <asp:Button ID="SearchBtn" CssClass="btn btn-dark rounded-start-0 z-1" runat="server" Text="Search"/>
                </div>
            </div>
        </section>
        <hr />

        <section>

            <asp:GridView
                ID="GridView2"
                runat="server"
                CellPadding="4"
                GridLines="Horizontal"
                BackColor="White"
                BorderColor="#212529"
                BorderStyle="Solid"
                BorderWidth="2px"
                ShowHeaderWhenEmpty="True"
                AutoGenerateColumns="false"
                OnSelectedIndexChanged="GridView2_SelectedIndexChanged"
                OnRowDataBound="GridView2_RowDataBound"
                AllowPaging="True"
                PageSize="10"
                OnPageIndexChanging="GridView2_PageIndexChanging"
                OnDataBound="GridView2_DataBound"
                CssClass="w-100">

                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" />
                    <asp:BoundField DataField="Role" HeaderText="Role" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    
                    <asp:CommandField ShowSelectButton="true" ItemStyle-CssClass="d-none" HeaderStyle-CssClass="d-none" />
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button
                                ID="DeleteButton"
                                runat="server"
                                Text="Delete"
                                Font-Bold="true"
                                CssClass="btn text-danger-emphasis btn-sm btn-link" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <PagerTemplate>
                    <div class="custom-pager">
                        Page
                        <asp:Label runat="server" ID="lblPageIndex" Text="Something" />
                        of
                        <asp:Label runat="server" ID="lblTotalPages" />
                        <asp:LinkButton runat="server" CommandName="Page" CommandArgument="First">
                            First
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Page" CommandArgument="Prev">
                            Prev
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Page" CommandArgument="Next">
                            Next
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" CommandName="Page" CommandArgument="Last">
                            Last
                        </asp:LinkButton>
                    </div>
                </PagerTemplate>

                <AlternatingRowStyle CssClass="Alertnative-bg Row-hover"/> <%--Custom CSS--%>
                <HeaderStyle BackColor="#272c31" ForeColor="#c1c1d3" />
                <PagerStyle BackColor="#E7E7FF" BorderWidth="1"/>
                <RowStyle ForeColor="#100249" CssClass="Row-bg Row-hover" /> <%--Custom CSS--%>
                <SelectedRowStyle Font-Bold="True" />
            </asp:GridView>
        </section>
    </main>
</asp:Content>
