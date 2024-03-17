<%@ Page Title="" Language="C#" MasterPageFile="~/UserMstPg.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="FriendsPortal_1.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-lg-10 px-5 py-5 bg-light m-auto">
                <h1>Update Account</h1>
                <p class="lead">Update your personal details</p>

                <%--Profile photo Upload Button--%>
                <!-- Button trigger modal -->

                <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    🖋️ Edit Profile Photo
                </button>

                <div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Upload Profile Photo</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <asp:FileUpload runat="server" ID="UserProfile" AllowMultiple="false" />
                            </div>
                            <div class="modal-footer">
                                <asp:Button runat="server" ID="btnUploadProfile" OnClick="btnUploadProfile_Click1" Text="Add Profile Pic" CssClass="btn btn-secondary" />
                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
              
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="txtFname">First Name: </label>
                        <asp:TextBox runat="server" type="text" class="form-control" ID="txtFname" placeholder="First Name"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="txtLname">Last Name: </label>
                        <asp:TextBox runat="server" type="text" class="form-control" ID="txtLname" placeholder="Last Name"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtEmail">Email: </label>
                    <asp:TextBox runat="server" TextMode="email" class="form-control" ID="txtEmail" placeholder="Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtContact">Contact: </label>
                    <asp:TextBox runat="server" TextMode="Number" class="form-control" ID="txtContact" placeholder="Contact"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtCity">City: </label>
                    <asp:TextBox runat="server" class="form-control" ID="txtCity" placeholder="City"></asp:TextBox>
                </div>

                <asp:Button runat="server" ID="btnUpdate" Text="Update" OnClick="btnUpdate_Click" CssClass="btn btn-secondary" />
            </div>
        </div>
    </div>
</asp:Content>
