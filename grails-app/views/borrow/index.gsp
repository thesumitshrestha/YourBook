
<%@ page import="yourBook.Borrow" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'borrow.label', default: 'Borrow')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <h1>Borrow List</h1>
			<table class="ui table segment">
			<thead>
					<tr>
					
						<g:sortableColumn property="date_borrow" title="${message(code: 'borrow.date_borrow.label', default: 'Dateborrow')}" />
					
						<g:sortableColumn property="due_date" title="${message(code: 'borrow.due_date.label', default: 'Duedate')}" />
					
						<th><g:message code="borrow.book.label" default="Book" /></th>
					
						<th><g:message code="borrow.member.label" default="Member" /></th>
					
						<g:sortableColumn property="returnedDate" title="${message(code: 'borrow.returnedDate.label', default: 'Returned Date')}" />
					
%{--
						<g:sortableColumn property="status" title="${message(code: 'borrow.status.label', default: 'Status')}" />
--}%

					</tr>
				</thead>
				<tbody>
				<g:each in="${borrowInstanceList}" status="i" var="borrowInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${borrowInstance.id}">${fieldValue(bean: borrowInstance, field: "date_borrow")}</g:link></td>
					
						<td><g:formatDate date="${borrowInstance.due_date}" /></td>
					
						<td>${fieldValue(bean: borrowInstance, field: "book")}</td>
					
						<td>${fieldValue(bean: borrowInstance, field: "member")}</td>


                        <g:if test="${borrowInstance.status == true}">
                            <td class="negative">"Not Returned"</td>
                        </g:if>
                        <g:else>
                            <td class="positive"><g:formatDate date="${borrowInstance.returnedDate}" /></td>

                        </g:else>
%{--
                        <td><g:formatBoolean boolean="${borrowInstance.status}" /></td>
--}%
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
                <div class="ui center aligned segment" id="space">
                    <g:paginate total="${borrowInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
