<%@ Page Title="" Language="C#" MasterPageFile="~/Signing.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="FriendsPortal_1.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex mx-5">
        <div class="container mt-5 ">
            <div class="row">
                <div class="col-md px-5 py-3 bg-light ">
                    <h1>Sing In</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <div class="form-group">
                        <label for="txtEmail">Email: </label>
                        <asp:TextBox runat="server" TextMode="email" class="form-control" ID="txtEmail" placeholder="Enter Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Create Password: </label>
                        <asp:TextBox runat="server" TextMode="Password" class="form-control" ID="txtPassword" placeholder="Enter Password"></asp:TextBox>
                    </div>
                    <asp:Button runat="server" ID="btnSignIn" OnClick="btnSignIn_Click"  Text="Sign In" CssClass="btn btn-dark" />
                </div>
            </div>
            <asp:LinkButton runat="server" ID="ForgotPsw" CssClass="ml-4 nav-link"  Text="Forgot Your Password?" OnClick="ForgotPsw_Click"></asp:LinkButton>
        </div>
        <%--Jumbotron--%>
        <div class="container my-5 ">
            <div class="row">
                <div class="col-md">
                    <div class="jumbotron">
                        <h1 class="display-4 font-weight-bold">Welcome to the<br />
                            Friends Portal</h1>
                        <hr class="my-4" />
                        <p class="lead">Enter your personal details and start journey with us</p>
                        <a class="btn btn-secondary btn-lg" href="SignUp.aspx" role="button">Sign Up</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
