<%--
  Created by IntelliJ IDEA.
  User: sumitshrestha
  Date: 7/7/15
  Time: 4:00 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <link href="${resource(dir: 'css', file: 'login_style.css')}" rel="stylesheet">
    <script src="${resource(dir: 'js', file: 'jquery.placeholder.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'modernizr.custom.63321.js')}"></script>
    <style>
    @import url(http://fonts.googleapis.com/css?family=Raleway:400,700);
    body {
        background-image:url('${resource(dir: "images", file: "library3.jpg")}');
        -webkit-background-size: cover;
        -moz-background-size: cover;
        background-size: cover;
    }
    .container > header h1,
    .container > header h2 {
        color: #fff;
        text-shadow: 0 1px 1px rgba(0,0,0,0.7);
    }
        #message{
            color: white;
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 32px;
        }
    </style>
</head>

<body>
<div class="container">
    <header>
        <h1 style="font-size: 40px"><strong>BORROW RESERVE BOOK (BRB)</strong> </h1><br><br><br>
        <g:if test="${flash.message}">
            <div id="message" class="message" role="status">${flash.message}</div>
        </g:if>
    </header>
        <h1 style="text-align: center; font-size: 36px;color:white;">Login</h1>
        <section class="main">
            <g:form class="form-5 clearfix" action="authenticate">
                <p>
                    <input type="text" id="login" name="userName" placeholder="Username">
                    <input type="password" name="password" id="password" placeholder="Password">
                </p>
                <button type="submit" name="submit">
                    <i> Hi</i>
                    <span>Sign in</span>
                </button>
            </g:form>​​​​
        </section>
</div>
</body>
</html>