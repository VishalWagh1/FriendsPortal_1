<%@ Page Title="" Language="C#" MasterPageFile="~/UserMstPg.Master" AutoEventWireup="true" CodeBehind="FriendsList.aspx.cs" Inherits="FriendsPortal_1.FriendsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
             <asp:Repeater runat="server" ID="RAllFriendsList">
                    <ItemTemplate>
                        <div class="col-md-9 m-auto mt-3 ">
                            <div class="card-header">
                                
                            </div>
                            <div class="card ">
                                <div class="card-body">
                                    <div class="d-flex  align-items-center">
                                        <asp:Image ID="ProfPic" runat="server" CssClass=" rounded-circle mr-3" ImageUrl="pic/profpic4.png" AlternateText="Profile Picture" Width="40px" /><br />
                                        <asp:Label runat="server" ID="lblFname" class="card-title h4 mr-2" Text='<%# Eval("firstname") %>'></asp:Label>
                                        <asp:Label runat="server" ID="lblLname" class="card-title h4" Text='<%# Eval("lastname") %>'></asp:Label>
                                        <asp:Button ID="btnFollowSendRequest1" runat="server" class="btn btn-outline-secondary ml-auto" Text="Follow" />
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
        </div>
    </div>
</asp:Content>
