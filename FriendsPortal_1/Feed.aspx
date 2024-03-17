<%@ Page Title="" Language="C#" MasterPageFile="~/UserMstPg.Master" AutoEventWireup="true" CodeBehind="Feed.aspx.cs" Inherits="FriendsPortal_1.Feed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" id="jumbo">
        <div class="row">
            <div class="col-md-12 m-auto" >

                <div class="jumbotron mt-4 " style="background-color: lavender; display: block" >
                    <h1 class="display-4 d-inline">Hello,</h1>
                    <asp:Label ID="lblShowFname" runat="server" CssClass="display-4   col-sm col-md text-capitalize"></asp:Label>
                    <p class="lead">✨ Connect with your world in a whole new way on Friends Portal. It's time to blast off! :)</p>
                    <hr class="my-4">
                    <p>Please Click on the Add Post Icon or search for friends</p>
                    <%--<a class="btn btn-primary btn-md" href="#" role="button">Add Post</a>--%>

                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-dark " data-bs-toggle="modal" data-bs-target="#exampleModalpostfd">
                        <i class="fa-solid fa-plus mr-1 "></i>Add Post
                    </button>

                    <!-- Modal -->
                    <div class="modal fade " id="exampleModalpostfd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Select Image</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <asp:FileUpload runat="server" ID="UserPosts" AllowMultiple="true" />
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
                                    <asp:Button runat="server" ID="btnAddPost" OnClick="btnAddPost_Click" CssClass="btn btn-secondary" Text="Upload Post" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   
    </div>

    <%--all users posts--%>

     <div class="container" id="RepeaterPosts">
     
     <div class="row">
         <asp:Repeater runat="server" ID="RepeatAllPosts">
            
             <ItemTemplate>
                 <div class="col-md-9 m-auto ">
                     <%--<asp:Image runat="server" Style="width: 50%" ImageUrl='<%# Eval("Thumbnails") %>' />
                     <asp:Label runat="server" ID="PicId" style="display:none" Text='<%# Eval("picId") %>'></asp:Label>--%>
                     <div class="card mt-3" >
                         <div class="card-header">
                             <asp:Label runat="server" ID="lblFname" class="card-title h4" Text='<%# Eval("firstname") %>'></asp:Label>
                             <asp:Label runat="server" ID="lblLname" class="card-title h4" Text='<%# Eval("lastname") %>'></asp:Label>
                             <asp:Label runat="server" ID="userId" Style="display: none" Text='<%# Eval("userId") %>'></asp:Label>

                             <asp:Button ID="btnFollowSendRequest" runat="server" OnClick="btnFollowSendRequest_Click"  class="btn btn-outline-secondary float-right"  Text="Follow" />
                         </div>
                         <div class="card-body">
                            <%-- <asp:Image runat="server" class="card-img-top" Style="width: 50%" ImageUrl='<%# Eval("AllPosts") %>' />--%>
                             <asp:Image runat="server" Style="width: 100%" ImageUrl='<%# Eval("AllPosts") %>' />
                         </div>
                         <div class="card-footer text-muted d-flex justify-content-around">
                             <asp:LinkButton ID="lbtnlink" CssClass="nav-link" runat="server"><i class="fa-regular fa-heart mr-1"></i>Like</asp:LinkButton>
                             <asp:LinkButton ID="lbtncomment" runat="server" CssClass="nav-link"><i class="fa-regular fa-comment mr-1"></i>Comment</asp:LinkButton>
                         </div>
                     </div>



                 </div>
             </ItemTemplate>
            
         </asp:Repeater>
     </div>
 </div>

    <script>
        const jumbo = document.getElementById("jumbo");
        const repPosts = document.getElementById("RepeaterPosts");

        function showPost() {
            if (repPosts != null) {
                jumbo.style.dislpay = "none";
            }
            else {
                jumbo.style.dislpay = "block";
            }
        }
    </script>

</asp:Content>
