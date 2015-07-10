
<%@ page import="yourBook.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div id="show-user" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="ui red segment">

        <g:if test="${userInstance?.password}">
            <span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" />: </span>

            <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/>
        </g:if>
    </div>
    <div class="ui orange segment">

        <g:if test="${userInstance?.userName}">
            <span id="userName-label" class="property-label"><g:message code="user.userName.label" default="User Name" />: </span>

            <span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${userInstance}" field="userName"/></span>
        </g:if>
    </div>
    <div class="ui black segment">
        <g:if test="${userInstance?.role}">
            <span id="role-label" class="property-label"><g:message code="user.role.label" default="Role" />: </span>

            <span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${userInstance}" field="role"/></span>
    </g:if>

        <div class="ui yellow segment">
            <g:if test="${userInstance?.member}">
            <span id="member-label" class="property-label"><g:message code="user.member.label" default="Member" />: </span>

            <g:each in="${userInstance.member}" var="m">
                <span class="property-value" aria-labelledby="member-label"><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
            </g:each>
    </g:if>
            <g:form url="[resource:userInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
