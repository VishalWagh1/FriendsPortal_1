<%@ Page Title="" Language="C#" MasterPageFile="~/UserMstPg.Master" AutoEventWireup="true" CodeBehind="SearchFriends.aspx.cs" Inherits="FriendsPortal_1.SearchFriends" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5 align-items-center">
        <div class="row">
            <div class="col-md-6 mx-auto d-flex">
                <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control mr-sm-1" type="search" placeholder="Search Friends" aria-label="Search" AutoCompleteType="DisplayName" autocorrect="off" autocapitalize="off" enterkeyhint="search" spellcheck="false" autofocus="true"></asp:TextBox>
                <asp:Button runat="server" CssClass="btn btn-secondary my-md-0 ml-2" ID="btnSearchUsers" OnClick="btnSearchUsers_Click" Text="Search" type="submit" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mx-auto mt-3" >
            <asp:GridView runat="server" ID="gvUsers" AutoGenerateColumns="false" Visible="false">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <ul class="list-group">
                                <li class="list-group-item" style="width:550px;">
                                    <asp:Label runat="server" ID="lblFName" Text='<%# Eval("firstname") %>'></asp:Label>
                                    <asp:Label runat="server" ID="lblLName" Text='<%# Eval("lastname") %>'></asp:Label>
                                </li>
                            </ul>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
