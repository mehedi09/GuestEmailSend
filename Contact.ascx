<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contact.ascx.cs" Inherits="Controls_Contact" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
<div data-app-role="page" data-content-framework="bootstrap">
    <div class="navbar navbar-default navbar-static-top" role="navigation" style="font-family: SolaimanLipi,Tahoma" id="mainnav">
        <div class="container-fluid">
            <div class="navbar-header visible-sm visible-xs">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    NavBar
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <span class="navbar-brand"><%  MyCompany.Rules.SharedBusinessRules ad = new MyCompany.Rules.SharedBusinessRules();  %>
                    <%=Server.HtmlEncode(ad.InstituteName.ToString())%> </span>
            </div>
            <div class="collapsenavbar-collapse" id="bs-example-navbar-collapse-1">
                <asp:Literal runat="server" ID="NavBar" />
                <asp:Literal runat="server" ID="SiteType" />
                <!-- Sign In onClick slide -->
                <div class="navbar-form navbar-right" style="margin-right: 0;">
                    <ul id="nav" class="" style="list-style-type: none; margin-bottom: 1px; width: 88px; float: left">
                        <li id="login" style="margin-right: 2px;">
                            <a id="login-trigger" href="#" class="btn btn-success visible-md visible-lg">SIGN IN <span>▼</span>
                            </a>
                            <div id="login-content">
                                <ul class="nav nav-tabs nav-justified visible-md visible-lg" style="margin-bottom: 30px">
                                    <li class="active" style="font-size: 11px;"><a href="#Staff" data-toggle="tab">Staff</a></li>
                                    <li><a href="#Teacher" data-toggle="tab" style="font-size: 11px;">Teacher</a></li>
                                    <li><a href="#Student" data-toggle="tab" style="font-size: 11px;">Student</a></li>
                                    <li><a href="#Guardian" data-toggle="tab" style="font-size: 11px;">Guardian</a></li>
                                    <li><a href="#Audit" data-toggle="tab" style="font-size: 11px;">Audit</a></li>
                                </ul>

                                <!-- tab content -->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="">
                                        <hr />
                                        <p style="text-align: center; display: block;"><i class="fa fa-lock"></i>&nbsp;SIGN IN</p>
                                        <hr />
                                        <div class="form-vertical" role="form">
                                            <div class="form-group" style="display: block;">
                                                <input id="login-user-name" type="text" placeholder="Username" class="form-control">
                                            </div>
                                            <p></p>
                                            <div class="form-group" style="display: block;">
                                                <input id="login-password" type="password" placeholder="Password" class="form-control">
                                            </div>
                                            <p></p>
                                            <button id="login-button" class="btn btn-success" style="font-size: 12px;">SIGN IN</button>
                                        </div>
                                    </div>
                                </div>
                                <!--End tab content -->
                            </div>
                        </li>
                    </ul>
                </div>

                <!--End Sign In onClick slide -->
            </div>
            <!--/.navbar-collapse -->
        </div>
    </div>

    <div id="banner">
        <div class="container-fluid">
            <div class="col-md-3 col-lg-3">

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">প্রয়োজনীয় লিঙ্ক</h3>
                    </div>
                    <div class="panel-group" id="accordion">
                        <span id="divImportentLink" runat="server"></span>
                    </div>

                </div>
            </div>

            <div class="col-md-9 col-lg-9">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">আপনার মতামত দিন</h3>
                    </div>
                    <div class="panel-body text-justify">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-2">
                                    <label class="control-label" for="senderName">Name</label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox ID="senderName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-2">
                                    <label class="control-label" for="senderSubject">Subject</label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox ID="senderSubject" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-2">
                                    <label class="control-label" for="senderEmail">Email/Contact No.</label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox ID="senderEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-2">
                                    <label for="comment" class="control-label">Message</label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox ID="senderBody" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="col-md-4 col-md-offset-8 pull-right">
                                <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-success" OnClick="btnSend_Click" Width="100px" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <%--<div class="panel-heading">
                            <h3 class="panel-title">যোগাযোগ</h3>
                        </div>--%>
                        <div class="panel-body text-justify">
                            <h3>গুগোল ম্যাপে বিদ্যালয়ের অবস্থান  ।  </h3>
                            <div runat="server" id="divmap"></div>
                            <iframe src="https://www.google.com/maps/d/embed?mid=1puBM-HXdtyklfXAwd5bxDUMbfZQ" width="100%" height="480"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="divFooter" runat="server"></div>
    </div>
</div>
<%--<script type="text/javascript">
    (function ($) {
        $(document).ready(function () {
            $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function (event) {
                event.preventDefault();
                event.stopPropagation();
                $(this).parent().siblings().removeClass('open');
                $(this).parent().toggleClass('open');
            });

            //var navpos = $('#mainnav').offset();
            //console.log(navpos.top);
            //$(window).bind('scroll', function () {
            //    if ($(window).scrollTop() > navpos.top) {
            //        $('#mainnav').addClass('navbar-fixed-top');
            //        $('#topnav').removeClass('navbar-fixed-top');
            //    } else {
            //        $('#topnav').addClass('navbar-fixed-top');
            //        $('#mainnav').removeClass('navbar-fixed-top');
            //    }
            //});


        });
    })(jQuery);

    (function () {
        var resources = Web.MembershipResources.Messages;

        function performLogin() {

            var userName = $('#login-user-name'),
                password = $('#login-password');
            if (!userName.val())
                $app.alert(resources.BlankUserName, function () {
                    userName.focus();
                });
            else if (!password.val())
                $app.alert(resources.BlankPassword, function () {
                    password.focus();
                });
            else
                $app.login(userName.val(), password.val(), true,
                    function () {
                        var returnUrl = window.location.href.match(/\?ReturnUrl=(.+)$/);
                        window.location.replace(returnUrl && decodeURIComponent(returnUrl[1]) || __baseUrl);
                    },
                    function () {
                        $app.alert(resources.InvalidUserNameAndPassword, function () {
                            userName.focus();
                        });
                    });
            return false;
        }

        // remove any other "app" pages 
        $('div.SettingsPanel div[data-app-role="page"]').remove();
        // register event handlers
        $(document)
            .on('click', '#login-button', performLogin)
            .on('keydown', '#login-user-name,#login-password', function (event) {
                if (event.which == 13) {
                    performLogin();
                    return false;
                }
            });
    })();
</script>--%>

<style>
    .app-bootstrap label {
        font-family: Segoe UI Light, sans-serif;
    }
</style>
<script src="../Scripts/ipac_js_v1_01.js"></script>
