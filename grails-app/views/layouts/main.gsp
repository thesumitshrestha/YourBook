<g:if test="${session.userName}">
    <!DOCTYPE html>
    <html lang="en" class="no-js">
    <head>
        <script type="text/javascript">
            $(document).ready(function()
            {
                $("#datepicker").datepicker({dateFormat: 'yy/mm/dd'});
            })
        </script>
        <title><g:layoutTitle/></title>
        <g:javascript library="jquery"/>
        <r:require module="jquery-ui"/>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="${resource(dir: 'semantic/dist', file: 'semantic.min.css')}" rel="stylesheet">
        <link href="${resource(dir: 'assets/css', file: 'style.css')}" rel="stylesheet">
        <link href="${resource(dir: 'alertifyjs/css', file: 'alertify.css')}" rel="stylesheet">
        <link href="${resource(dir: 'alertifyjs/css/themes', file: 'semantic.css')}" rel="stylesheet">
        <script src="${resource(dir: 'alertifyjs', file: 'alertify.js')}"></script>

        <script src="${resource(dir: 'semantic/dist', file: 'jquery-2.1.4.min.js')}"></script>
        <script src="${resource(dir: 'js', file: 'custom.js')}"></script>

        <style>
        body{
            padding: 5px;
            margin-top: -15px;
            background-color: white;
        }
        #tofixfooter {
            position: relative;
        }
        #footer{
            background:#3573A3;
            width:99%;
            bottom:0px;
            width:100%;
            height:80px;
            position:absolute;
        }
        </style>
        <g:layoutHead/>
        <r:layoutResources />
    </head>
    <body>
    <div id="tofixfooter">
        <div class="ui center aligned segment" style="background-color: #3573A3;">
            <img style="float: left; height: 80px;width: 80px" src="${resource(dir: 'img', file: 'deerwalk.png')}" alt="Logo" >   <p style="float:right;color: white; font-style: oblique; font-size: 20px" class="item"><b>Hello ${session.userName}</b><br> <g:link style="float: right;color: #ASD6F2" controller="user" action="logout" class="item"> <i class="power icon"></i>Logout </g:link></p>
            <h1 style="color:white"><b>BORROW RESERVE BOOK (BRB)</b></h1></img>

            &nbsp %{--<g:formatDate format="yyyy-MM-dd" date="${new Date()}"/>--}%
        </div>
        <div class="ui five item menu" style="margin: 0px auto;width: 98%;">
            <div class="ui large menu">
                <div class="ui simple dropdown link item">
                    <i class="icon book"></i> Book <i class="dropdown icon"></i>
                    <div class="menu">
                        <g:link controller="book" action="index" class="item"> <i class="list icon"></i>Book List  </g:link>
                        <g:if test="${session.userRole=="Admin"}">
                            <g:link controller="book" action="create" class="item"> <i class="plus icon"></i>New Book  </g:link>
                            <g:link controller="category" action="index" class="item"> <i class="list icon"></i>Book Category List  </g:link>
                            <g:link controller="category" action="create" class="item"> <i class="save icon"></i>New Book Category  </g:link>
                        </g:if>
                    </div>
                </div>


                &nbsp;&nbsp;
                <div style="float: right;border: 0px;" class="ui fluid category search">
                <g:form controller="book" action="search" method="POST">
                    <div class="ui icon input">
                        <input type="text" name="query" value="${params.query}" placeholder="Search By Book Title">
                        <i class="inverted circular search link icon"></i>
                    </div>
                </g:form>
            </div>
            <g:if test="${session.userRole=="Admin"}">
                <div class="ui simple dropdown link item">
                    <i class="icon users"></i> Users <i class="dropdown icon"></i>
                    <div class="menu">
                        <g:link controller="member" action="index" class="item"> <i class="user icon"></i>Member List  </g:link>
                        <g:link controller="member" action="create" class="item"> <i class="add user icon"></i>New Member  </g:link>
                        <g:link controller="user" action="create" class="item"> <i class="add user icon"></i>New User  </g:link>
                        <g:link controller="user" action="index" class="item"> <i class="user icon"></i>User List  </g:link>

                    </div>
                </div>
            </g:if>
            <g:link controller="reserve" action="index" class="item"> <i class="unordered list icon"></i>Reserve List  </g:link>
            <g:if test="${session.userRole=="Admin"}">
                <g:link controller="borrow" action="index" class="item"> <i class="database icon"></i>Borrow List  </g:link>
            </g:if>
        </div>
    </div>
        <g:layoutBody/>
        <r:layoutResources/>
    </div>

    <br><br><br>
        %{--<div id="footer">
            <p style="text-align: center;font-size: 20px;color: white;padding: 20px">© 2015, Deerwalk Institute of Technology. All rights reserved.</p>
        </div>--}%
    </body>
</html>
</g:if>