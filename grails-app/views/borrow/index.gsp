
<%@ page import="yourBook.Borrow" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'borrow.label', default: 'Borrow')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <style>
        #test {
            background: white;
            border: 0 none;
            font: bold 12px Arial, Helvetica, Sans-serif;
            color: black;
            font-size: 17px;
            width: 100px;
            padding: 6px 15px 6px 35px;
            -webkit-border-radius: 20px;
            -moz-border-radius: 20px;
            border-radius: 20px;
            text-shadow: 0 2px 2px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px rgba(0, 0, 0, 0.2) inset;
            -moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px rgba(0, 0, 0, 0.2) inset;
            box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px rgba(0, 0, 0, 0.2) inset;
            -webkit-transition: all 0.7s ease 0s;
            -moz-transition: all 0.7s ease 0s;
            -o-transition: all 0.7s ease 0s;
            transition: all 0.7s ease 0s;
            height:30px;
        }
        #test:focus { width: 200px; }
        </style>
	</head>

	<body>

    <g:if test="${flash.message}">
        <div class="ui center aligned segment">
            <div class="ui positive message">
                <div class="header">
                    <h1 style="text-align: center">${flash.message}</h1>
                </div>
            </div>
        </div>
    </g:if>
    <h1 style="text-align: center">Borrow List</h1>
       <g:form id="test" action="search" style="float:right">
            <input name="query" type="text" placeholder="Roll Number.."></li><br>
        </g:form><br><br>
    <table class="ui celled table segment" style="margin: 0px auto;width:95%">
			<thead>
					<tr>
					
						<g:sortableColumn property="date_borrow" title="${message(code: 'borrow.date_borrow.label', default: 'Dateborrow')}" />
					
						<g:sortableColumn property="due_date" title="${message(code: 'borrow.due_date.label', default: 'Duedate')}" />
					
						<th><g:message code="borrow.book.label" default="Book" /></th>
					
						<th><g:message code="borrow.member.label" default="Member" /></th>
					
						<g:sortableColumn property="returnedDate" title="${message(code: 'borrow.returnedDate.label', default: 'Returned Date')}" />

                        <th>Action</th>
%{--
						<g:sortableColumn property="status" title="${message(code: 'borrow.status.label', default: 'Status')}" />
--}%
					</tr>
				</thead>
				<tbody>
				<g:each in="${borrowInstanceList}" status="i" var="borrowInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
%{--
						<td><g:link action="show" id="${borrowInstance.id}">${fieldValue(bean: borrowInstance, field: "date_borrow")}</g:link></td>
--}%
                        <td><g:formatDate format="yyyy/M/dd" date="${borrowInstance.date_borrow}" /></td>

						<td><g:formatDate format="yyyy/M/dd" date="${borrowInstance.due_date}" /></td>

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
--}%						<td><g:link controller="borrow" action="edit" params='[borrowId:"${borrowInstance.id}"]'> Edit</g:link></td>
                    </tr>
				</g:each>
		      </tbody>
			</table>
                <div class="ui center aligned segment" id="space">
                    <g:paginate total="${borrowInstanceCount ?: 0}" />
			    </div>
	</body>
</html>
