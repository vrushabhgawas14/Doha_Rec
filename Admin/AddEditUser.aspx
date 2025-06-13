<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEditUser.aspx.cs" Inherits="Doha_Rec.Admin.AddEditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Css/AddEditUser.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <ul class="nav nav-tabs mt-4 gap-2" id="userTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="add-tab" data-bs-toggle="tab" href="#add" role="tab">
                    Add User
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="access-tab" data-bs-toggle="tab" href="#access" role="tab">
                    Access Control
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="confirm-tab" data-bs-toggle="tab" href="#confirm" role="tab">
                    Confirmation
                </a>
            </li>
        </ul>

        <div class="tab-content mt-3 mb-5">
            <!-- AddUser Tab -->
            <div class="tab-pane fade show active" id="add" role="tabpanel">
                <asp:Panel ID="pnlAddUser" runat="server" CssClass="CustomPanelCss">
                    <div class="d-flex justify-content-between gap-2 mt-4 flex-wrap">
                        <div>
                            <asp:Label ID="userNameLB" runat="server" Text="UserName :" CssClass="form-label"></asp:Label>
                            <asp:TextBox
                                ID="userNameTB"
                                runat="server"
                                placeholder="John"
                                CssClass="form-control"
                                BackColor="#E7E7FF"
                                BorderWidth="1"
                                BorderColor="Black"
                                Height="30px"
                                Width="250px"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="userRoleLB" runat="server" Text="Role :" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="userRoles" runat="server" CssClass="form-select" Width="200px">

                                <asp:ListItem Text="---Select---" Value="" />
                                <asp:ListItem Text="Supervisor" Value="Supervisor" />
                                <asp:ListItem Text="User" Value="User" />
                                <asp:ListItem Text="OIC" Value="OIC" />
                                <asp:ListItem Text="Admin" Value="Admin" />
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Label ID="userActiveLB" runat="server" Text="Active :" CssClass="form-label"></asp:Label>

                            <asp:DropDownList ID="userActive" runat="server" CssClass="form-select" Width="200px">
                                <asp:ListItem Text="Active" Value="Active" />
                                <asp:ListItem Text="In-Active" Value="In-Active" />
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Label ID="userEmailLB" runat="server" Text="Email :" CssClass="form-label"></asp:Label>
                            <asp:TextBox
                                ID="userEmailTB"
                                runat="server"
                                placeholder="john@hdfc.com"
                                CssClass="form-control"
                                BackColor="#E7E7FF"
                                BorderWidth="1"
                                BorderColor="Black"
                                Height="30px"
                                Width="250px"></asp:TextBox>

                        </div>
                    </div>
                    <div class="d-flex justify-content-center mt-4 gap-4">
                        <asp:Button
                            ID="AddUserSubmitBtn"
                            runat="server"
                            Text="Save & Next"
                            CssClass="btn btn-dark"
                            OnClick="addNextBtn_Click" />
                        <asp:Button
                            ID="CancelSubmitBtn"
                            runat="server"
                            Text="Cancel"
                            CssClass="btn btn-dark"
                            OnClick="cancelSubmitBtn_Click" />
                    </div>
                </asp:Panel>
            </div>

            <!-- Access Control Tab -->
            <div class="tab-pane fade" id="access" role="tabpanel">
                <asp:Panel ID="pnlAccessControl" runat="server" Enabled="false">
                    <div class="d-flex align-items-end gap-5 mt-4 flex-wrap">
                        <div class="d-flex flex-column">
                            <asp:Label ID="AccessUserLB" runat="server" Text="UserName" CssClass="form-label"></asp:Label>
                            <asp:TextBox
                                ID="AccessUserTB"
                                runat="server"
                                Text="Vrush"
                                CssClass="form-control"
                                BackColor="#bfc4dc"
                                BorderWidth="1"
                                BorderColor="Gray"
                                Height="35px"
                                Width="200px"
                                Enabled="false"></asp:TextBox>
                        </div>

                        <div>
                            <asp:Label ID="AccessLB" runat="server" Text="Access" CssClass="form-label"></asp:Label>
                            <asp:DropDownList
                                ID="AccessControlList"
                                runat="server"
                                CssClass="form-select"
                                Height="35px"
                                Width="200px">
                                <asp:ListItem Text="---Select---" Value="" />
                                <asp:ListItem Text="Master" Value="Master" />
                                <asp:ListItem Text="Transactions" Value="Transactions" />
                                <asp:ListItem Text="File Creation" Value="File Creation" />
                                <asp:ListItem Text="File Upload" Value="File Upload" />
                            </asp:DropDownList>
                        </div>
                        <div class="d-flex gap-2">
                            <asp:Button
                                ID="AccessSaveBtn"
                                runat="server"
                                Text="Save"
                                CssClass="btn btn-dark" />
                            <asp:Button
                                ID="AccessNextBtn"
                                runat="server"
                                Text="Next"
                                CssClass="btn btn-dark"
                                OnClick="accessNextBtn_Click" />
                        </div>
                    </div>
                    
                </asp:Panel>

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
                    AllowPaging="True"
                    PageSize="10"
                    OnPageIndexChanging="GridView2_PageIndexChanging"
                    OnDataBound="GridView2_DataBound"
                    CssClass="w-100 mt-5">

                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" />
                        <asp:BoundField DataField="Role" HeaderText="Role" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:TemplateField HeaderText="Toggle">
                            <ItemTemplate>
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

                    <AlternatingRowStyle CssClass="Alertnative-bg Row-hover" />
                    <HeaderStyle BackColor="#272c31" ForeColor="#c1c1d3" />
                    <PagerStyle BackColor="#E7E7FF" BorderWidth="1" />
                    <RowStyle ForeColor="#100249" CssClass="Row-bg Row-hover" />
                    <SelectedRowStyle Font-Bold="True" />
                </asp:GridView>
            </div>

            <!-- Confirmation Tab -->
            <div class="tab-pane fade" id="confirm" role="tabpanel">
                    <asp:Panel ID="pnlConfirmation" runat="server" Enabled="false"
                        CssClass=" d-flex flex-column justify-content-center align-items-center mt-4">
                        <h5>Do you want to add this user?</h5>
                        <div>
                            <asp:Button ID="btnYes" runat="server" Text="Yes" CssClass="btn btn-dark m-2" />
                            <asp:Button ID="btnNo" runat="server" Text="No" CssClass="btn btn-outline-dark m-2" />
                        </div>
                </asp:Panel>
            </div>
        </div>

    </main>
    <script src="../Bootstrap/Js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        function showTab(tabId) {
            const triggerTab = new bootstrap.Tab(document.querySelector(`#${tabId}-tab`));
            triggerTab.show();
        }
    </script>
</asp:Content>
