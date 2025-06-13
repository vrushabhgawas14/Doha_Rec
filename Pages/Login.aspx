<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Doha_Rec.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../Bootstrap/Css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body{
            background : #E7E7FF
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center align-items-center" style='height:500px'">
            <div class="card p-4 pt-lg-5 border shadow-lg border-black"
                style="width: 100%; max-width: 350px; background-color: #bfc4dc">
                <h2 class="text-center mb-4 text-dark-emphasis fw-bold">Login</h2>

                <div class="d-flex gap-1 mb-3">
                    <div class="form-floating w-100">
                        <asp:TextBox
                            ID="usernameTextBox"
                            runat="server"
                            CssClass="form-control border border-black"
                            BackColor="#E7E7FF"
                            placeholder="Enter your username"></asp:TextBox>
                        <label for="usernameTextBox" class="form-label">Username</label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="usernameTextBox"
                            ErrorMessage="Enter Username"
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="small align-self-center">*</asp:RequiredFieldValidator>
                </div>

                <div class="d-flex gap-1 mb-3">
                    <div class="form-floating w-100">
                        <asp:TextBox
                            ID="passTextBox"
                            runat="server"
                            TextMode="Password"
                            CssClass="form-control border border-black"
                            BackColor="#E7E7FF"
                            placeholder="Enter your password"></asp:TextBox>
                        <label for="passTextBox" class="form-label">Password</label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="passTextBox"
                            ErrorMessage="Enter Password"
                            ForeColor="Red"
                            Display="Dynamic"
                            CssClass="small align-self-center">*</asp:RequiredFieldValidator>
                </div>

                <div class="d-grid w-50 m-auto">
                    <asp:Button ID="LoginBtn" runat="server" CssClass="btn btn-dark" Text="Login" 
                        OnClick="LoginBtn_Click" />
                </div>

                <div class="text-center mt-4">
                    Don't have an Account ? 
                    <a href="#" class="text-dark fw-bolder">Sign Up</a>
                </div>

                <div class="mt-2 text-center text-danger-emphasis small">
                    <asp:ValidationSummary ID="ValidationSummary1" 
                        runat="server" 
                        DisplayMode="List" />
                </div>
            </div>
        </div>

    </form>
    <div class="text-center text-dark-emphasis mt-3">@2025 Lateral Management of Computer Consultants</div>

    <!-- Bootstrap-->
    <script src="../Bootstrap/Js/bootstrap.bundle.min.js"></script>
   <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
