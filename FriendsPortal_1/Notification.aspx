<%@ Page Title="" Language="C#" MasterPageFile="~/UserMstPg.Master" AutoEventWireup="true" CodeBehind="Notification.aspx.cs" Inherits="FriendsPortal_1.Notification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="NotificationsRepeater" runat="server">
        <ItemTemplate>
            <div class="">
                <%# Eval("NotificationText") %>
                </div>

            <div class="col-md-9 m-auto mt-3 ">
                <div class="card-header">
                </div>
                <div class="card ">
                    <div class="card-body">
                        <div class="d-flex  align-items-center">
                            <asp:Image ID="ProfPic" runat="server" CssClass=" rounded-circle mr-3" ImageUrl="pic/profpic4.png" AlternateText="Profile Picture" Width="40px" /><br />
                            <asp:Label runat="server" ID="lblFname" class="card-title h4 mr-2" Text='<%# Eval("firstname") %>'></asp:Label>
                            <asp:Label runat="server" ID="lblLname" class="card-title h4" Text='<%# Eval("lastname") %>'></asp:Label>
                            <asp:Label runat="server" ID="userId" Style="display: none" Text='<%# Eval("userId") %>'></asp:Label>
                            <%--<asp:Button ID="btnAccept" runat="server" class="btn btn-outline-success ml-auto" OnClick="btnAccept_Click" CommandArgument='<%# Eval("FollowerId") %>' Text="Accept"  />
                            <asp:Button ID="btnDecline" runat="server" class="btn btn-outline-danger ml-2" OnClick="btnDecline_Click" CommandArgument='<%# Eval("FollowerId") %>' Text="Decline" />--%>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
