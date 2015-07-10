
<%@ page import="yourBook.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div style="width: 50%;margin-left: 320px">
		<div id="list-member" class="content scaffold-list" role="main">
			<h1>Member List</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="ui celled table">
			<thead>
					<tr>
					
						<g:sortableColumn property="rollNumber" title="${message(code: 'member.rollNumber.label', default: 'Roll Number')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'member.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'member.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'member.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'member.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="contact" title="${message(code: 'member.contact.label', default: 'Contact')}" />

                        <g:sortableColumn property="type" title="${message(code: 'member.type.label', default: 'Type')}" />

                        <g:sortableColumn property="email" title="${message(code: 'member.email.label', default: 'Email')}" />

                    </tr>
				</thead>
				<tbody>
				<g:each in="${memberInstanceList}" status="i" var="memberInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${memberInstance.id}">${fieldValue(bean: memberInstance, field: "rollNumber")}</g:link></td>
					
						<td>${fieldValue(bean: memberInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: memberInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: memberInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: memberInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: memberInstance, field: "contact")}</td>

                        <td>${fieldValue(bean: memberInstance, field: "type")}</td>

                        <td>${fieldValue(bean: memberInstance, field: "email")}</td>

                    </tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${memberInstanceCount ?: 0}" />
			</div>
		</div>
     </div>
	</body>
</html>
