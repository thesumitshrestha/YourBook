
<%@ page import="yourBook.Type" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'type.label', default: 'Type')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
			<table class="ui table segment">
			<thead>
					<tr>
						<g:sortableColumn property="type" title="${message(code: 'type.type.label', default: 'Type')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${typeInstanceList}" status="i" var="typeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${typeInstance.id}">${fieldValue(bean: typeInstance, field: "type")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${typeInstanceCount ?: 0}" />
			</div>
	</body>
</html>
