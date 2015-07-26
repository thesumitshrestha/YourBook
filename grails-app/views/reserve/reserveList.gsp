<%--
  Created by IntelliJ IDEA.
  User: sumitshrestha
  Date: 7/15/15
  Time: 12:09 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Reserve List</title>
    <style type="text/css">
    #space a{
        padding-left: 15px;
        padding-right: 15px;
    }
    </style>
</head>
<body>
<h1 style="text-align: center">Reserve List</h1>
<g:if test="${flash.message}">
    <div class="ui center aligned segment">
        <div class="ui positive message">
            <div class="header">
                <h1 style="text-align: center">${flash.message}</h1>
            </div>
        </div>
    </div>
</g:if>
<table class="ui celled table" style="margin: 0px auto;width: 1000px;">
    <thead>
    <tr>
        <th> Book </th>
        <th> Member </th>
        <g:if test="${session.userRole=="Admin"}">
            <th> Action </th>
        </g:if>
    </tr>
    </thead>
    <tbody>

<g:each in="${reserveInstance}" status="i" var="reserveInstanceList">
    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
        <g:if test="${reserveInstanceList.id}">
            <td><div class="title_column" id="${reserveInstanceList.id}">${fieldValue(bean: reserveInstanceList, field: "book")}</div></td>
            <td><div class="title_column" id="${reserveInstanceList.id}">${fieldValue(bean: reserveInstanceList, field: "member")}</div></td>

            <g:if test="${session.userRole=="Admin"}">
                <td>
                    <div class="ui buttons">
                        <button class="ui button"><i class="mail icon"> </i>  <g:link action="mail" params='[mId:"${reserveInstanceList.member.id}",BId:"${reserveInstanceList.book.id}"]'>Send Mail</g:link>
                        </button>
                        <div class="or"></div>
                        <button class="ui button"> <g:link onclick="return confirm('Press OK to Reserve');" controller="reserve" action="deleteReserve" params='[rid:"${reserveInstanceList.id}"]' >Delete</g:link>
                    </div>
                </td>
            </g:if>

        </g:if>

    </tr>
</g:each>
    </tbody>
</table>
<div class="pagination">
    <div class="ui center aligned segment" id="space">
        <g:paginate total="${reserveInstanceCount ?: 0}" />
    </div>
</div>
</body>
</html>
