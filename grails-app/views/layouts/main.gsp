<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <title><g:layoutTitle/></title>
    <g:layoutHead/>
    <r:layoutResources />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="${resource(dir: 'semantic/dist', file: 'semantic.min.css')}" rel="stylesheet">
    <script src="${resource(dir: 'semantic/dist', file: 'jquery-2.1.4.min.js')}"></script>
    <link href="${resource(dir: 'assets/css', file: 'style.css')}" rel="stylesheet">
    <link href="${resource(dir: 'alertifyjs/css', file: 'alertify.css')}" rel="stylesheet">
    <link href="${resource(dir: 'alertifyjs/css/themes', file: 'semantic.css')}" rel="stylesheet">
    <script src="${resource(dir: 'alertifyjs', file: 'alertify.js')}"></script>
    <script src="${resource(dir: 'js', file: 'jquery.msgBox.js')}"></script>
    <link href="${resource(dir: 'css', file: 'msgBoxLight.css')}" rel="stylesheet">

</head>
<body>
<div class="ui center aligned segment">
    <img style="float: left; height: 80px;width: 80px" src="${resource(dir: 'img', file: 'deerwalk.png')}" alt="Logo" >    <h1><b>BORROW RESERVE BOOK (BRB)</b></h1></img>
    &nbsp %{--<g:formatDate format="yyyy-MM-dd" date="${new Date()}"/>--}%
</div>




<div class="ui center aligned segment">


    <div class="ui large menu">
        <div class="ui simple dropdown link item">
            <i class="icon book"></i> Book <i class="dropdown icon"></i>
            <div class="menu">
                <g:link controller="book" action="index" class="item"> <i class="list icon"></i>Book List  </g:link>
                <g:link controller="book" action="create" class="item"> <i class="plus icon"></i>New Book  </g:link>
                <g:link controller="category" action="index" class="item"> <i class="list icon"></i>Book Category List  </g:link>
                <g:link controller="category" action="create" class="item"> <i class="save icon"></i>New Book Category  </g:link>

            </div>
        </div>


        &nbsp;&nbsp;
        <div class="right menu" style="float: right">
            <div class="ui icon input">
                <g:form controller="book" action="search" method="POST">
                    <div class="ui left icon input">
                        <input type="text" name="query" value="${params.query}" placeholder="Search By Book Title">
                        <i class="inverted circular search link icon"></i>
                    </div>
                </g:form>
            </div>
        </div>
        <div class="ui simple dropdown link item">
            <i class="icon users"></i> Users <i class="dropdown icon"></i>
            <div class="menu">
                <g:link controller="member" action="index" class="item"> <i class="user icon"></i>Member List  </g:link>
                <g:link controller="member" action="create" class="item"> <i class="add user icon"></i>New Member  </g:link>
            </div>
        </div>
        <g:link controller="reserve" action="index" class="item"> <i class="unordered list icon"></i>Reserve List  </g:link>

        <g:link controller="borrow" action="index" class="item"> <i class="database icon"></i>Borrow List  </g:link>
        <g:link controller="user" action="logout" class="item"> <i class="power icon"></i>Logout </g:link>

    </div>
</div>
<g:layoutBody/>
<r:layoutResources/>
</body>
</html>
%{--
<div class="ui large menu">
    <g:link controller="book" action="index" class="item active"> Book List  </g:link>
    <g:link controller="category" action="index" class="item">Book Category</g:link>
    <g:link controller="member" action="index" class="item"> Member List  </g:link>
    <g:link controller="type" action="index" class="item">Type </g:link>
    <i class="user icon"> </i> <g:link class ="item" controller="user" action="create">Add User </g:link>
    <div class="right menu">
        <div class="ui yellow labeled icon button">
            <i class="book icon"> </i> <g:link controller="book" action="create"> New Book </g:link>
        </div>
        <div class="ui icon input">
            <g:form action="search" method="POST">
            --}%
%{--<i class="search link icon"></i>--}%%{--
--}%
%{--<input type="text" name="query" value="${params.query}" placeholder="Search By Book Title">--}%%{--

                <div class="ui left icon input">
                    <input type="text" placeholder="Search By Book Title">
                    <i class="inverted circular search link icon"></i>
                </div>
            </g:form>
        </div>

    </div>
</div>--}%
