<%@ Page Title="" Language="C#" MasterPageFile="~/UserMstPg.Master" AutoEventWireup="true" CodeBehind="ResetPwd.aspx.cs" Inherits="FriendsPortal_1.ResetPwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5 ">
        <div class="row">
            <div class="col-md-6 m-auto">
                <h2>Reset Account Password</h2>
                <p>Enter a new Password for </p>
                 <div class="form-group">
                    <label for="txtPassword">Create Password: </label>
                    <asp:TextBox runat="server" TextMode="Password" class="form-control" ID="txtPassword" placeholder="Enter Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtConfirm">Confirm Password: </label>
                    <asp:TextBox runat="server" TextMode="Password" class="form-control" ID="txtConfirm" placeholder="Confirm Password"></asp:TextBox>
                </div>
                <asp:Button runat="server" ID="btnUpdate" Text="Update" OnClick="btnUpdate_Click" CssClass="btn btn-dark mb-4" /><br />
                <asp:RequiredFieldValidator runat="server" ID="rfv4" ErrorMessage="Please Enter Password" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cv1" runat="server" ErrorMessage="Password is not matching" ForeColor="red" ControlToValidate="txtPassword" ControlToCompare="txtConfirm"></asp:CompareValidator>
            </div>
            <div class="col-md-5 pt-5">
                <p>For your password to be up to the latest security standards, please make sure to consider the following aspects when creating your password:</p>
                <ul>
                    <li>The password should consist of a minimum of 8 characters</li>
                    <li>It should include capital and lower case letters, as well as at least one special character</li>
                    <li>Please choose a random combination of the before-mentioned characters</li>
                    <li>Please make sure not to use this password with other providers</li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
