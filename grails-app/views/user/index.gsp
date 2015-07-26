
<%@ page import="yourBook.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1 style="text-align: center"><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="ui center aligned segment">
                    <div class="ui positive message">
                        <div class="header">
                            <h1 style="text-align: center">${flash.message}</h1>
                        </div>
                    </div>
                </div>
            </g:if>
            <table class="ui celled table" style="margin: 0px auto;width: 95%;">
			<thead>
					<tr>

                        <g:sortableColumn style="text-align: center" property="userName" title="${message(code: 'user.userName.label', default: 'User Name')}" />

                        <g:sortableColumn style="text-align: center" property="role" title="${message(code: 'user.role.label', default: 'Role')}" />
						<g:sortableColumn style="text-align: center" property="password" title="${message(code: 'user.password.label', default: 'Password')}" />

					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td style="text-align: center"><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "userName")}</g:link></td>

                        <td style="text-align: center">${fieldValue(bean: userInstance, field: "role")}</td>

                        <td style="text-align: center">${fieldValue(bean: userInstance, field: "password")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
