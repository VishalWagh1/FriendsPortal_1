<%@ Page Title="" Language="C#" MasterPageFile="~/Signing.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="FriendsPortal_1.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-4 d-flex justify-content-around">
        <div class="row">
            <div class="col-md-5 mt-5">
                <div class="jumbotron">
                    <h1 class="display-4 font-weight-bold">Welcome to the<br />
                        Friends Portal</h1>
                    <hr class="my-4" />
                    <p>To keep connected with us please login with your personal info</p>
                    <a class="btn btn-secondary btn-lg" href="signIn.aspx" role="button">Sign In</a>
                </div>
                <div class="row float-right mr-5">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </div>
            </div>
            <div class="col-md-6 px-5 py-3 bg-light ml-auto">
                <h1>Create Account</h1>
                <div class="form-row">
                    <p class="lead">Enter your personal details and start journey with us</p>
                    <div class="form-group col-md-6">
                        <label for="txtFname">First Name: </label>
                        <asp:TextBox runat="server" type="text" class="form-control" ID="txtFname" placeholder="Enter First Name"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="txtLname">Last Name: </label>
                        <asp:TextBox runat="server" type="text" class="form-control" ID="txtLname" placeholder="Enter Last Name"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtEmail">Email: </label>
                    <asp:TextBox runat="server" TextMode="email" class="form-control" ID="txtEmail" placeholder="Enter Email"></asp:TextBox>
                </div>
                 <div class="form-group">
                     <label for="txtContact">Contact: </label>
                     <asp:TextBox runat="server" TextMode="Number" class="form-control" ID="txtContact" placeholder="Enter Contact"></asp:TextBox>
                 </div>
                <div class="form-group">
                    <label for="txtCity">City: </label>
                    <asp:TextBox runat="server" class="form-control" ID="txtCity" placeholder="Enter City"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPassword">Create Password: </label>
                    <asp:TextBox runat="server" TextMode="Password" class="form-control" ID="txtPassword" placeholder="Enter Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtConfirm">Confirm Password: </label>
                    <asp:TextBox runat="server" TextMode="Password" class="form-control" ID="txtConfirm" placeholder="Confirm Password"></asp:TextBox>
                </div>
                <asp:Button runat="server" ID="btnSignUp" Text="Sign Up" OnClick="btnSignUp_Click" CssClass="btn btn-dark" />
            
        
                
            </div>
            <div class="row  pt-3" >
                <div class="col-md  " style="margin-left:13rem">
                    <asp:RequiredFieldValidator runat="server" ID="rfv1" ErrorMessage="Please Enter First Name" ControlToValidate="txtFname" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" ID="rfv2" ErrorMessage="Please Enter Last Name" ControlToValidate="txtLname" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" ID="rfv3" ErrorMessage="Please Enter Email Id" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" ID="rfv4" ErrorMessage="Please Enter Password" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" ID="rfv5" ErrorMessage="Please Enter Contact" ControlToValidate="txtContact" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" ID="rfv6" ErrorMessage="Please Enter City" ControlToValidate="txtCity" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="rev1" ErrorMessage="Please Enter Valid Email Id" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="cv1" runat="server" ErrorMessage="Password is not matching" ForeColor="red" ControlToValidate="txtPassword" ControlToCompare="txtConfirm"></asp:CompareValidator>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
