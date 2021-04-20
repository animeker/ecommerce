<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="Login.aspx.vb" Inherits="CIS_4250_Online_Store.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content" class="site-content"><div id="primary" class="content-area width-normal">
        <main id="main" class="site-main">
            <div class="cont maincont">
                <h1 class="maincont-ttl">Registration / Login</h1>
                <ul class="b-crumbs">
                    <li><a href="index.html">Home</a></li>
                    <li>Registration & Login</li>
                </ul>                                                <article class="page-cont">
                <div class="page-styling">


                    <div class="auth-wrap">
                        <div class="auth-col">
                            <h2>Login</h2>
                            <form method="post" class="login">
                                <p>
                                    <label for="username">E-mail <span class="required">*</span></label>
                                     <asp:TextBox ID="tbEmail" Width="200" runat="server"></asp:TextBox><br />
                                </p>
                                <p>
                                    <label for="password">Password <span class="required">*</span></label>
                                    <asp:TextBox ID="tbPassword" Width="200" runat="server"></asp:TextBox>
                                </p>
                                <p class="auth-submit">
                                    <asp:Button ID="btnLogin" runat="server" Text="login" cssclass="btn btn-default" />
                                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                    <input type="checkbox" id="rememberme" value="forever">
                                    <label for="rememberme">Remember me</label>
                                </p>
                                <p class="auth-lost_password">
                                    <a href="#">Lost your password?</a>
                                </p>
                            </form>
                        </div>
                        <div class="auth-col">
                            <h2>Register</h2>
                            <form method="post" class="register">
                                <p>
                                    <label for="reg_email">Email <span class="required">*</span></label>
                                    <input type="email" id="reg_email">
                                </p>
                                <p>
                                    <label for="reg_password">Password <span class="required">*</span></label>
                                    <input type="password" id="reg_password">
                                </p>
                                <p class="auth-submit">
                                    <input type="submit" value="Register">
                                </p>
                            </form>
                        </div>
                    </div>


                </div>
            </article>
            </div>
        </main><!-- #main -->
    </div><!-- #primary -->    </div><!-- #content -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
