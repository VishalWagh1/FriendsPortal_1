<%@ Page Title="" Language="C#" MasterPageFile="~/UserMstPg.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FriendsPortal_1.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        img {
            width: 100%;
        }
    </style>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />--%>
    <link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css" />
    <link href="CSS/fluid-gallery.css" rel="stylesheet" />

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container w-100" style="background-color: lightgray">
        <div class="row mt-5 mb-3">
            <h1 class=" mt-5 mb-3 pl-5">Profile Page</h1>
        </div>
        <div class="row d-flex justify-content-evenly mb-3">
            <div class="col-md-3 col-sm-3 col-lg-3 bg-light py-2 mb-5 ">
                <div >
                    <asp:Image ID="ProfPicIcon" runat="server" CssClass=" rounded-circle ml-5 mb-2" ImageUrl="pic/profpic4.png" AlternateText="Profile Picture" Width="100%"  /><br />
                    <asp:Image ID="ProfPic" runat="server" CssClass=" rounded-circle col-sm mb-2 " AlternateText="Profile Picture" Width="80%"  />
                    <asp:Label runat="server" ID="lblUserFName" CssClass="h3 pr-1 text-capitalize ml-5 pl-1"></asp:Label><asp:Label runat="server" ID="lblUserLName" CssClass="h3 text-capitalize "></asp:Label>
                    <br />
                    
                    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModalbio">
                        🖋️ Bio
                    </button>
                    <asp:Label ID="lblBio" runat="server" CssClass="h5 "></asp:Label>

                    <div class="modal fade " id="exampleModalbio" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Upload Profile Photo</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="txtBio">Bio: </label>
                                        <asp:TextBox runat="server" class="form-control" ID="txtBio" placeholder="Add Bio"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button runat="server" ID="btnBio" Text="Update Bio" OnClick="btnBio_Click1" CssClass="btn btn-info" />
                                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-8 col-md-7 col-sm-6 bg-light  mb-5 ">
                <table class="table table-hover py-3 px-5 mt-5 ">
                    <tbody>
                        <tr>
                            <th scope="row" class="pl-4">Name: </th>
                            <td>
                                <asp:Label runat="server" ID="lblFName" CssClass="h5  pr-1 text-capitalize"></asp:Label>
                                <asp:Label runat="server" ID="lblLName" CssClass="h5  text-capitalize"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="pl-4">Email: </th>
                            <td>
                                <asp:Label runat="server" ID="lblEmail" CssClass="h5"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="pl-4">Contact: </th>
                            <td>
                                <asp:Label runat="server" ID="lblContact" CssClass="h5 "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="pl-4">City: </th>
                            <td>
                                <asp:Label runat="server" ID="lblCity" CssClass="h5 text-capitalize"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <hr />
    <%--User's Posts--%>
    <div class="container w-100 my-5 p-3" style="background-color: aliceblue">
        <h2 class="mt-2">All Posts</h2>
        <div class="tz-gallery" style="padding: 0">
            <div class="row ">
                <asp:Literal runat="server" ID="LitPosts"></asp:Literal>
            </div>
        </div>
    </div>





    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
    <script>
        baguetteBox.run('.tz-gallery');
    </script>
</asp:Content>
